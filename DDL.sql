SET FOREIGN_KEY_CHECKS = 0;
SET AUTOCOMMIT = 0;

-- Queries to create tables


CREATE OR REPLACE TABLE Customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  company_name VARCHAR(100),
  first_name VARCHAR(100), 
  last_name VARCHAR(100),
  email VARCHAR(100),
  annual_revenue DECIMAL(12,2)
);

INSERT INTO Customers(company_name, first_name, last_name, email, annual_revenue)
VALUES
(  
    "Carrera Terra",    
    "John",
    "Carrera",
    "jcarrera@carreraterra.com",
    "8200000"
),
(  
    "Scoutain Bank",    
    "Mariah",
    "Scoutain",
    "mscoutain@scoutainbank.com",
    "590200000"
),
( 
    "Aria Apron",    
    "Jelena",
    "Ariamos",
    "jariamos@ariaapron.com",
    "100000"
),
( 
    "Meteorology Mobile",    
    "Kylan",
    "Mirani",
    "kmirani@meteorologymobile.com",
    "7540000"
),
( 
    "Taco Time",    
    "Tyrell",
    "Richards",
    "trichards@tacotime.com",
    "1800000"
);


CREATE OR REPLACE TABLE Certifications (
  certification_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100),
  description VARCHAR(1000),
  duration VARCHAR(100)
);


INSERT INTO Certifications(title, description, duration)
VALUES
  ("Certified Information Systems Security Professional", "Required to work on government projects.", "3 years"),
  ("Certified Ethical Hacker (CEH)", "Required for tech lead position.", "3 years"),
  ("AWS Certified Solutions Architect", "Required for cloud application development", "3 years");
  
  
CREATE OR REPLACE TABLE Projects (
  project_id INT AUTO_INCREMENT PRIMARY KEY, 
  title VARCHAR(100) NOT NULL,
  description VARCHAR(1000), 
  delivery_date DATE,
  proj_status VARCHAR(100) NOT NULL,
  customer_id INT,
  CONSTRAINT 
  FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE OR REPLACE TABLE Developers (
  developer_id INT AUTO_INCREMENT PRIMARY KEY, 
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100), 
  email VARCHAR(100) NOT NULL,
  phone_number VARCHAR(100) NOT NULL,
  project_id INT,
  CONSTRAINT 
  FOREIGN KEY (project_id)
    REFERENCES Projects(project_id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
);

-- Developer has a nullable relationship with Projects.
-- For example, a developer can exist without necessarily being assigned to a project.
-- Here Miranda Turani is a developer but does not have a project assigned.

INSERT INTO Developers(first_name, last_name, email, phone_number, project_id)
VALUES(   
    "Mark",
    "Brawn",
    "mbrawn@keyenergetics.com",
    "1910023476",
    1
),
(  
    "Kyle",
    "Chang",
    "kchang@keyenergetics.com",
    "1912413589",
    3
),
(    
    "Miranda",
    "Turani",
    "mturani@keyenergetics.com",
    "1919078113",
    NULL
),
(    
    "Jay",
    "Singh",
    "jsingh@keyenergetics.com",
    "1918129420",
    4
),
(    
    "Serenity",
    "Diaz",
    "sdiazi@keyenergetics.com",
    "1910015678",
    3
);

INSERT INTO Projects(title, description, delivery_date, proj_status, customer_id)
VALUES
(    
    "Excavation Log",
    "Archaeological mapping service requested by Carrera Terra.",
    "2023-10-02",
    "Awaiting Customer Approval",
    4
),
(   
    "Fingerprint Recognition Banking",
    "Fingerprint account access restriction requested by Scoutain Bank.",
    "2024-08-01",
    "In progress",
    2
),
(    
    "Grocery Budget Tracker",
    "Grocery shopping budget app requested by Aria Apron.",
    "2022-12-09",
    "Awaiting Customer Approval",
    5
),
(    
    "Weather Forecasting App",
    "Meteorology tracking app requested by Meteorology Mobile.",
    "2025-09-02",
    "In progress",
    3
),
(    
    "Taco Time",
    "Taco sale mapping app for regional taco deals requested by Taco Time.",
    "2022-07-10",
    "Awaiting Customer Approval",
    1
);


CREATE OR REPLACE TABLE Tasks (
  task_id INT AUTO_INCREMENT PRIMARY KEY,
  description VARCHAR(1000),
  due_date DATE,
  priority INT,
  task_status VARCHAR(100),
  project_id INT,
  CONSTRAINT
  FOREIGN KEY (project_id)
    REFERENCES Projects(project_id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
);



INSERT INTO Tasks(description, due_date, priority, task_status, project_id)
VALUES
  ("Build out framework for UI", 20221022, 1, "In progress", 1),
  ("Set up backend", 20221225, 2, "Awaiting Approval", 4),
  ("Create database schema", 20221120, 3, "In progress", 3),
  ("Outline project purpose", 20221015, 1, "Awaiting Approval", 2),
  ("Connect with stakeholders", 20220915, 1, "In progress", 5);


CREATE OR REPLACE TABLE Developer_has_Certification(
    `developer_id` INT,
    `certification_id` INT,
    PRIMARY KEY(developer_id, certification_id),
    FOREIGN KEY(developer_id) REFERENCES Developers (developer_id),
    FOREIGN KEY(certification_id) REFERENCES Certifications (certification_id)
    ON DELETE CASCADE
);

INSERT INTO Developer_has_Certification(developer_id, certification_id)
VALUES
((SELECT developer_id FROM Developers WHERE first_name='Mark' and last_name='Brawn'),
(SELECT certification_id FROM Certifications WHERE title='Certified Information Systems Security Professional')),
((SELECT developer_id FROM Developers WHERE first_name='Kyle' and last_name='Chang'),
(SELECT certification_id FROM Certifications WHERE title='Certified Ethical Hacker (CEH)')),
((SELECT developer_id FROM Developers WHERE first_name='Miranda' and last_name='Turani'),
(SELECT certification_id FROM Certifications WHERE title='AWS Certified Solutions Architect')),
((SELECT developer_id FROM Developers WHERE first_name='Jay' and last_name='Singh'),
(SELECT certification_id FROM Certifications WHERE title='Certified Information Systems Security Professional')),
((SELECT developer_id FROM Developers WHERE first_name='Serenity' and last_name='Diaz'),
(SELECT certification_id FROM Certifications WHERE title='Certified Ethical Hacker (CEH)'));