
create database Course

use Course

create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(80),
[Surname] nvarchar(100),
[Age] int,
[Email] nvarchar(200),
[Address] nvarchar(200)
)

INSERT INTO Students([Name], [Surname], [Age], [Email], [Address]) 
VALUES 
    ('Arzu', 'Kerimova', 26, 'arzu@gmail.com', 'Yasamal'),
    ('Aysu', 'Eliyeva', 24, 'aysu@gmail.com', 'Genclik'),
    ('Meryem', 'Eliyeva', 22, 'meryem@gmail.com', 'Genclik'),
    ('Nesir', 'Kerimov', 29, 'nesir@gmail.com', 'Sumqayit'),
    ('Omer', 'Hesenov', 20, 'omar@gmail.com', 'Nerimanov')


create table StudentArchives(
[Id] int primary key identity(1,1),
[Name] nvarchar(80),
[Surname] nvarchar(100),
[Age] int,
[Email] nvarchar(200),
[Address] nvarchar(200),
[Operation] nvarchar(20),
[Date] datetime
)


create trigger trg_studentsArchives on Students
after delete
as
begin
insert into StudentArchives([Name],[Surname],[Age],[Email],[Address],[Operation],[Date])
select [Name],[Surname],[Age],[Email],[Address],'deleted',GETDATE() from deleted
end


 
select * from Students
select * from StudentArchives


create procedure usp_deleteStudentsById
@id int
as
delete from Students where [Id]= @id

exec usp_deleteStudentsById 1


