-- QUESTIONS / INSIGHTS
-- 1 Which is the most popular app

SELECT App, COUNT(*) AS total_users
FROM sm_usage
GROUP BY App
ORDER BY total_users DESC;

--  2. What is the average daily usage time per app?
SELECT App, round(AVG(daily_minutes_spent),0) AS avg_daily_minutes
FROM sm_usage
GROUP BY App
ORDER BY avg_daily_minutes DESC;

--  3. Which app has the highest user engagement (based on posts, likes, and follows)?
SELECT App, 
       SUM(posts_per_day + likes_per_day + follows_per_day) AS total_activity
FROM sm_usage
GROUP BY App
ORDER BY total_activity DESC;

-- 4 . Which users are the most active across multiple platforms?
SELECT user_id, 
       SUM(posts_per_day + likes_per_day + follows_per_day) AS total_activity
FROM sm_usage
GROUP BY user_id
ORDER BY total_activity DESC
LIMIT 10;

-- 5 Who are the top 5 most active users for each app, based on a combined score of posts, likes, and follows?
WITH UserActivity AS (
  SELECT 
    user_id, 
     App, 
	SUM(posts_per_day + likes_per_day + follows_per_day) AS total_activity
  FROM sm_usage
  GROUP BY user_id, App
)

SELECT
  App,
  user_id,
  total_activity
FROM UserActivity
ORDER BY total_activity DESC;


-- 6 Which apps are associated with higher levels of user activity (posts, likes, follows)?
SELECT App, 
       round(AVG(posts_per_day + likes_per_day + follows_per_day),0) AS avg_activity
FROM sm_usage
GROUP BY App
ORDER BY avg_activity DESC;

-- 7 How does the average daily usage time correlate with user engagement metrics (posts, likes, follows)?
SELECT AVG(daily_minutes_spent), 
       AVG(posts_per_day + likes_per_day + follows_per_day) AS total_activity
FROM sm_usage;

-- 8 What is the average number of posts, likes, and follows per hour for each app?
SELECT 
    App, 
    EXTRACT(HOUR FROM timestamp) AS hour,
    round(AVG(posts_per_day),0)AS avg_posts_per_hour,
    round(AVG(likes_per_day),0) AS avg_likes_per_hour,
    round(AVG(follows_per_day),0) AS avg_follows_per_hour
FROM 
    sm_usage
GROUP BY 
    App, hour
ORDER BY 
    App, hour;
-- 9 Number of apps and users im the data

SELECT COUNT(DISTINCT user_id) AS total_users
FROM sm_usage;
