USE Attrition_cost_analysis

-------ENGAGEMENT SUMMARY-----------

--Is job satisfaction lower among employees who left?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left'THEN job_satisfaction END),2 )as job_satisfaction_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN job_satisfaction END),2) AS job_satisfaction_who_stayed
FROM employee_turnover_dataset

--Is work-life balance a factor in attrition?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left'THEN work_life_balance END),2 )as work_life_balance_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN work_life_balance END),2) AS work_life_balance_who_stayed
FROM employee_turnover_dataset

--Does engagement score differ between leavers and stayers?--


SELECT
ROUND(AVG(CASE WHEN attrition_status='Left'THEN engagement_score END),2 )as engagement_score_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN engagement_score END),2) AS engaegment_score_who_stayed
FROM employee_turnover_dataset

--Does manager effectiveness (reporting manager score) correlate with attrition?--

SELECT
ROUND(AVG(CASE WHEN attrition_status='Left'THEN reporting_manager_score END),2 )as manager_effectiveness_who_left,
ROUND(AVG(CASE WHEN attrition_status='Stayed' THEN reporting_manager_score END),2) AS maanger_effectiveness_who_stayed
FROM employee_turnover_dataset
