/*------------------------------------------------------------------*/
/*-- This package contains procedures to manage employee salaries 	*/
/*-- Required Input:   												*/
/*-- 				1. EMP_ID -- Employee ID						*/
/*-- 				2. p_percentage - Precentage Increase           */
/*-- Cretaed by 	: Raj Arora							            */
/*-- Creation Date	: Oct-2023										*/
/*------------------------------------------------------------------*/
CREATE OR REPLACE PACKAGE hr_base.manage_salary_pkg AS
		  -- Procedure to increase the salary of an employee
		  PROCEDURE increase_salary (
			p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,  -- Employee ID
			p_percentage IN NUMBER                            -- Percentage increase
		  );

		  -- Procedure to decrease the salary of an employee
		  PROCEDURE decrease_salary (
			p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,  -- Employee ID
			p_percentage IN NUMBER                            -- Percentage decrease
		  );
END hr_base.manage_salary_pkg;
/

CREATE OR REPLACE PACKAGE BODY hr_base.manage_salary_pkg AS
/*------------------------------------------------------------------*/
/*-- increase_salary Proceedure									 	*/
/*------------------------------------------------------------------*/
PROCEDURE increase_salary (
	  p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,
	  p_percentage IN NUMBER
	) AS
	  v_new_sal hr_base.widget_emp_base.emp_sal%TYPE;
	  v_count NUMBER;
BEGIN
	  -- Check if the employee ID exists
	  SELECT COUNT(*)
	  INTO v_count
	  FROM hr_base.widget_emp_base
	  WHERE emp_id = p_emp_id;

	  -- If the employee ID does not exist, write a log and exit the procedure
	  IF v_count = 0 THEN
		INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		VALUES (SYSTIMESTAMP, 'increase_salary', 'Error: Invalid employee ID ' || p_emp_id);
		RETURN;
	  END IF;

	  -- Calculate the new salary after increase
	  SELECT emp_sal * (1 + p_percentage / 100)
	  INTO v_new_sal
	  FROM hr_base.widget_emp_base
	  WHERE emp_id = p_emp_id;

	  -- Update the salary in the database
	  UPDATE hr_base.widget_emp_base
	  SET emp_sal = v_new_sal
	  WHERE emp_id = p_emp_id;

	  -- Log the operation in a log table
	  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
	  VALUES (SYSTIMESTAMP, 'increase_salary', 'Salary increased for employee ID ' || p_emp_id);
EXCEPTION
	WHEN OTHERS THEN          -- Handle all other exceptions 
	  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END increase_salary;


/*------------------------------------------------------------------*/
/*-- decrease_salary Proceedure									 	*/
/*------------------------------------------------------------------*/
PROCEDURE decrease_salary (
	  p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE,
	  p_percentage IN NUMBER
	) AS
	  v_new_sal hr_base.widget_emp_base.emp_sal%TYPE;
	  v_count NUMBER;
BEGIN
  -- Check if the employee ID exists
	  SELECT COUNT(*)
	  INTO v_count
	  FROM hr_base.widget_emp_base
	  WHERE emp_id = p_emp_id;

  -- If the employee ID does not exist, write a log and exit the procedure
	  IF v_count = 0 THEN
		INSERT INTO hr_base.log_table (log_date, procedure_name, message)
		VALUES (SYSTIMESTAMP, 'decrease_salary', 'Error: Invalid employee ID ' || p_emp_id);
		RETURN;
	  END IF;

  -- Calculate the new salary after decrease
	  SELECT emp_sal * (1 - p_percentage / 100)
	  INTO v_new_sal
	  FROM hr_base.widget_emp_base
	  WHERE emp_id = p_emp_id;

  -- Update the salary in the database
	  UPDATE hr_base.widget_emp_base
	  SET emp_sal = v_new_sal
	  WHERE emp_id = p_emp_id;

  -- Log the operation in a log table
	  INSERT INTO hr_base.log_table (log_date, procedure_name, message)
	  VALUES (SYSTIMESTAMP, 'decrease_salary', 'Salary decreased for employee ID ' || p_emp_id);
EXCEPTION
	WHEN OTHERS THEN          -- Handle all other exceptions 
	  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END decrease_salary;

END hr_base.manage_salary_pkg;
/

-- Grant execute rights to AUTO_SYS_USR
GRANT EXECUTE ON hr_base.manage_salary_pkg TO AUTO_SYS_USR;

-- Grant execute rights to JAVA_SYS_USR
GRANT EXECUTE ON hr_base.manage_salary_pkg TO JAVA_SYS_USR;