
select [FullName] from Teachers
union
select [FullName] from Students

select [FullName] from Teachers
union all
select [FullName] from Students

select [FullName] from Teachers
intersect
select [FullName] from Students

select [FullName] from Teachers
except
select [FullName] from Students

--delete from Doctors
--truncate table Doctors

Select COUNT(*) as 'Count',Age
From Students
GROUP BY Age
Order By Age Desc


DECLARE @Counter INT 
SET @Counter=1
WHILE ( @Counter <= 10)
BEGIN
    PRINT 'The counter value is = ' + CONVERT(NVARCHAR,@Counter)
    SET @Counter  = @Counter  + 1
END

Select GETDATE()

create table StudentLogs(
[Id] int primary key identity(1,1),
[StudentId] int,
[Opeartion] nvarchar(20),
[Date] datetime
)

create trigger trg_writeLogAfterCreate on Students
after insert
as
begin
insert into StudentLogs ([StudentId],[Opeartion],[Date])
select [Id],'insert',GETDATE() from inserted
end


insert into Students([FullName],[Email],[Age],[Address])
values ('Omer Elesgerli','omer2@gmail.com',16,'Xetai')

select * from StudentLogs
select * from Students

create trigger  trg_writeLogAfterEdit3 on Students
after update
as
begin
 insert into StudentLogs([StudentId],[Opeartion],[Date])
 select [Id],'Update',GETDATE() from deleted
end

update  Students
set [Email]='test3@gmail.com'
where [Id]=1


select * from StudentLogs where [Opeartion] ='update'
order by [Date] desc


create table EmployeeLogs(
[Id] int primary key identity(1,1),
[EmployeeName] nvarchar(100),
[OldEmail] nvarchar(100),
[NewEmail] nvarchar(100),
[Operation] nvarchar(20),
[Date] datetime
)



create trigger  trg_writeLogAfterEditEmail on Employees
after update
as
begin
declare @oldEmail nvarchar(200)=(select [Email] from deleted)
declare @name nvarchar(200)=(select [Name] from deleted)
declare @newEmail nvarchar(200)=(select [Email] from inserted)
 insert into EmployeeLogs([EmployeeName],[OldEmail],[NewEmail],[Operation],[Date])
 values (@name,@oldEmail,@newEmail,'Update',GETDATE() )
end

select * from Employees
select * from EmployeeLogs

update Employees
set [Email] = 'salam@gmail.com'
where [Id]=2