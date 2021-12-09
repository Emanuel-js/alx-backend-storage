-- sql script to create a stored procedure ComputeAverageWeightedScoreForUser
-- that computes & store the average weighted score of a student

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER ##
CREATE PROCEDURE ComputeAverageWeightedScoreForUser(
    IN user_id INT
)
BEGIN
    DECLARE avr_wgt_score FLOAT;
    SET avr_wgt_score = (SELECT SUM(cr.score * p.weight) / SUM(p.weight)
                        FROM corrections AS cr INNER JOIN 
                        projects AS p ON p.id = cr.project_id INNER JOIN
                        users AS u ON u.id = cr.user_id
                        WHERE u.id = user_id);
    UPDATE users SET average_score = avr_wgt_score WHERE id = user_id;
END
##
DELIMITER ;
