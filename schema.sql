-- Create database (optional)
CREATE DATABASE credit_risk_db;

-- Use database
USE credit_risk_db;

-- Create main table
CREATE TABLE credit_risk_data (
    person_age INT,
    person_income FLOAT,
    person_home_ownership VARCHAR(50),
    person_emp_length FLOAT,
    loan_intent VARCHAR(50),
    loan_grade VARCHAR(10),
    loan_amnt FLOAT,
    loan_int_rate FLOAT,
    loan_percent_income FLOAT,
    loan_status INT,
    cb_person_default_on_file INT,
    cb_person_cred_hist_length FLOAT
);


📌 EXPLANATION (FOR YOUR UNDERSTANDING)
Column	Meaning
person_age	Age of customer
person_income	Annual income
person_home_ownership	RENT / OWN / MORTGAGE
person_emp_length	Years of employment
loan_intent	Purpose of loan
loan_grade	Risk grade (A–G)
loan_amnt	Loan amount
loan_int_rate	Interest rate
loan_percent_income	Loan burden
loan_status	Target (0 = safe, 1 = default)
cb_person_default_on_file	Past default history
cb_person_cred_hist_length	Credit history length


#Default Rate by Loan Grade
SELECT 
    loan_grade,
    AVG(loan_status) AS default_rate
FROM credit_risk_data
GROUP BY loan_grade
ORDER BY default_rate DESC;

#High Risk Customers
SELECT *
FROM credit_risk_data
WHERE loan_percent_income > 0.4
AND loan_status = 1;
