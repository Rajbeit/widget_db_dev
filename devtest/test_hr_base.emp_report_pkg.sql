-- Test case for get_emp_report function
DECLARE
  v_result CLOB;
BEGIN
  v_result := hr_base.emp_report_pkg.get_emp_report(10);  -- Replace 10 with a valid department ID
  DBMS_OUTPUT.PUT_LINE(v_result);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Test case for get_dept_total_salary function
DECLARE
  v_result CLOB;
BEGIN
  v_result := hr_base.emp_report_pkg.get_dept_total_salary(20);  -- Replace 20 with a valid department ID
  DBMS_OUTPUT.PUT_LINE(v_result);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Test case for get_employee_salary function
DECLARE
  v_result CLOB;
BEGIN
  v_result := hr_base.emp_report_pkg.get_employee_salary(100);  -- Replace 100 with a valid employee ID
  DBMS_OUTPUT.PUT_LINE(v_result);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
