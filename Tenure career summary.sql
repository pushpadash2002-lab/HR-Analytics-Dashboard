USE Attrition_cost_analysis

------TENURE CAREER SUMMARY------

--Do employees who leave have shorter or longer tenure than those who stay?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN tenure_years END),2) AS avg_tenure_years_who_left,
ROUND(AVG(CASE WHEN attrition_status ='Stayed' THEN tenure_years END),2) AS avg_tenure_years_who_stayed
FROM employee_turnover_dataset

--Do employees who leave spend less time in their current role before leaving?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN time_in_current_role END),2) AS avg_time_in_current_role_who_left,
ROUND(AVG(CASE WHEN attrition_status = 'Stayed' THEN time_in_current_role END),2) AS avg_time_in_current_role_who_stayed
FROM employee_turnover_dataset

--Does time since last promotion affect the likelihood of leaving?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left' THEN time_since_last_promotion END),2) as avg_time_since_last_promotion_of_leavers,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN time_since_last_promotion END),2) AS avg_time_since_last_promotion_who_stayed
FROM employee_turnover_dataset

--Are employees who were promoted in the last 2 years less likely to leave?--

SELECT
promotion_last_2yrs,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) AS decimal(10,2)),'%')AS attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY promotion_last_2yrs

--Does internal mobility (role change) reduce attrition?--

SELECT
internal_mobility,
CONCAT(CAST(ROUND(SUM(CASE WHEN attrition_status='Left'THEN 1.0 ELSE 0 END)
	/count(*)*100,2)AS decimal(10,2)),'%') attrition_rate_pct
FROM employee_turnover_dataset
GROUP BY internal_mobility



