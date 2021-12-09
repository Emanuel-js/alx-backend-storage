-- sql script to create a view need_meeting
-- that lists all students < 80 scire & no last meeting

CREATE VIEW need_meeting
AS
SELECT name FROM students
WHERE (score < 80) AND 
(last_meeting IS NULL OR last_meeting < ADDDATE(CURDATE(), INTERVAL -1 MONTH))
