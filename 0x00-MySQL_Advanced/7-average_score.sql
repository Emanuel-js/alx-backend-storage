-- sql script to a stored procedure ComputeAverageScoreForUser
-- that computes & store the average score of a student
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
DELIMITER ##
CREATE PROCEDURE ComputeAverageScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE avg_scr FLOAT;
    SET avg_scr = (SELECT AVG(cr.score) FROM corrections AS cr WHERE cr.user_id = user_id);
    UPDATE users SET average_score = avg_scr WHERE id = user_id;
END
##
DELIMITER ;
