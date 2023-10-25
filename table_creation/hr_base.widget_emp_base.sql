CREATE TABLE hr_base.widget_emp_base (
    emp_id NUMBER(10) NOT NULL,
    emp_nm VARCHAR2(50) NOT NULL,
    emp_jb_ttl VARCHAR2(50) NOT NULL,
    emp_mgr_id NUMBER(10),
    emp_hire_dt DATE NOT NULL,
    emp_sal NUMBER(10) NOT NULL,
    emp_dept_id NUMBER(5) NOT NULL,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (emp_dept_id) REFERENCES widget_dept_base(dept_id)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.widget_emp_base TO AUTO_SYS_USR;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.widget_emp_base TO JAVA_SYS_USR;
