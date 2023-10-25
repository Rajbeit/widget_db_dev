# widget_db_dev
This is DEV Repository for widget_db dev instance. Please note that this is assumed that widget_db has been created and it is having hr_base schema to keep all the hr related objects.

Following are the details of the repository:
DB      : widget_db
SCHEMA  : hr_base

Tables: 1. hr_base.widget_dept_base
        2. hr_base.widget_emp_base
        3. hr_base.log_table

Insert Script: 1. INSERT_hr_base.widget_dept_base
               2. INSERT_hr_base.widget_emp_base

Packages: 1. hr_base.emp_report_pkg
          2. hr_base.manage_salary_pkg
          3. hr_base.widget_emp_pkg

Build and Run Instructions on Windows/MAC:
https://github.com/Rajbeit/widget_db_dev/blob/main/Build%20and%20run%20instructions.txt


1. Create the necessary data structures to contain the data specified in the Appendix ensuring that data integrity is enforced
	1.1 https://github.com/Rajbeit/widget_db_dev/blob/main/table_creation/hr_base.widget_dept_base.sql
	1.2 https://github.com/Rajbeit/widget_db_dev/blob/main/table_creation/hr_base.widget_emp_base.sql
        Following table added to keep the log of changes made to the DB for audit purpose:
        1.3 https://github.com/Rajbeit/widget_db_dev/blob/main/table_creation/hr_base.log_table.sql 
2. Populate the Departments and Employees data structures using the data specified in the Appendix
   Insert Scripts have been added to insert record manually, this can be updated to have JSON object or a file as input to load the data.
   	2.1 https://github.com/Rajbeit/widget_db_dev/blob/main/data_upload/INSERT_hr_base.widget_dept_base.sql
   	2.2 https://github.com/Rajbeit/widget_db_dev/blob/main/data_upload/INSERT_hr_base.widget_emp_base.sql
3. Create an appropriate executable database object to allow an Employee to be created
   Following can be used to perform this operation:
                    hr_base.widget_emp_pkg.add_employee
   location: https://github.com/Rajbeit/widget_db_dev/blob/main/packages/hr_base.widget_emp_pkg.sql
4. Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage
   Following can be used to perform these operations:            
        To Increase Salary: hr_base.manage_salary_pkg.increase_salary
        To Decrease Salary: hr_base.manage_salary_pkg.decrease_salary
    location: https://github.com/Rajbeit/widget_db_dev/blob/main/packages/hr_base.manage_salary_pkg.sql
5. Create an appropriate executable database object to allow the transfer of an Employee to a different Department
   Following can be used to perform this operation:
           hr_base.widget_emp_pkg.transfer_employee
           location: https://github.com/Rajbeit/widget_db_dev/blob/main/packages/hr_base.widget_emp_pkg.sql
6. Create an appropriate executable database object to return the Salary for an Employee.
     Following can be used to perform this operationa, this will retun JSON data.          
         hr_base.emp_report_pkg.get_employee_salary
    location: https://github.com/Rajbeit/widget_db_dev/blob/main/devtest/test_hr_base.emp_report_pkg.sql
7. Write a report to show all Employees for a Department
    Following can be used to perform this operationa, this will retun JSON data.          
         hr_base.emp_report_pkg.get_emp_report_by_dept
    location: https://github.com/Rajbeit/widget_db_dev/blob/main/devtest/test_hr_base.emp_report_pkg.sql
8. Write a report to show the total of Employee Salary for a Department
    Following can be used to perform this operationa, this will retun JSON data.          
         hr_base.emp_report_pkg.get_dept_total_salary
    location: https://github.com/Rajbeit/widget_db_dev/blob/main/devtest/test_hr_base.emp_report_pkg.sql


