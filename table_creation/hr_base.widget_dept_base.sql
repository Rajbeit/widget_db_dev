-- Create Department Base Table
CREATE TABLE hr_base.widget_dept_base (
    dept_id NUMBER(8) NOT NULL,
    dept_name VARCHAR2(50) NOT NULL,
    dept_loc VARCHAR2(50) NOT NULL,
    PRIMARY KEY (dept_id)
);

GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.widget_dept_base TO AUTO_SYS_USR;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.widget_dept_base TO JAVA_SYS_USR;