create database fourseasonhotels;
use fourseasonhotels;

create table Hotels(
Hotel_id int primary key,
HotelName varchar(50),
city varchar(15), 
TotalRooms int);

create table Room(
Room_id int primary key, 
Hotel_id int,
floor_num int,
Room_num int, 
status_ varchar(12));

create table booking(
Booking_id int primary key, 
Room_id int,
Guest_id int, 
CheckInDate date, 
CheckOutDate date);

create table Guest(
Guest_id int primary key, 
FirstName varchar(15),
LastName varchar(15), 
contactNumber varchar(20), 
CheckinTime datetime, 
CheckOutTime datetime);

alter table Room
add foreign key(Hotel_id) references Hotels(Hotel_id) on delete set null;

alter table booking
add foreign key(Room_id) references Room(Room_id) on delete set null,
add foreign key(Guest_id) references Guest(Guest_id) on delete set null;

create table PermenantRecordTable(
Record_id int primary key,
Guest_id int, 
CheckInDate date, 
CheckOutDate date);

alter table PermenantRecordTable
add foreign key(Guest_id) references Guest(Guest_id) on delete set null;

create table Employee(
Emp_id int primary key, 
Hotel_id int,
EmployeeName varchar(25),
position varchar(15));

alter table Employee
add foreign key(Hotel_id) references Hotels(Hotel_id) on delete set null;

create table Receptionist(
Receptionist_id int primary key, 
Emp_id int, 
sup_id int);
ALTER TABLE Receptionist
ADD CheckIndate date;

alter table Receptionist
add foreign key(Emp_id) references Employee(Emp_id) on delete set null,
add foreign key(Sup_id) references Employee(Emp_id) on delete set null;

create table CheckIn(
CheckinId int primary key,
Guest_id int,
Receptionist_id int);

show tables;

INSERT INTO Hotels (Hotel_id, HotelName, city, TotalRooms) VALUES
(1, 'Four Seasons Karachi', 'Karachi', 40),
(2, 'Four Seasons Lahore', 'Lahore', 40),
(3, 'Four Seasons Multan', 'Multan', 40),
(4, 'Four Seasons Islamabad', 'Islamabad', 40),
(5, 'Four Seasons Peshawar', 'Peshawar', 40);

INSERT INTO Room (Room_id, Hotel_id, floor_num, Room_num, status_) VALUES
(1, 1, 1, 101, 'Vacant'),
(2, 1, 1, 102, 'Vacant'),
(3, 1, 2, 201, 'Vacant'),
(4, 1, 2, 202, 'Vacant'),
(5, 2, 1, 101, 'Vacant'),
(6, 2, 1, 102, 'Vacant'),
(7, 2, 2, 201, 'Vacant'),
(8, 2, 2, 202, 'Vacant'),
(9, 3, 1, 101, 'Vacant'),
(10, 3, 1, 102, 'Vacant');

INSERT INTO Guest (Guest_id, FirstName, LastName, contactNumber, CheckinTime, CheckOutTime) VALUES
(1, 'John', 'Doe', '1234567890', '2024-01-15 14:00:00', '2024-01-20 12:00:00'),
(2, 'Jane', 'Smith', '9876543210', '2024-02-01 15:30:00', '2024-02-10 11:00:00'),
(3, 'Alice', 'Johnson', '5555555555', '2024-03-10 16:00:00', '2024-03-15 10:00:00'),
(4, 'Bob', 'Williams', '9998887777', '2024-04-05 13:45:00', '2024-04-12 09:30:00');

INSERT INTO booking (Booking_id, Room_id, Guest_id, CheckInDate, CheckOutDate) VALUES
(1, 1, 1, '2024-01-15', '2024-01-20'),
(2, 2, 2, '2024-02-01', '2024-02-10'),
(3, 3, 3, '2024-03-10', '2024-03-15'),
(4, 4, 4, '2024-04-05', '2024-04-12');

INSERT INTO PermenantRecordTable (Record_id, Guest_id, CheckInDate, CheckOutDate) VALUES
(1, 1, '2024-01-15', '2024-01-20'),
(2, 2, '2024-02-01', '2024-02-10'),
(3, 3, '2024-03-10', '2024-03-15'),
(4, 4, '2024-04-05', '2024-04-12');

INSERT INTO Employee (Emp_id, Hotel_id, EmployeeName, position) VALUES
(1, 1, 'Atiya Ali', 'Manager'),
(2, 1, 'Kamran', 'Receptionist'),
(3, 2, 'Sadia', 'Manager'),
(4, 2, 'Saad', 'Receptionist');

INSERT INTO Receptionist (Receptionist_id, Emp_id, sup_id, CheckIndate) VALUES
(1, 2, 1, '2024-01-15'),
(2, 4, 3, '2024-02-01');

INSERT INTO CheckIn (CheckinId, Guest_id, Receptionist_id) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2);

select * from hotels;
select * from room;
select * from guest;
select * from booking;
select * from checkin;
select * from employee;
select * from permenantrecordtable;
select * from receptionist;
