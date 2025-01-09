Create database project_sma;

use project_sma;
select* from sm_usage;

describe sm_usage;

select User_ID
FROM sm_usage
where User_ID is null and User_ID = ' ';


SELECT 
    COUNT(CASE WHEN App = 'TikTok' THEN 1 END) AS TikTok_Occurrences,
    COUNT(CASE WHEN App = 'Facebook' THEN 1 END) AS Facebook_Occurrences,
    COUNT(CASE WHEN App = 'Instagram' THEN 1 END) AS Instagram_Occurrences,
    COUNT(CASE WHEN App = 'Twitter' THEN 1 END) AS Twitter_Occurrences,
    COUNT(CASE WHEN App = 'LinkedIn' THEN 1 END) AS LinkedIn_Occurrences
FROM sm_usage;

ALTER TABLE sm_usage
ADD COLUMN timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE sm_usage
ADD COLUMN Total int SUM( posts_per_day + likes_per_day + follows_per_day)AS Total;
