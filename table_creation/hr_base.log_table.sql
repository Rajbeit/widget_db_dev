CREATE TABLE hr_base.log_table (
  log_id NUMBER GENERATED ALWAYS AS IDENTITY,  -- Unique identifier for each log entry
  log_date TIMESTAMP DEFAULT SYSTIMESTAMP,     -- The date and time when the log entry was created
  procedure_name VARCHAR2(100),                -- The name of the procedure or function that created the log entry
  message VARCHAR2(4000)                       -- The log message
);

GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.log_table TO AUTO_SYS_USR;
GRANT SELECT, INSERT, UPDATE, DELETE ON hr_base.log_table TO JAVA_SYS_USR;