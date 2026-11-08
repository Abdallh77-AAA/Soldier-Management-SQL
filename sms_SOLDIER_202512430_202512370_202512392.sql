CREATE TABLE ranks (
rank_id int primary key,
rank_name varchar(100) not null unique,
rank_level int check (rank_level between 1 and 6)
);
--create table of units
CREATE TABLE units (
unit_id int primary key,
unit_name varchar(100) not null unique,
location varchar(100) not null
);
-- create table of missions
CREATE TABLE  missions (
mission_id int primary key,
mission_name varchar(100) not null unique,
start_date date not null,
end_date date check(end_date >= start_date )
);
-- create table of soldiers
CREATE TABLE soldiers (
soldier_id  int GENERATED ALWAYS AS IDENTITY PRIMARY KEY ,
service_number varchar(100) not null unique,
first_name varchar(50) not null,
last_name varchar(50) not null,
date_of_birth date not null,
enlistment_date date check( enlistment_date > date_of_birth  ) not null,
status VARCHAR(20) NOT NULL DEFAULT 'Active'
check(status IN ('Active','On Leave','Retired')),
rank_id INT NOT NULL,
unit_id INT NOT NULL,
FOREIGN KEY (rank_id) REFERENCES ranks (rank_id),
FOREIGN KEY (unit_id) REFERENCES units (unit_id)
);
--creat table of soldier mission
CREATE TABLE soldier_missions (
soldier_id INT NOT NULL,
mission_id INT NOT NULL,
mission_role  VARCHAR(50) NOT NULL,
primary key(soldier_id,mission_id),
FOREIGN KEY (soldier_id) REFERENCES soldiers (soldier_id),
FOREIGN KEY (mission_id) REFERENCES missions (mission_id)
);

-- insert data for table sanks
INSERT INTO ranks(rank_id,rank_name,rank_level) values
(1,'Private',1),
(2,'Corporal',2),
(3,'Sergeant',3),
(4,'Lieutenant',4),
(5,'Captian',5),
(6,'Major',6);

--insert data for table units
INSERT INTO units (unit_id,unit_name,location) values
(1,'Alpha Company','North Camp'),
(2,'Bravo Campany','South Camp'),
(3,'Charle Company','East Camp'),
(4,'Delta Company','West Camp'),
(5,'Signals Unit','Central Camp'),
(6,'Medical Unit','Central Camp');


--insert data for table missions
INSERT INTO missions (mission_id,mission_name,start_date,end_date) values
(1,'Exercise Falcon','2025-02-03','2025-02-28'),
(2,'Flood Relief','2025-04-14','2025-05-30'),
(3,'Border Patrol','2025-07-01',null),
(4,'Pease Support','2025-09-15',null),
(5,'Field Medical Camp','2025-01-12','2026-01-23');


--insert data for table soldiers
INSERT INTO soldiers (soldier_id, first_name, last_name, service_number, date_of_birth, enlistment_date, status, rank_id, unit_id) 
OVERRIDING SYSTEM VALUE VALUES
(31, 'Abdallh', 'Allaelden', 'ST-202512430', '2001-05-15', '2023-01-10', 'Active', 1, 1),
(32, 'Mohamed', 'Omer', 'ST-202512428', '1998-08-20', '2022-03-15', 'Active', 5, 1),
(33, 'Abdualrhman', 'Mohamed', 'ST-202512427', '2000-11-05', '2024-02-01', 'Active', 2, 5);

--insert 30 soldier
INSERT INTO soldiers (soldier_id, first_name, last_name, service_number, date_of_birth, enlistment_date, status, rank_id, unit_id) 
OVERRIDING SYSTEM VALUE VALUES
(1, 'Ahmed', 'Ali', 'ST-1001', '1995-03-12', '2020-01-10', 'Active', 1, 1),
(2, 'Bilal', 'Hassan', 'ST-1002', '1996-05-22', '2020-02-15', 'Active', 2, 1),
(3, 'Tariq', 'Mahmoud', 'ST-1003', '1994-07-19', '2020-03-01', 'Active', 1, 2),
(4, 'Khaled', 'Omar', 'ST-1004', '1997-01-11', '2020-03-20', 'Active', 3, 2),
(5, 'Ziad', 'Youssef', 'ST-1005', '1993-09-05', '2020-04-10', 'Active', 2, 3),
(6, 'Saeed', 'Ibrahim', 'ST-1006', '1995-11-30', '2020-05-01', 'Active', 1, 3),
(7, 'Hamza', 'Nasr', 'ST-1007', '1998-02-14', '2020-06-12', 'Active', 4, 4),
(8, 'Osama', 'Fahd', 'ST-1008', '1992-06-25', '2020-07-01', 'Active', 2, 4),
(9, 'Amr', 'Adel', 'ST-1009', '1996-10-08', '2020-08-15', 'Active', 3, 5),
(10, 'Rami', 'Salim', 'ST-1010', '1994-12-03', '2020-09-10', 'Active', 1, 5),
(11, 'Faisal', 'Zaki', 'ST-1011', '1995-04-17', '2020-10-01', 'Active', 2, 6),
(12, 'Murad', 'Nabil', 'ST-1012', '1997-08-29', '2020-10-20', 'Active', 1, 6),
(13, 'Yasser', 'Kamal', 'ST-1013', '1993-01-25', '2020-11-05', 'Active', 3, 1),
(14, 'Nader', 'Samir', 'ST-1014', '1996-03-14', '2020-11-25', 'Active', 2, 2),
(15, 'Basem', 'Taha', 'ST-1015', '1995-07-09', '2020-12-01', 'Active', 1, 3),
(16, 'Adel', 'Ramadan', 'ST-1016', '1998-05-18', '2020-12-15', 'Active', 4, 4),
(17, 'Majed', 'Sami', 'ST-1017', '1992-10-12', '2021-01-10', 'Active', 2, 5),
(18, 'Hossam', 'Badri', 'ST-1018', '1994-02-28', '2021-01-20', 'Active', 1, 6),
(19, 'Ibrahim', 'Galal', 'ST-1019', '1996-09-15', '2021-02-05', 'Active', 3, 1),
(20, 'Ashraf', 'Morsi', 'ST-1020', '1995-12-07', '2021-02-20', 'Active', 2, 2),
(21, 'Waleed', 'Qassem', 'ST-1021', '1993-04-21', '2021-03-01', 'Active', 1, 3),
(22, 'Zain', 'Sultan', 'ST-1022', '1997-06-11', '2021-03-15', 'Active', 4, 4),
(23, 'Sami', 'Tariq', 'ST-1023', '1994-08-30', '2021-04-01', 'Active', 2, 5),
(24, 'Nawaf', 'Rashed', 'ST-1024', '1996-01-05', '2021-04-20', 'Active', 1, 6),
(25, 'Faris', 'Jamil', 'ST-1025', '1995-03-27', '2021-05-01', 'Active', 3, 1),
(26, 'Tamer', 'Hadi', 'ST-1026', '1992-11-19', '2021-05-15', 'Active', 2, 2),
(27, 'Munir', 'Zuhair', 'ST-1027', '1998-07-02', '2021-06-01', 'Active', 1, 3),
(28, 'Zohair', 'Ayman', 'ST-1028', '1994-09-24', '2021-06-15', 'Active', 4, 4),
(29, 'Luqman', 'Bashir', 'ST-1029', '1996-12-18', '2021-07-01', 'Active', 2, 5),
(30, 'Rayyan', 'Karam', 'ST-1030', '1995-05-08', '2021-07-15', 'Active', 1, 6);

-- insert conation 2 soldier 31,32
INSERT INTO soldier_missions (soldier_id, mission_id, mission_role) VALUES
(31, 1, 'Leader'),
(32, 1, 'Member');
 
UPDATE soldiers
set rank_id = 1
where soldier_id = 32;

UPDATE soldiers
set unit_id = 2
where soldier_id = 33;

--C1 select * last 10 soldier they interd
select * from soldiers
order by soldier_id DESC
LIMIT 10;

-- C2 select * first 10 soldier they interd from befor query
select * from (
select * from soldiers
order by soldier_id DESC
LIMIT 10
) as recent
order by soldier_id ASC;

--  C3 select * the soldier they has these number(10,15,20)
select * from soldiers
where soldier_id IN (10,15,20);

-- C4 SELECT * the soldier where soldier_id in (p+10,p+15,p+20)

select * from soldiers
where soldier_id IN (0+10,0+15,0+20);

-- C5  select soldier where status Active and soldier_id from 10 to 20
select * from soldiers
where status = 'Active'
and soldier_id between 10 and 20;

--C6 select soldiers name with sanks name 
select  s.soldier_id, first_name,last_name,r.rank_name
from soldiers s
join ranks r ON s.rank_id = r.rank_id
order by r.rank_level DESC,s.last_name ASC;


--C7 -- C7 select: Get active soldiers in unit 1 with rank, unit details, and location
select s.first_name,s.last_name,r.rank_name,u.unit_name,u.location
from soldiers s
join ranks r ON s.rank_id = r.rank_id
join units u ON s.unit_id = u.unit_id
where s.status = 'Active'
and u.unit_id = 1;


-- C8 select: Retrieve soldiers assigned to a specific mission (Mission ID = 1, Exercise Falcon) along with their roles, unit names, and mission names
SELECT m.mission_name, s.first_name, s.last_name, sm.mission_role, u.unit_name
FROM soldier_missions sm
JOIN soldiers s ON sm.soldier_id = s.soldier_id
JOIN missions m ON sm.mission_id = m.mission_id
JOIN units u ON s.unit_id = u.unit_id
WHERE sm.mission_id = 1;

-- C9 select * soldiers they are not have missions
select s.first_name,s.last_name
from soldiers s
left join soldier_missions sm ON s.soldier_id = sm.soldier_id
where sm.mission_role is null;

-- C10 select * soldiers count with units name
select u.unit_name,count(s.soldier_id) As total_Count
from units u
join soldiers s ON s.unit_id = u.unit_id
group by u.unit_name
order by total_count DESC;

-- D 1
-- Analyze query performance before adding an index
EXPLAIN SELECT * FROM soldiers WHERE last_name= 'Mugisha';
-- Create an index on the last_name column to improve search speed
CREATE INDEX idx_soldiers_last_name ON soldiers (last_name);
-- Disable sequential scan to force the database to use the index
SET enable_seqscan = off;
-- Re-analyze the query performance to verify the index is being used (Index Scan)
EXPLAIN SELECT * FROM soldiers WHERE last_name = 'Mugisha';

-- D 2
--creat a view for soldier profiles conacting id,full name,rank,unit,location and status
CREATE VIEW v_soldier_profile AS
select s.soldier_id,
s.first_name || ' ' || s.last_name as full_name,
r.rank_name,
u.unit_name,
u.location,
s.status
from soldiers s
join ranks r ON s.rank_id = r.rank_id
join units u ON s.unit_id = u.unit_id;

select * from v_soldier_profile;

-- select * in v_soldier_profile whewre unit name = Alpha Company and order by full name
select * from v_soldier_profile
where unit_name = 'Alpha Company'
order by full_name;


















