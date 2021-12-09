-- sql script to create a trigger that decreses the quantity
-- after adding new order

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders 
FOR EACH ROW 
UPDATE items SET quantity = quantity - NEW.number
WHERE name = NEW.item_name
