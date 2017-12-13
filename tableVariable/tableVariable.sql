use [tempdb]
go

declare @tblRange TABLE
(
      [id] int not null identity(1,1)

    , [min]  numeric(5,2) null
    , [max]  numeric(5,2) null

    , [range]  AS 
            (
                cast
					(
						case 
				            when [min]=[max] then CONVERT([varchar],CONVERT([float],[min])) 
					        else (
                            CONVERT([varchar],CONVERT([float],[min]))
                                +' - '
                                + CONVERT([varchar],CONVERT([float],[max]))
                        )			 
						end
					as varchar(30)
				)
            ) PERSISTED

)

insert into @tblRange
(
    [min], [max] 
)
select 3,3
union
select 0.5,10

select *
from   @tblRange