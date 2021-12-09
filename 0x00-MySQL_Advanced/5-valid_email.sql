-- sql script that creates a trigger that resets the valid_email
-- when the email has been changed
DELIMITER ##
CREATE TRIGGER validate_email_before_update
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email
    THEN 
        SET NEW.valid_email = 0;
    END IF;
END
##
DELIMITER ;
