-- sql script to create a stored procedure ComputeAverageWeightedScoreForUsers
-- that computes & store the average weighted score of all students
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER ##
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    UPDATE users AS ur,
        (SELECT SUM(score * weight) / SUM(weight) AS aws, u.id
        FROM users AS u INNER JOIN 
        corrections AS cr ON cr.user_id = u.id INNER JOIN
        projects AS p ON p.id = cr.project_id
        GROUP BY u.id) AS fnl
    SET ur.average_score = fnl.aws WHERE ur.id = fnl.id;  
END
##
DELIMITER ;
