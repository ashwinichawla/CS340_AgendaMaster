-- Projects
--------------------------------------------------------------
--Add a new project

INSERT INTO Projects(title, description, delivery_date, proj_status, customer_id)
VALUES (title, description, delivery_date, proj_status, customer_id);

--Show all entity tables
SELECT * FROM Projects;
SELECT * FROM Developers;
SELECT * FROM Tasks;
SELECT * FROM Customers;
SELECT * FROM Certifications;

--READ all projects
SELECT * FROM Projects;

--GET SPECIFIC PROJECT ON project_id
SELECT project_id, title, description, delivery_date, proj_status, customer_id FROM Projects WHERE Projects.project_id = project_id;

--GET DEVELOPERS FOR PROJECT ON project_id
SELECT developer_id, first_name, last_name, email, phone_number, project_id FROM Developers WHERE Developers.project_id = project_id;

--GET TASKS FOR PROJECT ON project_id
SELECT task_id, description, due_date, priority, task_status, project_id FROM Tasks WHERE Tasks.project_id = project_id;

--Update the project 
UPDATE Projects
SET title = '${data.update_title}',
description = '${data.update_description}',
delivery_date = '${data.update_delivery_date}',
proj_status = '${data.update_proj_status}',
customer_id = '${data.update_customer_id}',
WHERE project_id = '${data.project_id}';

--Delete project
DELETE FROM Projects WHERE Projects.project_id = project_id;

-- Developers
--------------------------------------------------------------
--Add a new developer

INSERT INTO Developers(first_name, last_name, email, phone_number)
VALUES (first_name, last_name, email, phone_number);

--READ all developers
SELECT * FROM Developers;

--GET SPECIFIC DEVELOPER ON developer_id
SELECT developer_id, first_name, last_name, email, phone_number, project_id FROM Developers WHERE Developers.developer_id = developer_id;

--Update the developer 
UPDATE Developers
SET first_name = '${data.update_first_name}',
last_name = '${data.update_last_name}',
email = '${data.update_email}',
phone_number = '${data.update_phone_number}',
WHERE developer_id = '${data.developer_id}';

--GET CERTIFICATIONS FOR DEVELOPER ON developer_id
SELECT certification_id, title, description, duration FROM Certifications WHERE Certifications.developer_id = developer_id;

--Delete developer
DELETE FROM Developers WHERE Developers.developer_id = developer_id;

-- Tasks
--------------------------------------------------------------
--Add a new task

INSERT INTO Tasks(description, due_date, priority, task_status, project_id)
VALUES (description, due_date, priority, task_status, project_id);

--GET SPECIFIC TASK ON task_id
SELECT task_id, description, due_date, priority, task_status, project_id FROM Tasks WHERE Tasks.task_id = task_id;

--Update the task 
UPDATE Tasks
SET description = '${data.update_description}',
due_date = '${data.update_due_date}',
priority = '${data.update_priority}',
task_status = '${data.update_task_status}',
project_id = '${data.update_project_id}',
WHERE task_id = '${data.task_id}';

--Delete task
DELETE FROM Tasks WHERE Tasks.task_id = task_id;

-- Customers
--------------------------------------------------------------
--Add a new customer

INSERT INTO Customers(company_name, first_name, last_name, email, annual_revenue)
VALUES (company_name, first_name, last_name, email, annual_revenue);

--READ all customers
SELECT * FROM Customers;

--GET SPECIFIC CUSTOMER ON customer_id
SELECT customer_id, company_name, first_name, last_name, email, annual_revenue FROM Customers WHERE Customers.customer_id = customer_id;

--GET PROJECTS FOR CUSTOMER ON customer_id
SELECT project_id, title, description, delivery_date, proj_status, customer_id FROM Projects WHERE Projects.customer_id = customer_id;

--Update the customer 
UPDATE Customers
SET company_name = '${data.update_company_name}',
first_name = '${data.update_first_name}',
last_name = '${data.update_last_name}',
email = '${data.update_email}',
annual_revenue = '${data.update_annual_revenue}',
WHERE customer_id = '${data.customer_id}';

--DELETE SPECIFIC CUSTOMER ON customer_id
DELETE FROM Customers WHERE Customers.customer_id = customer_id;

-- Certifications
--------------------------------------------------------------
--Add a new certification

INSERT INTO Certifications(title, description, duration)
VALUES (title, description, duration);

--GET SPECIFIC CERTIFICATION ON certification_id
SELECT certification_id, title, description, duration FROM Certifications WHERE Certifications.certification_id = certification_id;

--Update the certification 
UPDATE Certifications
SET title = '${data.update_title}',
description = '${data.update_description}',
duration = '${data.update_duration}',
WHERE certification_id = '${data.certification_id}';

--Delete certification
DELETE FROM Certifications WHERE Certifications.certification_id = certification_id;
