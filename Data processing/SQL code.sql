SELECT
p.UserID0,
p.Channel2,
from_utc_timestamp(p.RecordDate2, 'Africa/Johannesburg') AS LocalDateTime,
      DATE_FORMAT(LocalDateTime, 'yyyy-MM-dd') AS Date,
    DATE_FORMAT(LocalDateTime, 'HH:mm:ss') AS Time,
CASE
WHEN DAYOFWEEK(LocalDateTime) IN (1, 7) THEN 'Weekend'
ELSE 'Weekday'
END AS Day_Classification,
    
          CASE
        WHEN HOUR(LocalDateTime) BETWEEN 0 AND 5 THEN '01. EarlyMorning'
        WHEN HOUR(LocalDateTime) BETWEEN 6 AND 9 THEN '02. Morning'
        WHEN HOUR(LocalDateTime) BETWEEN 10 AND 11 THEN '03. LateMorning'
        WHEN HOUR(LocalDateTime) BETWEEN 12 AND 16 THEN '04. Afternoon'
        WHEN HOUR(LocalDateTime) BETWEEN 17 AND 19 THEN '05. Evening'
        WHEN HOUR(LocalDateTime) BETWEEN 20 AND 23 THEN '06. Night'
    END AS Time_Bucket,
DATE_FORMAT(`Duration 2`, 'HH:mm:ss') AS duration,
CASE
WHEN duration BETWEEN '00:00:00' AND '00:30:00' THEN '30MIN'
WHEN duration BETWEEN '00:31:00' AND '00:59:59' THEN '1HOUR'
WHEN duration BETWEEN '01:00:00' AND '01:30:00' THEN '2H30M'
WHEN duration BETWEEN '02:00:00' AND '02:59:59' THEN '4H30'
ELSE '5H+'
END AS Duration_Bucket,
CASE
WHEN q.Age BETWEEN 0 AND 17 THEN 'Kids'
WHEN q.Age BETWEEN 18 AND 24 THEN 'Youth'
WHEN q.Age BETWEEN 25 AND 34 THEN 'Young_adults'
WHEN q.Age BETWEEN 35 AND 44 THEN 'Adults'
WHEN q.Age BETWEEN 45 AND 54 THEN 'Matured'
WHEN q.Age BETWEEN 55 AND 64 THEN 'pensioner'
ELSE 'Old'
END AS Age_Bucket,
CASE
 WHEN q.Race = ' ' THEN 'Not_specified'
 WHEN q.Race = 'None' THEN 'Not_specified'
ELSE q.Race 
END AS Race,
q.Gender,
CASE
 WHEN q.Province = ' ' THEN 'Other '
 WHEN q.Province = 'None' THEN 'Not_specified'
ELSE q.Province 
END AS Province,
from_utc_timestamp(p.RecordDate2, 'Africa/Johannesburg') AS LocalDateTime
FROM workspace.default.viewership AS p
LEFT JOIN workspace.default.user_profile AS q
ON p.UserID0 = q.UserID;

