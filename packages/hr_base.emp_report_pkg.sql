/*------------------------------------------------------------------*/
/*-- This package contains functions to get reports about employee	*/ 													*/
/*-- Cretaed by 	: Raj Arora							            */
/*-- Creation Date	: Oct-2023										*/
/*------------------------------------------------------------------*/
CREATE OR REPLACE PACKAGE hr_base.emp_report_pkg AS
  -- Function to get a JSON report of all employees in a department
  FUNCTION get_emp_report_by_dept (
    p_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE
  ) RETURN CLOB;

  -- Function to get the total salary of a department
  FUNCTION get_dept_total_salary (
    p_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE
  ) RETURN CLOB;

  -- Function to get the salary of an employee
  FUNCTION get_employee_salary (
    p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE
  ) RETURN CLOB;
END emp_report_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_report_pkg AS
/*------------------------------------------------------------------*/
/*-- get_emp_report_by_dept											*/ 
/*-- input 	- department ID											*/
/*-- output - JSON object with employee details						*/
/*------------------------------------------------------------------*/
  FUNCTION get_emp_report_by_dept (
    p_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE
  ) RETURN CLOB AS
    v_json CLOB;
    v_count NUMBER;
  BEGIN
    -- Check if the department ID exists
    SELECT COUNT(*)
    INTO v_count
    FROM hr_base.widget_emp_base
    WHERE emp_dept_id = p_dept_id;

    -- If the department ID does not exist, return an error message
    IF v_count = 0 THEN
      v_json := JSON_OBJECT('status' VALUE 'error', 'message' VALUE 'Invalid department ID');
      RETURN v_json;
    END IF;

    -- Select all employees from the given department and format the result as a JSON array
    SELECT JSON_ARRAYAGG(
      JSON_OBJECT(
        'emp_id' VALUE emp_id,
        'emp_nm' VALUE emp_nm,
        'emp_jb_ttl' VALUE emp_jb_ttl,
        'emp_mgr_id' VALUE emp_mgr_id,
        'emp_hire_dt' VALUE emp_hire_dt,
        'emp_sal' VALUE emp_sal,
        'emp_dept_id' VALUE emp_dept_id
      )
    ) INTO v_json
    FROM hr_base.widget_emp_base
    WHERE emp_dept_id = p_dept_id;

    RETURN v_json;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 'Error: ' || SQLERRM;
  END get_emp_report_by_dept;
  
/*------------------------------------------------------------------*/
/*-- get_emp_report_by_dept											*/ 
/*-- input 	- department id											*/
/*-- output - JSON object with total salary of a department			*/
/*------------------------------------------------------------------*/
  FUNCTION get_dept_total_salary (
    p_dept_id IN hr_base.widget_emp_base.emp_dept_id%TYPE
  ) RETURN CLOB AS
    v_total_sal NUMBER;
    v_json CLOB;
    v_count NUMBER;
  BEGIN
    -- Check if the department ID exists
    SELECT COUNT(*)
    INTO v_count
    FROM hr_base.widget_emp_base
    WHERE emp_dept_id = p_dept_id;

    -- If the department ID does not exist, return an error message
    IF v_count = 0 THEN
      v_json := JSON_OBJECT('status' VALUE 'error', 'message' VALUE 'Invalid department ID');
      RETURN v_json;
    END IF;

    -- Calculate the total salary for the given department
    SELECT SUM(emp_sal)
    INTO v_total_sal
    FROM hr_base.widget_emp_base
    WHERE emp_dept_id = p_dept_id;

    -- Create a JSON object with the department ID and the total salary
    v_json := JSON_OBJECT(
      'dept_id' VALUE p_dept_id,
      'total_salary' VALUE v_total_sal,
      'status' VALUE 'success'
    );

    RETURN v_json;
  EXCEPTION
    WHEN OTHERS THEN
      RETURN 'Error: ' || SQLERRM;
  END get_dept_total_salary;

/*------------------------------------------------------------------*/
/*-- get_employee_salary											*/ 
/*-- input 	- employee id											*/
/*-- output - JSON object with salary of a employee					*/
/*------------------------------------------------------------------*/
  -- Implementation of the function to get the salary of an employee based on their employee ID 
  FUNCTION get_employee_salary (
	  p_emp_id IN hr_base.widget_emp_base.emp_id%TYPE  
	) RETURN CLOB AS  
	  v_salary hr_base.widget_emp_base.emp_sal%TYPE;  
	  v_json CLOB;
BEGIN  
	  SELECT emp_sal  
	  INTO v_salary  
	  FROM hr_base.widget_emp_base  
	  WHERE emp_id = p_emp_id;  

	  -- Create a JSON object with the employee ID and the salary 
	  v_json := JSON_OBJECT(
	    'emp_id' VALUE p_emp_id,
	    'salary' VALUE v_salary,
	    'status' VALUE 'success'
	  );

	  RETURN v_json; 
	EXCEPTION  
	  WHEN NO_DATA_FOUND THEN   
	    v_json := JSON_OBJECT('status' VALUE 'error', 'message' VALUE 'Invalid employee ID');
	    RETURN v_json; 
	  WHEN OTHERS THEN   
	    RETURN 'Error: ' || SQLERRM; 
END get_employee_salary; 
END emp_report_pkg; 
/

	-- Grant execute rights to AUTO_SYS_USR
GRANT EXECUTE ON hr_base.emp_report_pkg TO AUTO_SYS_USR;

-- Grant execute rights to JAVA_SYS_USR
GRANT EXECUTE ON hr_base.emp_report_pkg TO JAVA_SYS_USR;
