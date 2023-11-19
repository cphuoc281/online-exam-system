
Create Database Exam
Use Exam


Create Table Account(
	AccountID Int IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
	UserName VARCHAR(50),
	[Password] VARCHAR(50),
	Phone VARCHAR(20),
	Email VARCHAR(50),
	DOB VARCHAR(50),
	[Status] INT DEFAULT 1,
	[Role] Int
)

Create Table [Collection](
	CollectionID Int IDENTITY(1,1) PRIMARY KEY,
	[Name] NVARCHAR(50),
	ExamNumber Int,
	[AccountID] Int References Account(AccountID) -- Lấy tên người tạo môn học thông AccountID
)



CREATE TABLE BankQuestion
(
    BankQuestionID int IDENTITY(1,1) PRIMARY KEY,
    Detail nvarchar(max),
    [Image] text, 
    AnswerA nvarchar(max),
    AnswerB nvarchar(max),
    AnswerC nvarchar(max), 
    AnswerD nvarchar(max),
    TrueAnswer varchar(10),
    CollectionID Int References [Collection](CollectionID), --Lấy tên môn học thông qua CollectionID
    [AccountID] Int References Account(AccountID) 
);




Create Table Exam(
	ExamID Int IDENTITY(1,1) PRIMARY KEY,
	[Name] NVarchar(50),
	[Password] Varchar(50),
	TimeLimit int,
	[Date] Varchar(50),	
	QuestionNumber Int,
	AccountID Int References Account(AccountID),
	CollectionID Int References [Collection](CollectionID)
)

Create Table Enrollment(	
	AccountID Int References Account(AccountID),
	ExamID Int References Exam(ExamID),
	CollectionID Int References [Collection](CollectionID),
	Score float,
	Primary Key(AccountID, ExamID)
)


---------------------------------------------------------------------------
--- 0 la admin, 1 la giao vien, 2 la sinh vien
INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Nguyen', 'Minh', 'admin', '123', '0905123456', 'admin@gmail.com', '2002-07-12', 0);

INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Dao', 'Thi Hong', 'hong', '123', '0913555123', 'daothihong.com', '1992-09-21', 1);

INSERT INTO Account (FirstName, LastName, UserName, [Password], Phone, Email, DOB, [Role])
VALUES ('Le', 'Quy', 'quy', '123', '0905111333', 'emwilson@example.com', '1998-07-07', 2);
----------------------------------------------------
--Add collection status 1 la hien 0 la an
INSERT INTO Collection ([Name], AccountID)
VALUES ('World history', 2);

INSERT INTO Collection ([Name], AccountID)
VALUES ('Animal quizz', 2 );

INSERT INTO Collection ([Name], AccountID)
VALUES (N'Trắc nghiệm địa lý', 2);
-----------------------------------------------------------
/*UPDATE Collection 
SET ExamNumber = 5
WHERE CollectionID = 1;*/

-----------------------------------------------------------
-- Add question
INSERT INTO BankQuestion (Detail,[Image], AnswerA, AnswerB, AnswerC, AnswerD, TrueAnswer, CollectionID, [AccountID] )
VALUES ('Who is credited with discovering America?', 'images/plus.png', 'Christopher Columbus', 'Marco Polo', 'Vasco da Gama', 'Amerigo Vespucci', 'A', 1, 2);



-----------------------------------------------




