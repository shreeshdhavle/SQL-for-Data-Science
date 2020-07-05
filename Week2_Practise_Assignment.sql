-- 1)For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a single table titled: salary_range_by_job_classification. This table contains the following columns:

--SetID
--Job_Code
--Eff_Date
--Sal_End_Date
--Salary_setID
--Sal_Plan
--Grade
--Step
--Biweekly_High_Rate
--Biweekly_Low_Rate
--Union_Code
--Extended_Step
--Pay_Type

-- 2)Find the distinct values for the extended step. 
SELECT distinct Extended_step
FROM salary_range_by_job_classification;

-- 3) Excluding $0.00, what is the minimum bi-weekly high rate of pay ?
Select min(Biweekly_high_Rate)
From salary_range_by_job_classification
WHERE Biweekly_high_Rate <> '$0.00';

-- 4) What is the maximum biweekly high rate of pay ?
SELECT Max(Biweekly_high_Rate) 
From salary_range_by_job_classification;

-- 5) What is the pay type for all the job codes that start with '03'?
Select job_code, pay_type
FROM salary_range_by_job_classification
WHERE job_code LIKE '03%';

-- 6) Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0?
Select grade, eff_date, sal_end_date
FROM salary_range_by_job_classification
WHERE grade LIKE 'Q90H0';

-- 7) Sort the Biweekly low rate in ascending order.
Select Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC;

-- 8) What Step are Job Codes 0110-0400? 
Select Job_code, Step 
FROM salary_range_by_job_classification
WHERE Job_code BETWEEN '0110' AND '0400'
ORDER BY Job_code;

-- 9) What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
 SELECT Job_code, Biweekly_High_Rate - Biweekly_Low_Rate AS Diff
 FROM salary_range_by_job_classification
 WHERE Job_code LIKE '0170'
 --WHERE  Job_code = '0170'
 
 -- 10) What is the Extended Step for Pay Types M, H, and D?

 SELECT Extended_Step, Pay_type
 FROM salary_range_by_job_classification
 WHERE Pay_type IN ('M', 'H', 'D')
 
 -- 11) What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?
 
 SELECT Step, SetID, Union_Code
 FROM salary_range_by_job_classification
 WHERE Union_Code = '990' AND (SetID = 'SFMTA' OR SetID = 'COMMN');


