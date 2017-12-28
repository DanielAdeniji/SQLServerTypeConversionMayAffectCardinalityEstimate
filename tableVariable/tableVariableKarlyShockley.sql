set nocount on;
go

set XACT_ABORT on
go

declare @tblRange2 table
( 
	[min] numeric(5,2) null 
) 

select [min] = convert(varchar, [min]) 
from   @tblRange2 

select [min] = a.[min] 
from   @tblRange2 a 
where  convert (varchar, a.[min]) = 'abc' 