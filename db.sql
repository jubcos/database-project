-- Database creation
CREATE DATABASE TaskManagementDB;
USE TaskManagementDB;

-- Table creation
CREATE TABLE Employee (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100)
);

CREATE TABLE Manager (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    project_id BIGINT,
    CONSTRAINT fk_project FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE Project (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    startDate DATE,
    endDate DATE
);

CREATE TABLE Task (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    description TEXT,
    project_id BIGINT,
    CONSTRAINT fk_project_task FOREIGN KEY (project_id) REFERENCES Project(id)
);

CREATE TABLE Employee_Task (
    employee_id BIGINT,
    task_id BIGINT,
    PRIMARY KEY (employee_id, task_id),
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES Employee(id),
    CONSTRAINT fk_task FOREIGN KEY (task_id) REFERENCES Task(id)
);

-- Sample data insertion
INSERT INTO Employee (firstName, lastName) VALUES ('John', 'Doe'), ('Jane', 'Smith');
INSERT INTO Project (name, startDate, endDate) VALUES ('Project1', '2024-01-01', '2024-12-31'), ('Project2', '2024-02-01', '2024-11-30');
INSERT INTO Task (title, description, project_id) VALUES ('Task1', 'Description1', 1), ('Task2', 'Description2', 2);

INSERT INTO Manager (name, department, project_id) VALUES ('Manager1', 'HR', 1), ('Manager2', 'Finance', 2);
INSERT INTO Employee_Task (employee_id, task_id) VALUES (1, 1), (2, 2);

-- Select queries to verify data
SELECT * FROM Employee;
SELECT * FROM Manager;
SELECT * FROM Project;
SELECT * FROM Task;
SELECT * FROM Employee_Task;
