CREATE DATABASE PROJECT_0;
USE PROJECT_0;
show tables;
CREATE TABLE dim_test_preparation_table (
    preparation_id INT PRIMARY KEY,
    test_preparation VARCHAR(255)
);
CREATE TABLE dim_lunch_plans_table (
    lunch_plan_id INT PRIMARY KEY,
    lunch_plan VARCHAR(255)
);
CREATE TABLE dim_parental_education_table (
    education_id INT PRIMARY KEY,
    parental_education VARCHAR(255)
);
SHOW DATABASES; 
CREATE TABLE dim_students_table (
    student_id INT PRIMARY KEY,
    gender_id INT,
    year_group_id INT,
    INDEX (gender_id),  -- Add index to gender_id
    INDEX (year_group_id)  -- Add index to year_group_id
);
CREATE TABLE fact_exam_results_table (
    student_id INT PRIMARY KEY,
    math_score INT,
    reading_score INT,
    writing_score INT,
    parental_education_id INT,
    lunch_plan_id INT,
    test_preparation_id INT,
    gender_id INT,
    year_group_id INT,
    FOREIGN KEY (parental_education_id) REFERENCES dim_parental_education_table(education_id),
    FOREIGN KEY (lunch_plan_id) REFERENCES dim_lunch_plans_table(lunch_plan_id),
    FOREIGN KEY (test_preparation_id) REFERENCES dim_test_preparation_table(preparation_id),
     FOREIGN KEY (gender_id) REFERENCES dim_students_table(gender_id)
);

 

