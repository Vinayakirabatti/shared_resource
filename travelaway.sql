create database TravelAwayDB
go


create table Roles
(
[RoleId] numeric(1) identity constraint roles_pk primary key,
[RoleName] varchar(20)
)
go


create table Users 
(
[userid] int identity constraint users_pk primary key,
[firstname] varchar(20),
[lastname] varchar(20),
[contactnumber] numeric(10),
[emailId] varchar(20),
[password] varchar(16),
[gender] varchar(1),
[dateOfBirth] date,
[address] varchar(50),
[RoleId] numeric(1) constraint role_id_fk foreign key references Roles(roleid)
)
go

drop table category
create table category
(
[categoryid] numeric(1) identity primary key,
[categoryname] varchar(20)
)
go

create table places
(
[placeid] int identity primary key,
[title] varchar(40),
[description] varchar(100),
[place_image] image,
[categoryid] numeric(1) constraint categoryid_fk foreign key references category([categoryid])
)
go

create table package
(
[packid] int identity primary key,
[placeid] int constraint category_id_fk foreign key references places([placeid]),
[places_to_visit] varchar(30),
[description] varchar(50),
[noofdays] int,
[price] numeric(15),
[accomondation] bit
)
go

create table PackageBookingDetails
(
 [booking_id] int identity primary key,
 [userid] int constraint user_id_fk foreign key references Users([userid]),
 [packid] int constraint packageid_id_fk foreign key references package([packid]),
 [contact_num] numeric(10),
 [res_address] varchar(50),
 [date_of_travel] date,
 [adultscount] int,
 [childrencount] int
)
go

create table AccomdationDetails
(
 [accid] int identity primary key,
 [booking_id] int constraint packagedetails_id_fk foreign key references PackageBookingDetails([booking_id]),
 [city] varchar(10),
 [room_type] varchar(1),
 [noofrooms] int,
 [cost] int,
 [payment_status] bit
)
go

create table Hotel(
 [hotel_id] integer,
 [hotelname] varchar(20),
 [rating] numeric(1),
 [single_room_price] int,
 [double_room_price] int,
 [deluxe_room_price] int, 
 [suite_room_price] int,
 [city] varchar(20)
)
go