
-- insert data into Employee Base Table

INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90001, 'John Smith', 'CEO', NULL, TO_DATE('01/01/95', 'DD/MM/YY'), 10000, 1);
INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90002, 'Jimmy Willis', 'Manager', 90001, TO_DATE('23/09/03', 'DD/MM/YY'), 52500, 4);
INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90003, 'Roxy Jones', 'Salesperson', 90002, TO_DATE('11/02/17', 'DD/MM/YY'), 35000, 4);
INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90004, 'Selwyn Field', 'Salesperson', 90003, TO_DATE('20/05/15', 'DD/MM/YY'), 32000, 4);
INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90005, 'David Hallett', 'Engineer', 90006, TO_DATE('17/04/18', 'DD/MM/YY'), 40000, 2);
INSERT INTO hr_base.widget_emp_base (emp_id, emp_nm, emp_jb_ttl, emp_mgr_id, emp_hire_dt, emp_sal, emp_dept_id) VALUES (90006,'Sarah Phelps','Manager',90001 ,TO_DATE('21/03/15','DD/MM/YY'),45000 ,2);
INSERT INTO hr_base.widget_emp_base (emp_id ,emp_nm ,emp_jb_ttl ,emp_mgr_id ,emp_hire_dt ,emp_sal ,emp_dept_id ) VALUES (90007,'Louise Harper','Engineer' ,90006 ,TO_DATE('01/01/13','DD/MM/YY') ,47000 ,2);
INSERT INTO hr_base.widget_emp_base (emp_id ,emp_nm ,emp_jb_ttl ,emp_mgr_id ,emp_hire_dt ,emp_sal ,emp_dept_id ) VALUES (90008,'Tina Hart','Engineer' ,90009 ,TO_DATE('28/07/14','DD/MM/YY') ,45000 ,3);
INSERT INTO hr_base.widget_emp_base (emp_id ,emp_nm ,emp_jb_ttl ,emp_mgr_id ,emp_hire_dt ,emp_sal ,emp_dept_id ) VALUES (90009,'Gus Jones','Manager' ,90001 ,TO_DATE('15/05/18','DD/MM/YY') ,50000 ,3);
INSERT INTO hr_base.widget_emp_base (emp_id ,emp_nm ,emp_jb_ttl ,emp_mgr_id ,emp_hire_dt ,emp_sal ,emp_dept_id ) VALUES (90010,'Mildred Hall','Secretary' ,90001 ,TO_DATE('12/10/96','DD/MM/YY') ,35000 ,1);

commit;

