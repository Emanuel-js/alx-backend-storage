-- sql script that creates a function SafeDiv
-- the function divies & retuns the first by the second number

DROP FUNCTION IF EXISTS SafeDiv;
DELIMITER ##
CREATE FUNCTION SafeDiv(
    a INT,
    b INT
)
RETURNS FLOAT DETERMINISTIC
BEGIN
    DECLARE rslt FLOAT;
    IF (b = 0)
    THEN
        SET rslt = 0;
    ELSE
        SET rslt = a / b;
    END IF;
    RETURN (rslt);
END
##
DELIMITER ;
