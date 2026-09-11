USE Attrition_cost_analysis

------COST BREAKDOWN SUMMARY------

--What is the total attrition cost, split by recruitment, training, productivity loss, separation, and onboarding?--

SELECT
ROUND(SUM(Recruitment_cost),2) AS total_recruitment_cost,
ROUND(SUM(Training_Cost),2) AS total_training_cost,
ROUND(SUM([Prodcutivity Loss cost]),2) AS total_productivity_loss_cost,
ROUND(SUM([Exit Cost]),2) AS total_separation_cost,
ROUND(SUM([onboarding Cost]),2) AS total_onboarding_cost,
ROUND(SUM([Total attrition cost per employee]),2) AS total_attrition_cost
FROM employee_turnover_dataset
WHERE attrition_status='Left'


--Which cost component contributes the most to total attrition cost?--

SELECT
ROUND(SUM(Recruitment_cost),2) AS total_recruitment_cost,
ROUND(SUM(Training_Cost),2) AS total_training_cost,
ROUND(SUM([Prodcutivity Loss cost]),2) AS total_productivity_loss_cost,
ROUND(SUM([Exit Cost]),2) AS total_separation_cost,
ROUND(SUM([onboarding Cost]),2) AS total_onboarding_cost,
ROUND(SUM([Total attrition cost per employee]),2) AS total_attrition_cost
FROM employee_turnover_dataset
WHERE attrition_status='Left'

--How much more (or less) are replacement hires paid compared to the employees they replaced?--

SELECT
ROUND(AVG([New hire replacement salary]-monthly_income),2) AS avg_diff_salary,
CONCAT(ROUND(AVG(([New hire replacement salary]-monthly_income)/monthly_income*100),2),'%') AS avg_salary_diff_pct
FROM employee_turnover_dataset
WHERE attrition_status = 'Left'


