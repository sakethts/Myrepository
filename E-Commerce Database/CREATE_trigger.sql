-- Trigger: check_inventory on mydb.product

-- DROP TRIGGER check_inventory ON mydb.product;

CREATE TRIGGER check_inventory
  AFTER UPDATE
  ON mydb.product
  FOR EACH ROW
  EXECUTE PROCEDURE mydb."CHECK_STOCK"();
