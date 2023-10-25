-- Test case for add_employee procedure
DECLARE
  v_emp_id hr_base.widget_emp_base.emp_id%TYPE := 200;  -- Replace with a valid employee ID
  v_emp_nm hr_base.widget_emp_base.emp_nm%TYPE := 'Test Employee';  -- Replace with a valid employee name
  v_emp_jb_ttl hr_base.widget_emp_base.emp_jb_ttl%TYPE := 'Test Job';  -- Replace with a valid job title
  v_emp_mgr_id hr_base.widget_emp_base.emp_mgr_id%TYPE := 100;  -- Replace with a valid manager ID
  v_emp_hire_dt hr_base.widget_emp_base.emp_hire_dt%TYPE := SYSDATE;  -- Replace with a valid hire date
  v_emp_sal hr_base.widget_emp_base.emp_sal%TYPE := 5000;  -- Replace with a valid salary
  v_emp_dept_id hr_base.widget_emp_base.emp_dept_id%TYPE := 10;  -- Replace with a valid department ID
BEGIN
  hr_base.widget_emp_pkg.add_employee(v_emp_id, v_emp_nm, v_emp_jb_ttl, v_emp_mgr_id, v_emp_hire_dt, v_emp_sal, v_emp_dept_id);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

-- Test case for transfer_employee procedure
DECLARE
  v_emp_id hr_base.widget_emp_base.emp_id%TYPE := 200;  -- Replace with a valid employee ID
  v_new_dept_id hr_base.widget_emp_base.emp_dept_id%TYPE := 20;  -- Replace with a valid new department ID
BEGIN
  hr_base.widget_emp_pkg.transfer_employee(v_emp_id, v_new_dept_id);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
