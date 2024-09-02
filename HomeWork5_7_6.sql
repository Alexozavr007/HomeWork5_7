Use MyFuncDB
Go

Create Proc spPersonContacts As
Begin
	Select p.Name, p.PhoneNumber, b.Address
	From Person p	
		Left Join Bio b ON p.Id = b.PersonId
End
Go 

Create Proc spSinglePerson As
Begin
	Select p.Name, p.PhoneNumber, b.DOB
	From Person p
		Inner Join Bio b ON p.Id = b.PersonId
	Where b.MaritalStatus = 'неодружений'
End
Go

Create Proc spManager As
Begin
	Select p.Name, p.PhoneNumber, b.DOB
	From Person p
		Inner Join Position po ON p.Id = po.PersonId
		Inner Join Bio b ON p.Id = b.PersonId
	Where po.Position = 'менеджер'
End
Go

/* Повертає в бітовому визначенні статус "одруженості" */
Create Function IsSingleByMarital(
	@marStatus varchar(50)
)
Returns bit
As Begin 
	declare @ret bit
	If  @marStatus = 'неодружений'
		set @ret = 1
	else 
		set @ret = 0
	return @ret
End 
Go

/* приклад використання функ. */
select *
	,dbo.IsSingleByMarital(MaritalStatus) as IsSingle
from bio