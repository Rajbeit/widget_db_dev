
--Select Employee id and salary before update

Select emp_id, emp_sal from hr_base.widget_emp_base from where emp_id = 200;

-- Test case for increase_salary procedure
DECLARE
  v_emp_id hr_base.widget_emp_base.emp_id%TYPE := 200;  -- Replace with a valid employee ID
  v_percentage NUMBER := 10;  -- Replace with a valid percentage increase
BEGIN


  hr_base.manage_salary_pkg.increase_salary(v_emp_id, v_percentage);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
--Select Employee id and salary after update
Select emp_id, emp_sal from hr_base.widget_emp_base from where emp_id = 200;


--Select Employee id and salary before update

Select emp_id, emp_sal from hr_base.widget_emp_base from where emp_id = 200;

-- Test case for decrease_salary procedure
DECLARE
  v_emp_id hr_base.widget_emp_base.emp_id%TYPE := 200;  -- Replace with a valid employee ID
  v_percentage NUMBER := 10;  -- Replace with a valid percentage decrease
BEGIN
  hr_base.manage_salary_pkg.decrease_salary(v_emp_id, v_percentage);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
--Select Employee id and salary after update
Select emp_id, emp_sal from hr_base.widget_emp_base from where emp_id = 200;
