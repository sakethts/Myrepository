-- Function: mydb.create_address(character varying, character varying, integer, character varying, character varying, bigint, bigint)

-- DROP FUNCTION mydb.create_address(character varying, character varying, integer, character varying, character varying, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.create_address(
    "city " character varying,
    state character varying,
    zip_code integer,
    street character varying,
    country character varying,
    user_id bigint,
    card_id bigint)
  RETURNS bigint[] AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0; 
BEGIN 
INSERT INTO mydb.address
    VALUES ($1, $2, $3,$4 , $5, DEFAULT, $6, $7) RETURNING address_id INTO insert_id;
RETURN insert_id;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_address(character varying, character varying, integer, character varying, character varying, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_address(character varying, character varying, integer, character varying, character varying, bigint, bigint) IS 'inserts data into address table';

-- Function: mydb.create_carriersfunction(date, integer, boolean, boolean)

-- DROP FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean);

CREATE OR REPLACE FUNCTION mydb.create_carriersfunction(
    shipment_date date,
    order_id integer,
    international_domestic boolean,
    hazardous boolean)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.carriers
    VALUES ($1, $2, $3, $4, DEFAULT) RETURNING carrier_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean) IS 'inserts data into carriers table ';

-- Function: mydb.create_carriersfunction(date, integer, boolean, boolean)

-- DROP FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean);

CREATE OR REPLACE FUNCTION mydb.create_carriersfunction(
    shipment_date date,
    order_id integer,
    international_domestic boolean,
    hazardous boolean)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.carriers
    VALUES ($1, $2, $3, $4, DEFAULT) RETURNING carrier_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_carriersfunction(date, integer, boolean, boolean) IS 'inserts data into carriers table ';
-- Function: mydb.create_customer(character varying, character varying, character varying, integer, bigint)

-- DROP FUNCTION mydb.create_customer(character varying, character varying, character varying, integer, bigint);

CREATE OR REPLACE FUNCTION mydb.create_customer(
    fullname character varying,
    "password " character varying,
    emailaddress character varying,
    credit_balance integer,
    phone_number bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN

INSERT INTO mydb.customer
    VALUES (DEFAULT, $1, $2, $3, $4, $5) RETURNING user_id INTO insert_id;
RETURN insert_id;

END;
    $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_customer(character varying, character varying, character varying, integer, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_customer(character varying, character varying, character varying, integer, bigint) IS 'inserts new data into customers table ';
-- Function: mydb.create_exchangefunction(integer, character varying, character varying, integer, bigint, bigint)

-- DROP FUNCTION mydb.create_exchangefunction(integer, character varying, character varying, integer, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.create_exchangefunction(
    product_id integer,
    type character varying,
    exchange_reason character varying,
    price integer,
    order_id bigint,
    return_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.exchange
    VALUES ( DEFAULT, $1, $2,$3 , $4, $5, 
            $6)
 RETURNING exchange_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_exchangefunction(integer, character varying, character varying, integer, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_exchangefunction(integer, character varying, character varying, integer, bigint, bigint) IS 'inserts data into exchange table ';
-- Function: mydb.create_orderfunction(integer, date, bigint)

-- DROP FUNCTION mydb.create_orderfunction(integer, date, bigint);

CREATE OR REPLACE FUNCTION mydb.create_orderfunction(
    cost integer,
    order_date date,
    address_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0; 
BEGIN
INSERT INTO mydb."order"
    VALUES (DEFAULT,$1, $2,$3 ) RETURNING order_id INTO insert_id; 
RETURN insert_id; 
END;    $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_orderfunction(integer, date, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_orderfunction(integer, date, bigint) IS 'inserts data into order table';
-- Function: mydb.create_paymentmethod(bigint, integer, date, character varying, character varying, bigint)

-- DROP FUNCTION mydb.create_paymentmethod(bigint, integer, date, character varying, character varying, bigint);

CREATE OR REPLACE FUNCTION mydb.create_paymentmethod(
    cardnumber bigint,
    security_code integer,
    expiration_date date,
    credit_debit_card character varying,
    name_on_card character varying,
    user_id bigint)
  RETURNS bigint AS
$BODY$DECLARE
insert_id BIGINT DEFAULT 0;
BEGIN 
INSERT INTO mydb.create_paymentmethod
    VALUES (DEFAULT, $1, $2, $3, $4, $5, $6) RETURNING card_id INTO insert_id; 
RETURN insert_id; 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_paymentmethod(bigint, integer, date, character varying, character varying, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_paymentmethod(bigint, integer, date, character varying, character varying, bigint) IS 'inserts data into table ';
-- Function: mydb.create_product_has_supplierfunction(bigint, bigint, integer)

-- DROP FUNCTION mydb.create_product_has_supplierfunction(bigint, bigint, integer);

CREATE OR REPLACE FUNCTION mydb.create_product_has_supplierfunction(
    INOUT product_id bigint,
    INOUT supplier_id bigint,
    IN cost integer)
  RETURNS record AS
$BODY$DECLARE 
insert_id1 BIGINT DEFAULT 0;
insert_id2 BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.product_has_suppliers
    VALUES ($1, $2,$3)
RETURNING product_id,supplier_id INTO insert_id1,insert_id2;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_product_has_supplierfunction(bigint, bigint, integer)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_product_has_supplierfunction(bigint, bigint, integer) IS 'inserts data into table';
-- Function: mydb.create_productfunction(character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea)

-- DROP FUNCTION mydb.create_productfunction(character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea);

CREATE OR REPLACE FUNCTION mydb.create_productfunction(
    "name " character varying,
    "type " character varying,
    "ship_with_others " boolean,
    threshold integer,
    description character varying,
    order_id integer,
    "category_id " bigint,
    price integer,
    picture bytea)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.product
    VALUES (DEFAULT, $1, $2, $3, $4, $5, 
            $6, $7, $8, $9)
 RETURNING product_id INTO insert_id;
RETURN insert_id;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_productfunction(character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_productfunction(character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea) IS 'inserts data into product table ';
-- Function: mydb.create_refundfunction(integer, character varying, bigint)

-- DROP FUNCTION mydb.create_refundfunction(integer, character varying, bigint);

CREATE OR REPLACE FUNCTION mydb.create_refundfunction(
    amount integer,
    transaction character varying,
    user_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.refund
    VALUES ($1, $2, DEFAULT, $3)
RETURNING refund_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_refundfunction(integer, character varying, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_refundfunction(integer, character varying, bigint) IS 'inserts data into refund table';
-- Function: mydb.create_returnfunction(boolean, integer, character varying, bigint, bigint)

-- DROP FUNCTION mydb.create_returnfunction(boolean, integer, character varying, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.create_returnfunction(
    status boolean,
    price integer,
    return_reason character varying,
    order_id bigint,
    refund_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.return
    VALUES (DEFAULT, $1, $2, $3, $4, $5)
 RETURNING return_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_returnfunction(boolean, integer, character varying, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_returnfunction(boolean, integer, character varying, bigint, bigint) IS 'inserts data into return table';
-- Function: mydb.create_shipmentfunction(character varying, boolean, bigint)

-- DROP FUNCTION mydb.create_shipmentfunction(character varying, boolean, bigint);

CREATE OR REPLACE FUNCTION mydb.create_shipmentfunction(
    shipment_details character varying,
    ispartial boolean,
    carrier_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.shipment
    VALUES (DEFAULT, $1, $2, $3)
 RETURNING track_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_shipmentfunction(character varying, boolean, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_shipmentfunction(character varying, boolean, bigint) IS 'inserts data into shipment table';
-- Function: mydb.create_shoppingcartfunction(integer, integer, bigint, bigint, bigint, bigint)

-- DROP FUNCTION mydb.create_shoppingcartfunction(integer, integer, bigint, bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.create_shoppingcartfunction(
    price integer,
    number_of_items integer,
    product_id bigint,
    user_id bigint,
    order_id bigint,
    track_id bigint)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.shoppingcart
    VALUES (DEFAULT, $1, $2, $3, $4, $5, 
            $6)
 RETURNING cart_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_shoppingcartfunction(integer, integer, bigint, bigint, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_shoppingcartfunction(integer, integer, bigint, bigint, bigint, bigint) IS 'inserts data into shoppingcart table';
-- Function: mydb.create_suppliersfunction(character varying, character varying, integer, character varying)

-- DROP FUNCTION mydb.create_suppliersfunction(character varying, character varying, integer, character varying);

CREATE OR REPLACE FUNCTION mydb.create_suppliersfunction(
    company_name character varying,
    business_address character varying,
    discount_percentage integer,
    sales_rep_name character varying)
  RETURNS bigint AS
$BODY$DECLARE 
insert_id BIGINT DEFAULT 0;
BEGIN
INSERT INTO mydb.suppliers
    VALUES ($1, $2, $3, $4, 
            DEFAULT) RETURNING supplier_id INTO insert_id;
RETURN insert_id;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.create_suppliersfunction(character varying, character varying, integer, character varying)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.create_suppliersfunction(character varying, character varying, integer, character varying) IS 'inserts data into suppliers table ';
-- Function: mydb.delete_addressfunction(bigint)

-- DROP FUNCTION mydb.delete_addressfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_addressfunction(address_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.address WHERE address_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_addressfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_addressfunction(bigint) IS 'deletes the content from address table';
-- Function: mydb.delete_carriersfunction(bigint)

-- DROP FUNCTION mydb.delete_carriersfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_carriersfunction(carrier_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.carriers WHERE carrier_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_carriersfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_carriersfunction(bigint) IS 'deletes content from carriers table';
-- Function: mydb.delete_categoryfunction(bigint)

-- DROP FUNCTION mydb.delete_categoryfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_categoryfunction(category_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.category WHERE category_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_categoryfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_categoryfunction(bigint) IS 'deletes content from category function';
-- Function: mydb.delete_customerfunction(bigint)

-- DROP FUNCTION mydb.delete_customerfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_customerfunction(user_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.customer WHERE user_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_customerfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_customerfunction(bigint) IS 'deletes the content from customer table';
-- Function: mydb.delete_exchangefunction(bigint)

-- DROP FUNCTION mydb.delete_exchangefunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_exchangefunction(exchange_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.exchange WHERE exchange_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_exchangefunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_exchangefunction(bigint) IS 'deletes content from exchange table';
-- Function: mydb.delete_orderfunction(bigint)

-- DROP FUNCTION mydb.delete_orderfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_orderfunction(order_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.order WHERE order_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_orderfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_orderfunction(bigint) IS 'deletes data from order table';
-- Function: mydb.delete_paymentmethodfunction(bigint)

-- DROP FUNCTION mydb.delete_paymentmethodfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_paymentmethodfunction(card_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.paymentmethod WHERE card_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_paymentmethodfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_paymentmethodfunction(bigint) IS 'deletes the content in the payment table';
-- Function: mydb.delete_product_has_suppliers(bigint, bigint)

-- DROP FUNCTION mydb.delete_product_has_suppliers(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.delete_product_has_suppliers(
    product_id bigint,
    supplier_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.product_has_suppliers WHERE product_id = $1 AND supplier_id = $2;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_product_has_suppliers(bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_product_has_suppliers(bigint, bigint) IS 'deletes content from product_has_suppliers table';
-- Function: mydb.delete_productfunction(bigint)

-- DROP FUNCTION mydb.delete_productfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_productfunction(product_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.product WHERE product_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_productfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_productfunction(bigint) IS 'deletes content from product table';
-- Function: mydb.delete_refundfunction(bigint)

-- DROP FUNCTION mydb.delete_refundfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_refundfunction(refund_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.refund WHERE refund_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_refundfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_refundfunction(bigint) IS 'deletes content from refund table';
-- Function: mydb.delete_shipmentfunction(bigint)

-- DROP FUNCTION mydb.delete_shipmentfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_shipmentfunction(track_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.shipment WHERE track_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_shipmentfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_shipmentfunction(bigint) IS 'deletes content from shipment table';
-- Function: mydb.delete_shoppingcartfunction(bigint)

-- DROP FUNCTION mydb.delete_shoppingcartfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_shoppingcartfunction(cart_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.shoppingcart WHERE cart_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_shoppingcartfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_shoppingcartfunction(bigint) IS 'delete contents from shopping cart table';
-- Function: mydb.delete_suppliersfunction(bigint)

-- DROP FUNCTION mydb.delete_suppliersfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.delete_suppliersfunction(supplier_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.suppliers WHERE supplier_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.delete_suppliersfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.delete_suppliersfunction(bigint) IS 'deletes content in the suppliers table';
-- Function: mydb.update_addressfunction(character varying, character varying, integer, character varying, character varying, bigint, bigint, bigint)

-- DROP FUNCTION mydb.update_addressfunction(character varying, character varying, integer, character varying, character varying, bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.update_addressfunction(
    city1 character varying,
    state1 character varying,
    zip_code1 integer,
    street1 character varying,
    country1 character varying,
    address_id1 bigint,
    user_id1 bigint,
    card_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.address
       SET 
	city = COALESCE($2, city),
	state = COALESCE($3,state),
	zip_code = COALESCE($4,zip_code),
	street = COALESCE($5, street),
	country = COALESCE($6, country),
	user_id = COALESCE($7, user_id),
        card_id = COALESCE($8,card_id)
	WHERE address_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_addressfunction(character varying, character varying, integer, character varying, character varying, bigint, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_addressfunction(character varying, character varying, integer, character varying, character varying, bigint, bigint, bigint) IS 'updates address table ';
-- Function: mydb.update_carriersfunction(date, integer, boolean, boolean, bigint)

-- DROP FUNCTION mydb.update_carriersfunction(date, integer, boolean, boolean, bigint);

CREATE OR REPLACE FUNCTION mydb.update_carriersfunction(
    shipment_date1 date,
    order_id1 integer,
    international_domestic1 boolean,
    hazardous1 boolean,
    carrier_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.carriers
       SET 
	shipment_date = COALESCE($2, shipment_date),
	order_id = COALESCE($3,order_id),
	international_domestic = COALESCE($4,international_domestic),
	hazardous = COALESCE($5, hazardous)
	WHERE carrier_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_carriersfunction(date, integer, boolean, boolean, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_carriersfunction(date, integer, boolean, boolean, bigint) IS 'updates content in the carriers table';
-- Function: mydb.update_categoryfunction(bigint, integer, character varying)

-- DROP FUNCTION mydb.update_categoryfunction(bigint, integer, character varying);

CREATE OR REPLACE FUNCTION mydb.update_categoryfunction(
    category_id1 bigint,
    parent_id1 integer,
    category_name1 character varying)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.category
       SET 
	parent_id = COALESCE($2, parent_id),
	category_name = COALESCE($3,category_name)
	WHERE category_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_categoryfunction(bigint, integer, character varying)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_categoryfunction(bigint, integer, character varying) IS 'updates contents in the category table';
-- Function: mydb.update_customerfunction(bigint, character varying, character varying, character varying, integer, bigint)

-- DROP FUNCTION mydb.update_customerfunction(bigint, character varying, character varying, character varying, integer, bigint);

CREATE OR REPLACE FUNCTION mydb.update_customerfunction(
    user_id1 bigint,
    fullname1 character varying,
    password1 character varying,
    emailaddress1 character varying,
    credit_balance1 integer,
    phone_number1 bigint)
  RETURNS boolean AS
$BODY$BEGIN
UPDATE mydb.customer
       SET 
	fullname = COALESCE($2, fullname),
	password = COALESCE($3,password),
	emailaddress = COALESCE($4,emailaddress),
	credit_balance = COALESCE($5,credit_balance),
	phone_number = COALESCE ($6, phone_number)
	WHERE user_id = $1;
RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_customerfunction(bigint, character varying, character varying, character varying, integer, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_customerfunction(bigint, character varying, character varying, character varying, integer, bigint) IS 'updates data into customer table';
-- Function: mydb.update_exchangefunction(bigint, integer, character varying, character varying, integer, bigint, bigint)

-- DROP FUNCTION mydb.update_exchangefunction(bigint, integer, character varying, character varying, integer, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.update_exchangefunction(
    exchange_id1 bigint,
    product_id1 integer,
    type1 character varying,
    exchange_reason1 character varying,
    price1 integer,
    order_id1 bigint,
    return_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.exchange
       SET 
	product_id = COALESCE($2,product_id),
	type = COALESCE($3,type),
	exchange_reason = COALESCE($4, exchange_reason),
	price = COALESCE($5, price),
	order_id = COALESCE($6, order_id),
	return_id = COALESCE($7, return_id)
	WHERE exchange_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_exchangefunction(bigint, integer, character varying, character varying, integer, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_exchangefunction(bigint, integer, character varying, character varying, integer, bigint, bigint) IS 'updates content in the table';
-- Function: mydb.update_orderfunction(bigint, integer, date, bigint)

-- DROP FUNCTION mydb.update_orderfunction(bigint, integer, date, bigint);

CREATE OR REPLACE FUNCTION mydb.update_orderfunction(
    order_id1 bigint,
    cost1 integer,
    order_date1 date,
    addr_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN
UPDATE mydb.order
       SET 
	cost = COALESCE($2, cost),
	order_date = COALESCE($3,order_date),
	addr_id = COALESCE($4,addr_id)
	WHERE order_id = $1;
RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_orderfunction(bigint, integer, date, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_orderfunction(bigint, integer, date, bigint) IS 'updates data in the order table';
-- Function: mydb.update_paymentmethodfunction(bigint, bigint, integer, date, character varying, character varying, bigint)

-- DROP FUNCTION mydb.update_paymentmethodfunction(bigint, bigint, integer, date, character varying, character varying, bigint);

CREATE OR REPLACE FUNCTION mydb.update_paymentmethodfunction(
    card_id1 bigint,
    cardnumber1 bigint,
    security_code1 integer,
    expiration_date1 date,
    credit_debit_card1 character varying,
    name_on_card1 character varying,
    user_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN
UPDATE mydb.paymentmethod
       SET 
	cardnumber = COALESCE($2, cardnumber),
	security_code = COALESCE($3,security_code),
	expiration_date = COALESCE($4,expiration_date),
	credit_debit_card = COALESCE($5, credit_debit_card),
	name_on_card = COALESCE($6, name_on_card),
	user_id = COALESCE($7, user_id)
	WHERE card_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_paymentmethodfunction(bigint, bigint, integer, date, character varying, character varying, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_paymentmethodfunction(bigint, bigint, integer, date, character varying, character varying, bigint) IS 'updates the data into the table';
-- Function: mydb.update_product_has_suppliersfunction(bigint, bigint, integer)

-- DROP FUNCTION mydb.update_product_has_suppliersfunction(bigint, bigint, integer);

CREATE OR REPLACE FUNCTION mydb.update_product_has_suppliersfunction(
    product_id1 bigint,
    supplier_id1 bigint,
    supplier_cost1 integer)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.product_has_suppliers
       SET 
	supplier_cost = COALESCE($3, supplier_cost)
	WHERE product_id = $1 AND supplier_id = $2;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_product_has_suppliersfunction(bigint, bigint, integer)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_product_has_suppliersfunction(bigint, bigint, integer) IS 'updates content in the table';
-- Function: mydb.update_productfunction(bigint, character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea)

-- DROP FUNCTION mydb.update_productfunction(bigint, character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea);

CREATE OR REPLACE FUNCTION mydb.update_productfunction(
    product_id1 bigint,
    name1 character varying,
    type1 character varying,
    ship_with_others1 boolean,
    threshold1 integer,
    description1 character varying,
    shoppingcart_order_order_id1 integer,
    category_id1 bigint,
    price1 integer,
    picture1 bytea)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.product
       SET 
	name = COALESCE($2, name),
	type = COALESCE($3,type),
	ship_with_others = COALESCE($4,ship_with_others),
	threshold = COALESCE($5, threshold),
	description = COALESCE($6, description),
	shoppingcart_order_order_id = COALESCE($7, shoppingcart_order_order_id),
	category_id = COALESCE($8, category_id),
	price = COALESCE($9, price),
	picture = COALESCE($10, picture)
	WHERE product_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_productfunction(bigint, character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_productfunction(bigint, character varying, character varying, boolean, integer, character varying, integer, bigint, integer, bytea) IS 'updates content in the product table';
-- Function: mydb.update_refundfunction(integer, character varying, bigint, bigint)

-- DROP FUNCTION mydb.update_refundfunction(integer, character varying, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.update_refundfunction(
    amount1 integer,
    transaction1 character varying,
    refund_id1 bigint,
    user_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.refund
       SET 
	amount = COALESCE($2, amount),
	transaction = COALESCE($3,transaction),
	user_id = COALESCE($4,user_id)
	WHERE refund_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_refundfunction(integer, character varying, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_refundfunction(integer, character varying, bigint, bigint) IS 'updates content in the refund table';
-- Function: mydb.update_returnfunction(bigint)

-- DROP FUNCTION mydb.update_returnfunction(bigint);

CREATE OR REPLACE FUNCTION mydb.update_returnfunction(return_id bigint)
  RETURNS boolean AS
$BODY$BEGIN
DELETE FROM  mydb.return WHERE return_id = $1;

IF FOUND THEN RETURN TRUE;
ELSE RAISE EXCEPTION 'Nonexistent ID --> %' ,$1
USING HINT = 'Please check the Id entered';
END IF; 
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_returnfunction(bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_returnfunction(bigint) IS 'deletes content from return table';
-- Function: mydb.update_returnfuntion(bigint, boolean, integer, character varying, bigint, bigint)

-- DROP FUNCTION mydb.update_returnfuntion(bigint, boolean, integer, character varying, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.update_returnfuntion(
    return_id1 bigint,
    status1 boolean,
    price1 integer,
    return_reason1 character varying,
    order_id1 bigint,
    refund_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.return
       SET 
	status = COALESCE($2, status),
	price = COALESCE($3,price),
	return_reason = COALESCE($4,return_reason),
	order_id = COALESCE($5, order_id),
	refund_id = COALESCE($6, refund_id)
	WHERE return_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_returnfuntion(bigint, boolean, integer, character varying, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_returnfuntion(bigint, boolean, integer, character varying, bigint, bigint) IS 'updates the content in the return table';
-- Function: mydb.update_shipmentfunction(bigint, character varying, boolean, bigint)

-- DROP FUNCTION mydb.update_shipmentfunction(bigint, character varying, boolean, bigint);

CREATE OR REPLACE FUNCTION mydb.update_shipmentfunction(
    track_id1 bigint,
    shipment_details1 character varying,
    ispartial1 boolean,
    carrier_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.shipment
       SET 
	shipment_details = COALESCE($2, shipment_details),
	ispartial = COALESCE($3,ispartial),
	carrier_id = COALESCE($4,carrier_id)
	WHERE track_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_shipmentfunction(bigint, character varying, boolean, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_shipmentfunction(bigint, character varying, boolean, bigint) IS 'updates content in the shipment table';
-- Function: mydb.update_shoppingcartfunction(bigint, integer, integer, bigint, bigint, bigint, bigint)

-- DROP FUNCTION mydb.update_shoppingcartfunction(bigint, integer, integer, bigint, bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION mydb.update_shoppingcartfunction(
    cart_id1 bigint,
    price1 integer,
    number_of_items1 integer,
    product_id1 bigint,
    user_id1 bigint,
    order_id1 bigint,
    track_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.shoppingcart
       SET 
	price = COALESCE($2, price),
	number_of_items = COALESCE($3,number_of_items),
	product_id = COALESCE($4,product_id),
	user_id = COALESCE($5, user_id),
	order_id = COALESCE($6, order_id) ,
	track_id = COALESCE($7, track_id)
	WHERE cart_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_shoppingcartfunction(bigint, integer, integer, bigint, bigint, bigint, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_shoppingcartfunction(bigint, integer, integer, bigint, bigint, bigint, bigint) IS 'uodates the content in the shoppingcart table';
-- Function: mydb.update_suppliersfunction(character varying, character varying, integer, character varying, bigint)

-- DROP FUNCTION mydb.update_suppliersfunction(character varying, character varying, integer, character varying, bigint);

CREATE OR REPLACE FUNCTION mydb.update_suppliersfunction(
    company_name1 character varying,
    business_address1 character varying,
    discount_percentage1 integer,
    sales_rep_name1 character varying,
    supplier_id1 bigint)
  RETURNS boolean AS
$BODY$BEGIN

UPDATE mydb.suppliers
       SET 
	company_name = COALESCE($2, company_name),
	business_address = COALESCE($3,business_address),
	discount_percentage = COALESCE($4,discount_percentage),
	sales_rep_name = COALESCE($5, sales_rep_name)
	WHERE supplier_id = $1;

RETURN FOUND;

END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION mydb.update_suppliersfunction(character varying, character varying, integer, character varying, bigint)
  OWNER TO fall15_stata003;
COMMENT ON FUNCTION mydb.update_suppliersfunction(character varying, character varying, integer, character varying, bigint) IS 'updates suppliers table content';
-- Function: mydb."RETRIEVE_CUSTOMER"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_CUSTOMER"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_CUSTOMER"(user_id bigint)
  RETURNS mydb.customer AS
'SELECT * FROM mydb.customer WHERE user_id = $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_CUSTOMER"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_CUSTOMER_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_CUSTOMER_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_CUSTOMER_ALL"()
  RETURNS SETOF mydb.customer AS
'SELECT * FROM mydb.CUSTOMER;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_CUSTOMER_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_address"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_address"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_address"(address_id bigint)
  RETURNS mydb.address AS
'SELECT * FROM mydb.address WHERE address_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_address"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_address_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_address_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_address_ALL"()
  RETURNS SETOF mydb.address AS
'SELECT * FROM mydb.address;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_address_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_carriers"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_carriers"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_carriers"(carrier_id bigint)
  RETURNS mydb.carriers AS
'SELECT * FROM mydb.carriers WHERE carrier_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_carriers"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_carriers_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_carriers_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_carriers_ALL"()
  RETURNS SETOF mydb.carriers AS
'SELECT * FROM mydb.carriers;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_carriers_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_category"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_category"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_category"(category_id bigint)
  RETURNS mydb.category AS
'SELECT * FROM mydb.category WHERE category_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_category"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_category_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_category_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_category_ALL"()
  RETURNS SETOF mydb.category AS
'SELECT * FROM mydb.category;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_category_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_exchange"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_exchange"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_exchange"(exchange_id bigint)
  RETURNS mydb.exchange AS
'SELECT * FROM mydb.exchange WHERE exchange_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_exchange"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_exchange_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_exchange_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_exchange_ALL"()
  RETURNS SETOF mydb.exchange AS
'SELECT * FROM mydb.exchange;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_exchange_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_order"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_order"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_order"(order_id bigint)
  RETURNS mydb."order" AS
'SELECT * FROM mydb.order WHERE order_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_order"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_order_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_order_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_order_ALL"()
  RETURNS SETOF mydb."order" AS
'SELECT * FROM mydb.order;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_order_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_paymentmethod"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_paymentmethod"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_paymentmethod"(card_id bigint)
  RETURNS mydb.paymentmethod AS
'SELECT * FROM mydb.paymentmethod WHERE card_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_paymentmethod"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_paymentmethod_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_paymentmethod_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_paymentmethod_ALL"()
  RETURNS SETOF mydb.paymentmethod AS
'SELECT * FROM mydb.paymentmethod;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_paymentmethod_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_product"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_product"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_product"(product_id bigint)
  RETURNS mydb.product AS
'SELECT * FROM mydb.product WHERE product_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_product"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_product_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_product_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_product_ALL"()
  RETURNS SETOF mydb.product AS
'SELECT * FROM mydb.product;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_product_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_product_has_suppliers"(bigint, bigint)

-- DROP FUNCTION mydb."RETRIEVE_product_has_suppliers"(bigint, bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_product_has_suppliers"(
    product_id bigint,
    supplier_id bigint)
  RETURNS mydb.product_has_suppliers AS
'SELECT * FROM mydb.product_has_suppliers WHERE product_id= $1 AND supplier_id= $2;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_product_has_suppliers"(bigint, bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_product_has_suppliers_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_product_has_suppliers_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_product_has_suppliers_ALL"()
  RETURNS SETOF mydb.product_has_suppliers AS
'SELECT * FROM mydb.product_has_suppliers;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_product_has_suppliers_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_refund"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_refund"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_refund"(refund_id bigint)
  RETURNS mydb.refund AS
'SELECT * FROM mydb.refund WHERE refund_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_refund"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_refund_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_refund_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_refund_ALL"()
  RETURNS SETOF mydb.refund AS
'SELECT * FROM mydb.refund;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_refund_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_return"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_return"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_return"(return_id bigint)
  RETURNS mydb.return AS
'SELECT * FROM mydb.return WHERE return_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_return"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_return_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_return_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_return_ALL"()
  RETURNS SETOF mydb.return AS
'SELECT * FROM mydb.return;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_return_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_shipment"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_shipment"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_shipment"(track_id bigint)
  RETURNS mydb.shipment AS
'SELECT * FROM mydb.shipment WHERE track_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_shipment"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_shipment_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_shipment_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_shipment_ALL"()
  RETURNS SETOF mydb.shipment AS
'SELECT * FROM mydb.shipment;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_shipment_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_shoppingcart"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_shoppingcart"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_shoppingcart"(cart_id bigint)
  RETURNS mydb.shoppingcart AS
'SELECT * FROM mydb.shoppingcart WHERE cart_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_shoppingcart"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_shoppingcart_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_shoppingcart_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_shoppingcart_ALL"()
  RETURNS SETOF mydb.shoppingcart AS
'SELECT * FROM mydb.shoppingcart;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_shoppingcart_ALL"()
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_suppliers"(bigint)

-- DROP FUNCTION mydb."RETRIEVE_suppliers"(bigint);

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_suppliers"(supplier_id bigint)
  RETURNS mydb.suppliers AS
'SELECT * FROM mydb.suppliers WHERE supplier_id= $1 ;'
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION mydb."RETRIEVE_suppliers"(bigint)
  OWNER TO fall15_stata003;
-- Function: mydb."RETRIEVE_suppliers_ALL"()

-- DROP FUNCTION mydb."RETRIEVE_suppliers_ALL"();

CREATE OR REPLACE FUNCTION mydb."RETRIEVE_suppliers_ALL"()
  RETURNS SETOF mydb.suppliers AS
'SELECT * FROM mydb.suppliers;'
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION mydb."RETRIEVE_suppliers_ALL"()
  OWNER TO fall15_stata003;
