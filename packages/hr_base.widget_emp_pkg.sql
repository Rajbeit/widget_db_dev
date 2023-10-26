/*------------------------------------------------------------------*/
/*-- This package contains procedures to manage employee            */
/*-- Cretaed by 	: Raj Arora				    */
/*-- Creation Date	: Oct-2023				    */
/*------------------------------------------------------------------*/
CREATE OR REPLACE PACKAGE hr_base.widget_emp_pkg AS
  -- Procedure to add a new employee
  PROCEDURE add_employee (
		p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,  -- Employee ID
		p_emp_nm IN hr_base.widget_emp_base.emp_nm%TYPE,  -- Employee Name
		p_emp_jb_ttl IN hr_base.widget_emp_base.emp_jb_ttl%TYPE,  -- Job Title
		p_emp_mgr_id IN hr_base.widget_emp_base.emp_mgr_id%TYPE,  -- Manager ID
		p_emp_hire_dt IN hr_base.widget_emp_base.emp_hire_dt%TYPE,  -- Hire Date
		p_emp_sal IN hr_base.widget_emp_base.emp_sal%TYPE,  -- Salary
		p_emp_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE  -- Department ID
  );
  
  -- Procedure to transfer an employee to a new department

  PROCEDURE transfer_employee (
		p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,  -- Employee ID
		p_new_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE  -- New Department ID
  );
END widget_emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY widget_emp_pkg AS
/*------------------------------------------------------------------*/
/*-- add_employee Procedure					    */
/*------------------------------------------------------------------*/
  PROCEDURE add_employee (
		p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,
		p_emp_nm IN hr_base.widget_emp_base.emp_nm%TYPE,
		p_emp_jb_ttl IN hr_base.widget_emp_base.emp_jb_ttl%TYPE,
		p_emp_mgr_id IN hr_base.widget_emp_base.emp_mgr_id%TYPE,
		p_emp_hire_dt IN hr_base.widget_emp_base.emp_hire_dt%TYPE,
		p_emp_sal IN hr_base.widget_emp_base.emp_sal%TYPE,
		p_emp_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE
  ) AS
  BEGIN
		-- Insert the new employee details into the database
		INSERT INTO hr_base.widget_emp_base (
			emp_id, 
			emp_nm, 
			emp_jb_ttl, 
			emp_mgr_id, 
			emp_hire_dt, 
			emp_sal, 
			emp_dept_id
		) VALUES (
			p_emp_id, 
			p_emp_nm, 
			p_emp_jb_ttl, 
			p_emp_mgr_id, 
			p_emp_hire_dt, 
			p_emp_sal, 
			p_emp_dept_id
		);

		-- Log the operation in a log table
		INSERT INTO hr_base.log_table (log_date, procedure_name, message)
			 VALUES (SYSTIMESTAMP, 'add_employee', 'New employee added with ID ' || p_emp_id);
  EXCEPTION
		WHEN DUP_VAL_ON_INDEX THEN   -- Handle case when there is a duplicate value on unique index error
		  DBMS_OUTPUT.PUT_LINE('Error: Duplicate value on unique index.');
		  -- Log the error in a log table
		  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		  VALUES (SYSTIMESTAMP, 'add_employee', 'Error: Duplicate value on unique index for employee ID ' || p_emp_id);
		WHEN INVALID_NUMBER THEN     -- Handle case when there is an invalid number error
		  DBMS_OUTPUT.PUT_LINE('Error: Invalid number.');
		  -- Log the error in a log table
		  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		  VALUES (SYSTIMESTAMP, 'add_employee', 'Error: Invalid number for employee ID ' || p_emp_id);
		WHEN VALUE_ERROR THEN        -- Handle case when there is a value error
		  DBMS_OUTPUT.PUT_LINE('Error: Value error.');
		  -- Log the error in a log table
		  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		  VALUES (SYSTIMESTAMP, 'add_employee', 'Error: Value error for employee ID ' || p_emp_id);
		WHEN NO_DATA_FOUND THEN      -- Handle case when there is no data found for the given department ID
		  DBMS_OUTPUT.PUT_LINE('Error: Invalid department ID. No such department exists.');
		  -- Log the error in a log table
		  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		  VALUES (SYSTIMESTAMP, 'add_employee', 'Error: Invalid department ID for employee ID ' || p_emp_id);
		WHEN OTHERS THEN             -- Handle all other exceptions 
		  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
  END add_employee;

/*------------------------------------------------------------------*/
/*-- transfer_employee Procedure				    */
/*------------------------------------------------------------------*/ 
  PROCEDURE transfer_employee (
		p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,
		p_new_dept_id IN hr_base.widget_emb.base.emp_dept_id%TYPE
	  ) AS
  BEGIN
		-- Update the department ID for the given employee ID in the database
		UPDATE hr_base.widget_emp_base
		SET emp_dept_id = p_new_dept_id
		WHERE emp_id = p_emp_id;

		-- Log the operation in a log table
		INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		VALUES (SYSTIMESTAMP, 'transfer_employee', 'Employee with ID ' || p_emp_id || ' transferred to department ID ' || p_new_dept_id);
  EXCEPTION
		WHEN NO_DATA_FOUND THEN      -- Handle case when there is no data found for the given employee ID or department ID
		  DBMS_OUTPUT.PUT_LINE('Error: Invalid employee ID or department ID.');
		  -- Log the error in a log table
		  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		  VALUES (SYSTIMESTAMP, 'transfer_employee', 'Error: Invalid employee ID or department ID for employee ID ' || p_emp_id);
		WHEN OTHERS THEN             -- Handle all other exceptions 
		  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
  END transfer_employee;
END widget_emp_pkg;
/

GRANT EXECUTE ON hr_base.widget_emp_pkg TO AUTO_SYS_USR;

-- Grant execute rights to JAVA_SYS_USR
GRANT EXECUTE ON hr_base.widget_emp_pkg TO JAVA_SYS_USR;
