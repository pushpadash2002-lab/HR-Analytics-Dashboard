USE Attrition_cost_analysis

-------COMPENSATION BENEFITS SUMMARY----------

--Do employees who leave earn less on average than those who stay?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left'THEN monthly_income END),2) AS avg_monthly_income_of_employees_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed'THEN monthly_income END),2) AS avg_monhtly_income_of_employees_stayed
FROM employee_turnover_dataset

--Does bonus percentage differ between leavers and stayers?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN bonus_percentage END),2) AS bonus_pct_of_employees_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed'THEN bonus_percentage END ),2) AS bonus_pct_of_employees_stayed
FROM employee_turnover_dataset

--Does stock option level affect attrition rate?--

SELECT
stock_option_level,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS DECIMAL(10,2)),'%') AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY stock_option_level
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*) DESC


--Are employees with low benefits satisfaction more likely to leave?--

SELECT
benefits_satisfaction,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS DECIMAL(10,2)),'%') AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY benefits_satisfaction
ORDER BY SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*) DESC


