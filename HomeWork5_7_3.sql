USE [MyJoinsDB]
GO

Create View vPersonContacts As  
	Select p.Name, p.PhoneNumber, b.Address
	From Person p	
		Left Join Bio b ON p.Id = b.PersonId
Go 

Create View vSinglePerson As 
	Select p.Name, p.PhoneNumber, b.DOB
	From Person p
		Inner Join Bio b ON p.Id = b.PersonId
	Where b.MaritalStatus = 'неодружений'
Go

Create View vManager As 
	Select p.Name, p.PhoneNumber, b.DOB
	From Person p
		Inner Join Position po ON p.Id = po.PersonId
		Inner Join Bio b ON p.Id = b.PersonId
	Where po.Position = 'менеджер'
Go