-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS mydb cascade;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA  mydb;
SET SCHEMA 'mydb' ;

-- -----------------------------------------------------
-- Table mydb.customer
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.customer ;

CREATE TABLE  mydb.customer (
  user_id BIGSERIAL NOT NULL ,
  fullname VARCHAR(20) NOT NULL ,
  password VARCHAR(20) NOT NULL ,
  emailaddress VARCHAR(40) NOT NULL ,
  credit_balance INT NULL CHECK(credit_balance > 0),
  phone_number BIGINT NOT NULL ,
  PRIMARY KEY (user_id)  )
;

CREATE UNIQUE INDEX user_id_UNIQUE ON mydb.customer (user_id ASC)  ;

CREATE UNIQUE INDEX email_address_UNIQUE ON mydb.customer (emailaddress ASC)  ;

CREATE UNIQUE INDEX phone_number_UNIQUE ON mydb.customer (phone_number ASC)  ;


-- -----------------------------------------------------
-- Table mydb.payment method
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.paymentmethod ;

CREATE TABLE  mydb.paymentmethod (
  card_id BIGSERIAL , 
  cardnumber BIGINT NOT NULL CHECK(length(cardnumber::BIGINT::Text)=16),
  security_code INT NOT NULL ,
  expiration_date DATE NOT NULL ,
  credit_debit_card VARCHAR(25) NOT NULL ,
  name_on_card VARCHAR(25) NOT NULL ,
  user_id BIGINT NOT NULL ,
  PRIMARY KEY (card_id)  ,
  CONSTRAINT fk_customer_paymentmethod
    FOREIGN KEY (user_id)
    REFERENCES mydb.customer (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX cardnumber_UNIQUE ON mydb.paymentmethod (cardnumber ASC)  ;

CREATE INDEX fk_customer_paymentmethod_idx ON mydb.paymentmethod (user_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.address
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.address ;

CREATE TABLE  mydb.address (
  city VARCHAR(20) NOT NULL ,
  state VARCHAR(20) NOT NULL ,
  zip_code INT NOT NULL ,
  street VARCHAR(20) NOT NULL ,
  country VARCHAR(20) NOT NULL ,
  address_id BIGSERIAL NOT NULL ,
  user_id BIGINT NOT NULL ,
  card_id BIGINT NULL ,
  PRIMARY KEY (address_id)  ,
  CONSTRAINT fk_address_customer
    FOREIGN KEY (user_id)
    REFERENCES mydb.customer (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_address_paymentmethod1
    FOREIGN KEY (card_id)
    REFERENCES mydb.paymentmethod (card_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_address_customer_idx ON mydb.address (user_id ASC)  ;

CREATE INDEX fk_address_paymentmethod1_idx ON mydb.address (card_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.order
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.order ;

CREATE TABLE  mydb.order (
  order_id BIGSERIAL NOT NULL  ,
  cost INT NOT NULL CHECK(cost >0) ,
  order_date DATE NOT NULL ,
  addr_id BIGINT NULL ,
  PRIMARY KEY (order_id)  ,
  CONSTRAINT fk_order_address
    FOREIGN KEY (addr_id)
    REFERENCES mydb.address (address_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX order_id_UNIQUE ON mydb.order (order_id ASC)  ;

CREATE INDEX fk_order_address_idx ON mydb.order (addr_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.category
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.category ;

CREATE TABLE  mydb.category (
  category_id BIGSERIAL NOT NULL ,
  parent_id INT NOT NULL  ,
  category_name VARCHAR(25) NOT NULL ,
  PRIMARY KEY (category_id)  )
;

CREATE UNIQUE INDEX parent_id_UNIQUE ON mydb.category (parent_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.product
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.product ;

CREATE TABLE  mydb.product (
  product_id BIGSERIAL NOT NULL  ,
  name VARCHAR(25) NOT NULL ,
  type VARCHAR(20) NOT NULL ,
  ship_with_others BOOLEAN NOT NULL ,
  threshold INT NOT NULL ,
  description VARCHAR(25) NOT NULL ,
  shoppingcart_order_order_id INT NOT NULL ,
  category_id BIGINT NOT NULL ,
  price INT NOT NULL ,
  picture BYTEA,
  PRIMARY KEY (product_id)  ,
  CONSTRAINT fk_product_category
    FOREIGN KEY (category_id)
    REFERENCES mydb.category (category_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX product_id_UNIQUE ON mydb.product (product_id ASC)  ;

CREATE INDEX fk_product_category_idx ON mydb.product (category_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.suppliers
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.suppliers ;

CREATE TABLE  mydb.suppliers (
  company_name VARCHAR(25) NOT NULL ,
  business_address VARCHAR(25) NOT NULL ,
  discount_percentage INT NOT NULL ,
  sales_rep_name VARCHAR(25) NOT NULL ,
  supplier_id BIGSERIAL NOT NULL ,
  PRIMARY KEY (supplier_id)  )
;


-- -----------------------------------------------------
-- Table mydb.carriers
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.carriers ;

CREATE TABLE  mydb.carriers (
  shipment_date DATE NOT NULL ,
  order_id INT NOT NULL ,
  international_domestic BOOLEAN NOT NULL ,
  hazardous BOOLEAN NOT NULL ,
  carrier_id BIGSERIAL NOT NULL ,
  PRIMARY KEY (carrier_id)  )
;

CREATE UNIQUE INDEX order_id_UNIQUE1 ON mydb.carriers (order_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.shipment
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.shipment ;

CREATE TABLE  mydb.shipment (
  track_id BIGSERIAL NOT NULL  ,
  shipment_details VARCHAR(25) NOT NULL ,
  ispartial BOOLEAN NOT NULL ,
  carrier_id BIGINT NOT NULL ,
  PRIMARY KEY (track_id)  ,
  CONSTRAINT fk_shipment_carrier
    FOREIGN KEY (carrier_id)
    REFERENCES mydb.carriers (carrier_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX track_id_UNIQUE ON mydb.shipment (track_id ASC)  ;

CREATE INDEX fk_shipment_carrier_idx ON mydb.shipment (carrier_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.refund
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.refund ;

CREATE TABLE  mydb.refund (
  amount INT NOT NULL CHECK(amount >0) ,
  transaction VARCHAR(25) NOT NULL ,
  refund_id BIGSERIAL NOT NULL  ,
  customer_user_id BIGINT NOT NULL ,
  PRIMARY KEY (refund_id)  ,
  CONSTRAINT fk_refund_customer1
    FOREIGN KEY (customer_user_id)
    REFERENCES mydb.customer (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX transaction_UNIQUE ON mydb.refund (transaction ASC)  ;

CREATE INDEX fk_refund_customer1_idx ON mydb.refund (customer_user_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.exchange
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.exchange ;

CREATE TABLE  mydb.exchange (
  exchange_id BIGSERIAL NOT NULL  ,
  product_id INT NOT NULL ,
  type VARCHAR(25) NOT NULL ,
  exchange_reason VARCHAR(25) NOT NULL ,
  price INT NOT NULL ,
  order_order_id BIGINT NOT NULL ,
  refund_return_id BIGINT NOT NULL ,
  PRIMARY KEY (exchange_id)  ,
  CONSTRAINT fk_exchange_order1
    FOREIGN KEY (order_order_id)
    REFERENCES mydb.order (order_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_exchange_refund1
    FOREIGN KEY (refund_return_id )
    REFERENCES mydb.refund (refund_id )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX exchange_id_UNIQUE ON mydb.exchange (exchange_id ASC)  ;

CREATE UNIQUE INDEX product_id_UNIQUE1 ON mydb.exchange (product_id ASC)  ;

CREATE INDEX fk_exchange_order1_idx ON mydb.exchange (order_order_id ASC)  ;

CREATE INDEX fk_exchange_refund1_idx ON mydb.exchange (refund_return_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.return
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.return ;

CREATE TABLE  mydb.return (
  return_id BIGSERIAL NOT NULL  ,
  status BOOLEAN NOT NULL ,
  price INT NOT NULL ,
  return_reason VARCHAR(25) NOT NULL ,
  order_order_id BIGINT NOT NULL ,
  refund_id BIGINT NOT NULL ,
  PRIMARY KEY (return_id)  ,
  CONSTRAINT fk_return_order1
    FOREIGN KEY (order_order_id)
    REFERENCES mydb.order (order_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_return_refund1
    FOREIGN KEY (refund_id)
    REFERENCES mydb.refund (refund_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE UNIQUE INDEX return_id_UNIQUE ON mydb.return (return_id ASC)  ;

CREATE INDEX fk_return_order1_idx ON mydb.return (order_order_id ASC)  ;

CREATE INDEX fk_return_refund1_idx ON mydb.return (refund_id ASC)  ;



-- -----------------------------------------------------
-- Table mydb.shoppingcart
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.shoppingcart ;

CREATE TABLE  mydb.shoppingcart (
  cart_id BIGSERIAL NOT NULL ,
  price INT NULL CHECK(price >0),
  number_of_items INT NULL  ,
  product_id BIGINT NOT NULL ,
  user_id BIGINT NOT NULL ,
  order_id BIGINT NULL ,
  track_id BIGINT NOT NULL ,
  PRIMARY KEY (cart_id)  ,
  CONSTRAINT fk_product_shoppingcart
    FOREIGN KEY (product_id)
    REFERENCES mydb.product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_shoppingcart_customer
    FOREIGN KEY (user_id)
    REFERENCES mydb.customer (user_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_shoppingcart_order
    FOREIGN KEY (order_id)
    REFERENCES mydb.order (order_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_shoppingcart_shipment
    FOREIGN KEY (track_id)
    REFERENCES mydb.shipment (track_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_product_shoppingcart_idx ON mydb.shoppingcart (product_id ASC)  ;

CREATE INDEX fk_shoppingcart_customer_idx ON mydb.shoppingcart (user_id ASC)  ;

CREATE INDEX fk_shoppingcart_order_idx ON mydb.shoppingcart (order_id ASC)  ;

CREATE INDEX fk_shoppingcart_shipment_idx ON mydb.shoppingcart (track_id ASC)  ;


-- -----------------------------------------------------
-- Table mydb.product_has_suppliers
-- -----------------------------------------------------
DROP TABLE IF EXISTS mydb.product_has_suppliers ;

CREATE TABLE  mydb.product_has_suppliers (
  product_id BIGINT NOT NULL ,
  supplier_id BIGINT NOT NULL ,
  supplier_cost INT NULL ,
  PRIMARY KEY (product_id, supplier_id)  ,
  CONSTRAINT fk_product_has_suppliers_product1
    FOREIGN KEY (product_id)
    REFERENCES mydb.product (product_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_product_has_suppliers_suppliers1
    FOREIGN KEY (supplier_id)
    REFERENCES mydb.suppliers (supplier_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

CREATE INDEX fk_product_has_suppliers_suppliers1_idx ON mydb.product_has_suppliers (supplier_id ASC)  ;

CREATE INDEX fk_product_has_suppliers_product1_idx ON mydb.product_has_suppliers (product_id ASC)  ;
