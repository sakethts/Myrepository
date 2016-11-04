-- Function: mydb."ADD_TO_cart"(bigint, bigint, integer, bigint, bigint, integer)

-- DROP FUNCTION mydb."ADD_TO_cart"(bigint, bigint, integer, bigint, bigint, integer);

CREATE OR REPLACE FUNCTION mydb."ADD_TO_cart"(
    user_id bigint,
    product_id bigint,
    number_of_items integer,
    order_id bigint,
    track_id bigint,
    price integer)
  RETURNS bigint AS
$BODY$DECLARE

cart BIGINT DEFAULT 0;

success BOOLEAN;

BEGIN

SELECT cart_id INTO cart FROM mydb.shoppingcart where user_id = $2 AND product_id = $1 AND order_id = $3 AND track_id = $4 AND price = $5 AND number_of_items = $6;

IF FOUND THEN 
cart := mydb."create_shoppingcartfunction"( $5, $6,$1,$2, $3, $4);

END IF;

RETURN cart;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."ADD_TO_cart"(bigint, bigint, integer, bigint, bigint, integer)
  OWNER TO fall15_stata003;
-- Function: mydb."CHARGE_CUSTOMER"(bigint, integer, integer)

-- DROP FUNCTION mydb."CHARGE_CUSTOMER"(bigint, integer, integer);

CREATE OR REPLACE FUNCTION mydb."CHARGE_CUSTOMER"(
    user_id bigint,
    credit integer,
    credit_balance integer)
  RETURNS void AS
$BODY$DECLARE

credit int DEFAULT 0;

BEGIN

	SELECT credit_balance INTO credit FROM mydb.customer WHERE user_id = $1;
	IF FOUND THEN
		PERFORM mydb."update_customerfunction"($1, NULL, NULL, NULL,credit - $2, NULL);
		RAISE NOTICE 'Customer charged % from his/her store credit', $2;
	ELSE 
		RAISE EXCEPTION 'Invalid ID --> %', $1
		USING HINT = 'Please check your entered ID';
	END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."CHARGE_CUSTOMER"(bigint, integer, integer)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."CHARGE_CUSTOMER"(bigint, integer, integer) IS 'Charges the customer for an order';
-- Function: mydb."GET_AVAILABILITY"(bigint, bigint)

-- DROP FUNCTION mydb."GET_AVAILABILITY"(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb."GET_AVAILABILITY"(
    product_id bigint,
    order_id bigint)
  RETURNS integer AS
$BODY$DECLARE

available INTEGER DEFAULT 0;

BEGIN

SELECT product.threshold INTO available
FROM mydb.product 
WHERE product_id = $1 AND order_id = $2;

RETURN available;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."GET_AVAILABILITY"(bigint, bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."GET_PRODUCTS_BY_CATEGORY"(bigint)

-- DROP FUNCTION mydb."GET_PRODUCTS_BY_CATEGORY"(bigint);

CREATE OR REPLACE FUNCTION mydb."GET_PRODUCTS_BY_CATEGORY"(category_id bigint)
  RETURNS mydb.product AS
'SELECT * FROM mydb.product WHERE category_id = $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."GET_PRODUCTS_BY_CATEGORY"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."LOGIN"(character varying, character varying)

-- DROP FUNCTION mydb."LOGIN"(character varying, character varying);

CREATE OR REPLACE FUNCTION mydb."LOGIN"(
    emailaddress character varying,
    "PASSWORD" character varying)
  RETURNS boolean AS
$BODY$DECLARE

CUSTOMER BIGINT DEFAULT 0;

BEGIN

SELECT user_id INTO CUSTOMER FROM mydb.CUSTOMER WHERE emailaddress = $1 AND PASSWORD = $2;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'INVALID login credentials'
      USING HINT = 'Please check the data entered';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."LOGIN"(character varying, character varying)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."LOGIN"(character varying, character varying) IS 'Function to login to the system';
-- Function: mydb."SET_PREFFERED_PAYMENT_METHOD"(bigint, bigint)

-- DROP FUNCTION mydb."SET_PREFFERED_PAYMENT_METHOD"(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb."SET_PREFFERED_PAYMENT_METHOD"(
    user_id bigint,
    card_id bigint)
  RETURNS void AS
$BODY$DECLARE

CARD BIGINT DEFAULT 0;

BEGIN

SELECT card_id INTO CARD FROM mydb.paymentmethod WHERE card_id = $2 and user_id = $1;

IF FOUND THEN
	UPDATE mydb.paymentmethod
	SET 
	is_preferred = TRUE
	WHERE card_id = CARD;

	UPDATE mydb.paymentmethod
	SET 
	is_preferred = FALSE
	WHERE card_id <> CARD
	AND user_id = $1
	AND is_preferred = TRUE;

ELSE RAISE EXCEPTION 'INVALID data entered'
      USING HINT = 'Please check your data entered';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."SET_PREFFERED_PAYMENT_METHOD"(bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."SET_PREFFERED_PAYMENT_METHOD"(bigint, bigint) IS 'Sets the preffered credit card for payment of the order';
-- Function: mydb."SET_PREFFERED_SHIPPING_ADDRESS"(bigint, bigint)

-- DROP FUNCTION mydb."SET_PREFFERED_SHIPPING_ADDRESS"(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb."SET_PREFFERED_SHIPPING_ADDRESS"(
    user_id bigint,
    address_id bigint)
  RETURNS void AS
$BODY$DECLARE

ADDRESS BIGINT DEFAULT 0;

BEGIN

SELECT address_id INTO ADDRESS FROM mydb.ADDRESS WHERE address_id = $2 and user_id = $1;

IF FOUND THEN
	UPDATE mydb.address
	SET 
	preferred = TRUE
	WHERE address_id = ADDRESS;

	UPDATE mydb.address
	SET 
	preferred = FALSE
	WHERE address_id <> ADDRESS
	AND user_id = $1
	AND preferred = TRUE;

ELSE RAISE EXCEPTION 'INVALID address_id and uer_id'
      USING HINT = 'Please check the data entered';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."SET_PREFFERED_SHIPPING_ADDRESS"(bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."SET_PREFFERED_SHIPPING_ADDRESS"(bigint, bigint) IS 'Sets the preferred address of the customer';
-- Function: mydb."SHIP_ITEM"(bigint, bigint, boolean, character varying)

-- DROP FUNCTION mydb."SHIP_ITEM"(bigint, bigint, boolean, character varying);

CREATE OR REPLACE FUNCTION mydb."SHIP_ITEM"(
    "ORDER_ID" bigint,
    "PRODUCT_ID" bigint,
    "IS_PARTIAL" boolean,
    "SHIPMENT_DETAIL" character varying)
  RETURNS void AS
$BODY$DECLARE

op_id BIGINT DEFAULT 0;
customer BIGINT DEFAULT 0;
cust_country CHARACTER VARYING;
is_international_ship BOOLEAN DEFAULT FALSE;
is_product_hazardous BOOLEAN DEFAULT FALSE;
carrier BIGINT DEFAULT 0;
ship_id BIGINT DEFAULT 0;
prod_cost integer DEFAULT 0;
store_credit integer DEFAULT 0;
card_charge integer DEFAULT 0;
cust_store_credit integer DEFAULT 0;
num_product INTEGER DEFAULT 0;
prod_stock INTEGER DEFAULT 0;

BEGIN

SELECT cart_id INTO op_id FROM mydb.shoppingcart WHERE order_id = $1 and product_id = $2;

IF FOUND THEN
	-- Get the customer id and country info for address
	SELECT a.user_id, a.country INTO customer, cust_country
	FROM mydb.ORDER o join mydb.ADDRESS a
	ON a.address_id = o.addr_id AND  o.order_id = $1;

	-- Check if it is an international shipment
	IF cust_country <> 'USA' THEN
	is_international_ship := TRUE;
	ELSE is_international_ship := FALSE;
	END IF;

	-- Select preffered carrier based on conditions calculated before.
	IF is_international_ship THEN
		SELECT carrier_id INTO carrier FROM mydb.carriers WHERE international_domestic =  TRUE AND hazardous = FALSE;
	ELSE
		SELECT carrier_id INTO carrier FROM mydb.carriers WHERE hazardous = FALSE;
	END IF;

	-- Calculate the payment to be charged to the customer.
	SELECT credit_balance INTO cust_store_credit FROM mydb.CUSTOMER WHERE user_id = customer;
	prod_cost := prod_cost * num_product;
	IF prod_cost >= cust_store_credit THEN
		card_charge := prod_cost - cust_store_credit;
		store_credit := cust_store_credit;
	ELSE
	card_charge := 1;
	store_credit := prod_cost;
	END IF; 

	-- Calculate the new stock.
	IF prod_stock < num_product
	THEN RAISE EXCEPTION 'Insufficient number of products for shipment'
	USING HINT = 'Please update prodct stock';
	ELSE prod_stock := prod_stock - num_product;
	END IF;	

	-- Create the shipping entity
	ship_id := mydb.create_shipmentfunction($4,$3, 1);
	

	-- Update the order product table with shipping detail
	PERFORM mydb.update_shoppingcartfunction(op_id, null, null, null, null, null, ship_id);

	-- Update the product stock
	PERFORM mydb.update_productfunction( $2,null,null, null,prod_stock,null,null,null,null,null );

	-- Charge the customer for the product
	PERFORM mydb."CHARGE_CUSTOMER"(customer, store_credit , card_charge);

ELSE RAISE EXCEPTION 'Nonexistent ORDER_ID and PRODUCT_ID combination'
      USING HINT = 'Please check your entered data';

END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."SHIP_ITEM"(bigint, bigint, boolean, character varying)
  OWNER TO fall15_stata003;
-- Function: mydb."SHIP_ORDER"(bigint)

-- DROP FUNCTION mydb."SHIP_ORDER"(bigint);

CREATE OR REPLACE FUNCTION mydb."SHIP_ORDER"(order_id bigint)
  RETURNS void AS
$BODY$DECLARE

op_id BIGINT DEFAULT 0;
customer BIGINT DEFAULT 0;
cust_country CHARACTER VARYING;
is_international_ship BOOLEAN DEFAULT FALSE;
is_product_hazardous BOOLEAN DEFAULT FALSE;
carrier BIGINT DEFAULT 0;
ship_id BIGINT DEFAULT 0;
prod_cost NUMERIC DEFAULT 0;
store_credit NUMERIC DEFAULT 0;
card_charge NUMERIC DEFAULT 0;
cust_store_credit NUMERIC DEFAULT 0;
num_product INTEGER DEFAULT 0;
prod_stock INTEGER DEFAULT 0;

 rec RECORD;
 text character varying;

BEGIN
text := 'detail';

FOR rec IN
      SELECT product_id
      FROM mydb.shoppingcart
      WHERE order_id = $1
   LOOP
      PERFORM mydb."SHIP_ITEM"($1, rec.product_id, FALSE, text);
   END LOOP;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."SHIP_ORDER"(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."SHIP_ORDER"(bigint) IS 'Ships the product specified if present in the order';
-- Function: mydb."TOP_UP_STORE_CREDIT"(bigint)

-- DROP FUNCTION mydb."TOP_UP_STORE_CREDIT"(bigint);

CREATE OR REPLACE FUNCTION mydb."TOP_UP_STORE_CREDIT"(user_id bigint)
  RETURNS integer AS
$BODY$DECLARE

customer integer DEFAULT 0;

BEGIN

SELECT credit_balance INTO customer FROM mydb.customer WHERE user_id = $1;

IF FOUND THEN RETURN customer;
ELSE
RAISE EXCEPTION 'INVALID user_id entered'
      USING HINT = 'Please check your entered data';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."TOP_UP_STORE_CREDIT"(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."TOP_UP_STORE_CREDIT"(bigint) IS 'Retreives the customers store credit';
-- Function: mydb."UPDATE_INVENTORY"(bigint, integer)

-- DROP FUNCTION mydb."UPDATE_INVENTORY"(bigint, integer);

CREATE OR REPLACE FUNCTION mydb."UPDATE_INVENTORY"(
    "PRODUCT_ID" bigint,
    threshold integer)
  RETURNS character varying AS
$BODY$DECLARE

prod_stock INTEGER DEFAULT 0;
new_stock INTEGER DEFAULT 0;

BEGIN

SELECT threshold INTO prod_stock FROM mydb.product WHERE product_id = $1;

new_stock = prod_stock + $2;

IF FOUND THEN
	IF new_stock < 0 THEN
		new_stock = 0;
	END IF;
	PERFORM mydb.update_productfunction($1, NULL, NULL, NULL,new_stock, NULL, NULL, NULL, NULL, NULL);
	RETURN 'THE INVENTORY UPDATED SUCCESSFULY';
	
ELSE RAISE EXCEPTION 'Nonexistent ID --> %', $1
      USING HINT = 'Please check your entered ID';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."UPDATE_INVENTORY"(bigint, integer)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."UPDATE_INVENTORY"(bigint, integer) IS 'Updates the stock for the product given';
-- Function: mydb."UPDATE_PASSWORD"(character varying, character varying, character varying)

-- DROP FUNCTION mydb."UPDATE_PASSWORD"(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION mydb."UPDATE_PASSWORD"(
    emailaddress character varying,
    "OLD_PASSWORD" character varying,
    "NEW_PASSWORD" character varying)
  RETURNS character varying AS
$BODY$DECLARE

CUSTOMER BIGINT DEFAULT 0;

BEGIN

SELECT user_id INTO CUSTOMER FROM mydb.CUSTOMER WHERE emailaddress = $1 AND PASSWORD = $2;

IF FOUND THEN
	UPDATE mydb.customer
	SET 
	PASSWORD = $3
	WHERE user_id = CUSTOMER;
	
	RETURN 'Password changed successfully';

ELSE RAISE EXCEPTION 'INVALID login credentials'
      USING HINT = 'Check the data entered';
END IF;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."UPDATE_PASSWORD"(character varying, character varying, character varying)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."UPDATE_PASSWORD"(character varying, character varying, character varying) IS 'Updates password of the customer';
-- Function: mydb.add_to_cart(bigint, integer, integer, bigint, bigint, bigint, bigint)

-- DROP FUNCTION mydb.add_to_cart(bigint, integer, integer, bigint, bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.add_to_cart(
    bigint,
    integer,
    integer,
    bigint,
    bigint,
    bigint,
    bigint)
  RETURNS void AS
$BODY$ 
DECLARE 
	add_cart integer;
BEGIN
	IF EXISTS(SELECT cart_id from mydb.shoppingcart where user_id=$2) THEN		
		SELECT cart_id into add_cart from mydb.shoppingcart where user_id=$2;
		INSERT INTO mydb.shoppingcart values(default, $3, $4, $5, $2, $6, $7);
	
	END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.add_to_cart(bigint, integer, integer, bigint, bigint, bigint, bigint)
  OWNER TO fall15_stata003;
-- Function: mydb.place_order1(bigint, integer, integer, date, bigint, bigint, bigint, integer, bigint, bigint)

-- DROP FUNCTION mydb.place_order1(bigint, integer, integer, date, bigint, bigint, bigint, integer, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.place_order1(
    bigint,
    integer,
    integer,
    date,
    bigint,
    bigint,
    bigint,
    integer,
    bigint,
    bigint)
  RETURNS text AS
$BODY$ 
DECLARE
	add_order integer;
	product_quantity integer;
	argument_quantity integer;
BEGIN
	SELECT $8 into argument_quantity;
	SELECT threshold INTO product_quantity FROM mydb.product WHERE product_id = $1;
	IF (argument_quantity < product_quantity) THEN
		UPDATE mydb.product SET threshold = product_quantity - argument_quantity WHERE product_id = $1;
		INSERT INTO mydb.order values( $7,$3,$4,$5);
		INSERT INTO mydb.shoppingcart values( $9,null,$8,$1,$6, $7,$10 );
		RETURN 'ORDER IS PLACED';
	ELSE
		RAISE NOTICE 'NOT ENOUGH QUANITTY OF PRODUCT';
		RETURN 'ORDER CANNOT BE PLACED';
	END IF;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.place_order1(bigint, integer, integer, date, bigint, bigint, bigint, integer, bigint, bigint)
  OWNER TO fall15_stata003;
-- Function: mydb.remove_from_cart(bigint, bigint)

-- DROP FUNCTION mydb.remove_from_cart(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.remove_from_cart(
    bigint,
    bigint)
  RETURNS text AS
$BODY$ 
DECLARE 
	removecart bigint;
BEGIN
	IF EXISTS(SELECT product_id from mydb.shoppingcart where user_id=$2) THEN		
		SELECT product_id into removecart from mydb.shoppingcart where user_id=$2;
		delete from mydb.shoppingcart where user_id = $2 and product_id = $1;
		RETURN 'REMOVED product from the cart SUCCESSFULLY';
	ELSE
		RETURN 'NO ORDER EXIST';
		
	
	END IF;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.remove_from_cart(bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.remove_from_cart(bigint, bigint) IS 'removes data entry from the shopping cart';
-- Function: mydb."CHECK_STOCK"()

-- DROP FUNCTION mydb."CHECK_STOCK"();

CREATE OR REPLACE FUNCTION mydb."CHECK_STOCK"()
  RETURNS trigger AS
$BODY$BEGIN

IF OLD.threshold IS DISTINCT FROM NEW.threshold THEN
	IF NEW.threshold < 10 THEN
	RAISE NOTICE 'Please update stock for product with id : %' ,NEW.product_id;
	END IF;
END IF;

RETURN NEW;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb."CHECK_STOCK"()
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb."CHECK_STOCK"() IS 'Checks the stock for given product. If it is below the threshold value then it raises a notice for updating buying new stock';
