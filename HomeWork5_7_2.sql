USE [MyJoinsDB]
GO

/*
Зробити тип зв'язку між табличками Bio і Person один до одного.
Щоб максимум один рядок для персона міг існувати в Bio.
Також цей індекс прискорить пошук по полю PersonId в табличці Bio
*/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Bio]
	ON [dbo].[Bio] ([PersonId] ASC)
	ON [PRIMARY]
GO

-------------------------------------------------------------------


/*
Індекс для прискорення пошуку по CustomerId
*/
CREATE NONCLUSTERED INDEX [ix_customerId] 
	ON [dbo].[Orders]([CustomerId] ASC)
	ON [PRIMARY]
GO



