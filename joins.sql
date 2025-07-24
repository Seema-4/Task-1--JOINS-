-- TASK 1 ON JOINS IN SQL
CREATE TABLE Staffs (
    StaffID INT,
    StaffName VARCHAR(50),
    DeptID INT
);

INSERT INTO Staffs VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', 104),
(5, 'Eva', 105),
(6, 'Frank', 106),
(7, 'Grace', NULL),
(8, 'Hannah', 108),
(9, 'Ian', 109),
(10, 'Jack', NULL);

CREATE TABLE Teamss (
    TeamID INT,
    TeamName VARCHAR(50)
);

INSERT INTO Teamss VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing'),
(110, 'Legal'),
(111, 'Operations'),
(112, 'Sales'),
(106, 'Logistics'),
(113, 'Strategy'),
(114, 'Support');

SELECT * FROM Staffs;
SELECT * FROM Teamss;

-- INNER JOIN: Retrieve staff names along with their team names
-- Only includes staff who are assigned to a team that exists

SELECT Staffs.StaffID, Staffs.StaffName, Teamss.TeamName        
FROM Staffs
INNER JOIN Teamss
ON Staffs.DeptID = Teamss.TeamID;  

-- FULL OUTER JOIN Simulation:
-- Combine all staff and teams, matching where possible

SELECT Staffs.StaffID, Staffs.StaffName, Teamss.TeamName
FROM Staffs
LEFT JOIN Teamss ON Staffs.DeptID = Teamss.TeamID
UNION
SELECT Staffs.StaffID, Staffs.StaffName, Teamss.TeamName
FROM Staffs
RIGHT JOIN Teamss ON Staffs.DeptID = Teamss.TeamID;

-- LEFT OUTER JOIN:
-- Get all staff, including those with no team assigned

SELECT Staffs.StaffID, Staffs.StaffName, Teamss.TeamName
FROM Staffs
LEFT JOIN Teamss ON Staffs.DeptID = Teamss.TeamID;

-- RIGHT OUTER JOIN:
-- Get all teams, including those with no staff assigned

SELECT Staffs.StaffID, Staffs.StaffName, Teamss.TeamName
FROM Staffs
RIGHT JOIN Teamss ON Staffs.DeptID = Teamss.TeamID;

-- CROSS JOIN: Generate all possible combinations of staff and teams
-- Each staff member is paired with every team regardless of any condition

SELECT Staffs.StaffName, Teamss.TeamName
FROM Staffs
CROSS JOIN Teamss;


