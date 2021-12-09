-- sql script that creates an index 
-- on the names table & first letter of name

CREATE INDEX idx_name_first ON names (name(1));
