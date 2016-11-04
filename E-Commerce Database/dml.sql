-- -----------------------------------------------------
-- Table mydb.customer
-- -----------------------------------------------------
INSERT INTO mydb.customer(
            user_id, fullname, password, emailaddress, credit_balance, phone_number)
    VALUES (DEFAULT, 'johnwick', 'abcdefgh', 'johnwick@gmail.com', 15, 7894561231);
    INSERT INTO mydb.customer(
            user_id, fullname, password, emailaddress, credit_balance, phone_number)
    VALUES (DEFAULT, 'darthvader', 'darthnev', 'darthvader1@gmail.com', 20, 7863521444);
    INSERT INTO mydb.customer(
            user_id, fullname, password, emailaddress, credit_balance, phone_number)
    VALUES (DEFAULT, 'maverick', 'mav123', 'maverick2@gmail.com', 10, 7863321566);
    INSERT INTO mydb.customer(
            user_id, fullname, password, emailaddress, credit_balance, phone_number)
    VALUES (DEFAULT, 'rocky', 'rockybal', 'rocky123@ymail.com', 50, 3524141547);
    INSERT INTO mydb.customer(
            user_id, fullname, password, emailaddress, credit_balance, phone_number)
    VALUES (DEFAULT, 'george', 123456, 'george55@gmail.com', 14, 3521412414);

-- -----------------------------------------------------
-- Table mydb.payment method
-- -----------------------------------------------------	
INSERT INTO mydb.paymentmethod(
            card_id, cardnumber, security_code, expiration_date, credit_debit_card, 
            name_on_card, user_id)
    VALUES (DEFAULT, 4578945123451547, 719, '2016-10-15', 'CREDIT', 
            'john wick', 1);

INSERT INTO mydb.paymentmethod(
            card_id, cardnumber, security_code, expiration_date, credit_debit_card, 
            name_on_card, user_id)
    VALUES (DEFAULT, 7845412451365489, 879, '2017-08-15', 'CREDIT', 
            'darth vader', 2);
INSERT INTO mydb.paymentmethod(
            card_id, cardnumber, security_code, expiration_date, credit_debit_card, 
            name_on_card, user_id)
    VALUES (DEFAULT, 7845123654897842, 400, '2016-10-18', 'CREDIT', 
            'maverick', 3);
            
INSERT INTO mydb.paymentmethod(
            card_id, cardnumber, security_code, expiration_date, credit_debit_card, 
            name_on_card, user_id)
    VALUES (DEFAULT, 5784512365478945, 500, '2018-10-20', 'DEBIT', 
            'rocky', 4);

INSERT INTO mydb.paymentmethod(
            card_id, cardnumber, security_code, expiration_date, credit_debit_card, 
            name_on_card, user_id)
    VALUES (DEFAULT, 4474741424513548, 700, '2017-11-15', 'CREDIT', 
            'george', 5);

-- -----------------------------------------------------
-- Table mydb.address
-- -----------------------------------------------------
INSERT INTO mydb.address(
            city, state, zip_code, street, country, address_id, user_id, 
            card_id)
    VALUES ('MIAMI', 'FLORIDA', 33174,'southwest' , 'usa', DEFAULT, 1, 
            1);
INSERT INTO mydb.address(
            city, state, zip_code, street, country, address_id, user_id, 
            card_id)
    VALUES ('dallas', 'texas',2547 ,'northeast' , 'usa', DEFAULT, 2, 
            2);
INSERT INTO mydb.address(
            city, state, zip_code, street, country, address_id, user_id, 
            card_id)
    VALUES ('MIAMI', 'FLORIDA', 33174,'southeast' , 'usa', DEFAULT, 3, 
            3);
INSERT INTO mydb.address(
            city, state, zip_code, street, country, address_id, user_id, 
            card_id)
    VALUES ('sandiego', 'california', 58741,'northwest' , 'usa', DEFAULT, 4, 
            4);
INSERT INTO mydb.address(
            city, state, zip_code, street, country, address_id, user_id, 
            card_id)
    VALUES ('houston', 'texas', 2547,'northeast' , 'usa', DEFAULT, 5, 
            5);

-- -----------------------------------------------------

-- -----------------------------------------------------
INSERT INTO mydb."order"(
            order_id, cost, order_date, addr_id)
    VALUES (DEFAULT, 45, '2015-10-15',1 );
    INSERT INTO mydb."order"(
            order_id, cost, order_date, addr_id)
    VALUES (DEFAULT, 56, '2015-09-17',2 );
    INSERT INTO mydb."order"(
            order_id, cost, order_date, addr_id)
    VALUES (DEFAULT, 65, '2015-08-14',3 );
    INSERT INTO mydb."order"(
            order_id, cost, order_date, addr_id)
    VALUES (DEFAULT, 40, '2015-09-14',4 );
INSERT INTO mydb."order"(
            order_id, cost, order_date, addr_id)
    VALUES (DEFAULT, 30, '2015-09-22',5 );
	
-- -----------------------------------------------------
-- Table mydb.category
-- -----------------------------------------------------
INSERT INTO mydb.category(
            category_id, parent_id, category_name)
    VALUES (DEFAULT,101 , 'ELECTRONICS');
    INSERT INTO mydb.category(
            category_id, parent_id, category_name)
    VALUES (DEFAULT,102 , 'FURNITURE');
    INSERT INTO mydb.category(
            category_id, parent_id, category_name)
    VALUES (DEFAULT,103 , 'SPORTS');
INSERT INTO mydb.category(
            category_id, parent_id, category_name)
    VALUES (DEFAULT,104 , 'CLOTHING');
    INSERT INTO mydb.category(
            category_id, parent_id, category_name)
    VALUES (DEFAULT,105 , 'STATIONARY');

-- -----------------------------------------------------
-- Table mydb.product
-- -----------------------------------------------------
INSERT INTO mydb.product(
            product_id, name, type, ship_with_others, threshold, description, 
            shoppingcart_order_order_id, category_id, price, picture)
    VALUES (DEFAULT, 'dell inspiron', 'non-haz', 'false', 52, 'laptop with 8gb', 
            1, 1, 450, NULL);
INSERT INTO mydb.product(
            product_id, name, type, ship_with_others, threshold, description, 
            shoppingcart_order_order_id, category_id, price, picture)
    VALUES (DEFAULT, 'hp pavilion', 'non-haz', 'false', 45, 'laptop with 6gb', 
            2, 1, 350, NULL);
INSERT INTO mydb.product(
            product_id, name, type, ship_with_others, threshold, description, 
            shoppingcart_order_order_id, category_id, price, picture)
    VALUES (DEFAULT, 'htc one m9', 'non-haz', 'false', 110, 'brand  new mob', 
            3, 1, 550, NULL);
 INSERT INTO mydb.product(
            product_id, name, type, ship_with_others, threshold, description, 
            shoppingcart_order_order_id, category_id, price, picture)
    VALUES (DEFAULT, 'twin bed', 'non-haz', 'false', 25, 'comfortable', 
            4, 2, 85, NULL);
INSERT INTO mydb.product(
            product_id, name, type, ship_with_others, threshold, description, 
            shoppingcart_order_order_id, category_id, price, picture)
    VALUES (DEFAULT, 'bean bag', 'non-haz', 'false', 51, 'comfortable bag', 
            5, 2, 24, NULL);   

-- -----------------------------------------------------
-- Table mydb.suppliers
-- -----------------------------------------------------
INSERT INTO mydb.suppliers(
            company_name, business_address, discount_percentage, sales_rep_name, 
            supplier_id)
    VALUES ('dell computers', 'san deigo', 10, 'donald', 
            DEFAULT);
INSERT INTO mydb.suppliers(
            company_name, business_address, discount_percentage, sales_rep_name, 
            supplier_id)
    VALUES ('htc mobile', 'silicon valley', 25, 'trump', 
            DEFAULT);
INSERT INTO mydb.suppliers(
            company_name, business_address, discount_percentage, sales_rep_name, 
            supplier_id)
    VALUES ('hp computers', 'houston', 15, 'sam', 
            DEFAULT);
INSERT INTO mydb.suppliers(
            company_name, business_address, discount_percentage, sales_rep_name, 
            supplier_id)
    VALUES ('ikea furniture', 'miami', 5, 'edward', 
            DEFAULT);            
INSERT INTO mydb.suppliers(
            company_name, business_address, discount_percentage, sales_rep_name, 
            supplier_id)
    VALUES ('walmart', 'miami', 0, 'tommy', 
            DEFAULT);            

-- -----------------------------------------------------
-- Table mydb.carriers
-- -----------------------------------------------------
INSERT INTO mydb.carriers(
            shipment_date, order_id, international_domestic, hazardous, carrier_id)
    VALUES ('2015-11-12', 1, FALSE, FALSE, DEFAULT);
INSERT INTO mydb.carriers(
            shipment_date, order_id, international_domestic, hazardous, carrier_id)
    VALUES ('2015-10-25', 2, FALSE, FALSE, DEFAULT);
    INSERT INTO mydb.carriers(
            shipment_date, order_id, international_domestic, hazardous, carrier_id)
    VALUES ('2015-10-20', 3, FALSE, FALSE, DEFAULT);
INSERT INTO mydb.carriers(
            shipment_date, order_id, international_domestic, hazardous, carrier_id)
    VALUES ('2015-11-01', 4, FALSE, FALSE, DEFAULT);
INSERT INTO mydb.carriers(
            shipment_date, order_id, international_domestic, hazardous, carrier_id)
    VALUES ('2015-10-24', 5, FALSE, FALSE, DEFAULT);  

-- -----------------------------------------------------
-- Table mydb.shipment
-- -----------------------------------------------------
INSERT INTO mydb.shipment(
            track_id, shipment_details, ispartial, carrier_id)
    VALUES (DEFAULT, 'laptop to miami', FALSE, 1);
INSERT INTO mydb.shipment(
            track_id, shipment_details, ispartial, carrier_id)
    VALUES (DEFAULT, 'laptop to texas', FALSE, 2);
INSERT INTO mydb.shipment(
            track_id, shipment_details, ispartial, carrier_id)
    VALUES (DEFAULT, 'mobile to miami', FALSE, 3);
INSERT INTO mydb.shipment(
            track_id, shipment_details, ispartial, carrier_id)
    VALUES (DEFAULT, 'twinbed to sandiego', FALSE, 4);
INSERT INTO mydb.shipment(
            track_id, shipment_details, ispartial, carrier_id)
    VALUES (DEFAULT, 'bean bag to dallas', FALSE, 5);
	
-- -----------------------------------------------------
-- Table mydb.refund
-- -----------------------------------------------------
INSERT INTO mydb.refund(
            amount, transaction, refund_id, customer_user_id)
    VALUES (15, 23625415897, DEFAULT, 1); INSERT INTO mydb.refund(
            amount, transaction, refund_id, customer_user_id)
    VALUES (15, 5984784569, DEFAULT, 2);

INSERT INTO mydb.refund(
            amount, transaction, refund_id, customer_user_id)
    VALUES (50, 65489741236, DEFAULT, 3);
INSERT INTO mydb.refund(
            amount, transaction, refund_id, customer_user_id)
    VALUES (30, 56987458412, DEFAULT, 4);
INSERT INTO mydb.refund(
            amount, transaction, refund_id, customer_user_id)
    VALUES (10, 5897461236, DEFAULT, 5);
	
-- -----------------------------------------------------
-- Table mydb.exchange
-- -----------------------------------------------------
INSERT INTO mydb.exchange(
            exchange_id, product_id, type, exchange_reason, price, order_order_id, 
            refund_return_id)
    VALUES ( DEFAULT, 1, 'laptop','damaged product' , 450, 1, 
            1);
INSERT INTO mydb.exchange(
            exchange_id, product_id, type, exchange_reason, price, order_order_id, 
            refund_return_id)
    VALUES ( DEFAULT, 2, 'laptop','not working' , 350, 2, 
            2);
INSERT INTO mydb.exchange(
            exchange_id, product_id, type, exchange_reason, price, order_order_id, 
            refund_return_id)
    VALUES ( DEFAULT, 3, 'mobile','not satisfied' , 550, 3, 
            3); 
 INSERT INTO mydb.exchange(
            exchange_id, product_id, type, exchange_reason, price, order_order_id, 
            refund_return_id)
    VALUES ( DEFAULT, 4, 'furniture','broken' , 85, 4, 
            4);
INSERT INTO mydb.exchange(
            exchange_id, product_id, type, exchange_reason, price, order_order_id, 
            refund_return_id)
    VALUES ( DEFAULT, 5, 'sofa','damaged' , 24, 5, 
            5);

-- -----------------------------------------------------
-- Table mydb.return
-- -----------------------------------------------------
INSERT INTO mydb."return"(
            return_id, status, price, return_reason, order_order_id, refund_id)
    VALUES (DEFAULT, TRUE, 450, 'not satisfied', 1, 1);
INSERT INTO mydb."return"(
            return_id, status, price, return_reason, order_order_id, refund_id)
    VALUES (DEFAULT, TRUE, 350, 'damaged', 2, 2);
INSERT INTO mydb."return"(
            return_id, status, price, return_reason, order_order_id, refund_id)
    VALUES (DEFAULT, TRUE, 550, 'not satisfied', 3, 3);
INSERT INTO mydb."return"(
            return_id, status, price, return_reason, order_order_id, refund_id)
    VALUES (DEFAULT, TRUE, 85, 'not satisfied', 4, 4);
INSERT INTO mydb."return"(
            return_id, status, price, return_reason, order_order_id, refund_id)
    VALUES (DEFAULT, TRUE, 24, 'damaged', 5, 5);
	
-- -----------------------------------------------------
-- Table mydb.shoppingcart
-- -----------------------------------------------------
INSERT INTO mydb.shoppingcart(
            cart_id, price, number_of_items, product_id, user_id, order_id, 
            track_id)
    VALUES (DEFAULT, 450, 1, 1, 1, 1, 
            1);
INSERT INTO mydb.shoppingcart(
            cart_id, price, number_of_items, product_id, user_id, order_id, 
            track_id)
    VALUES (DEFAULT, 350, 1, 2, 2, 2, 
            2);
INSERT INTO mydb.shoppingcart(
            cart_id, price, number_of_items, product_id, user_id, order_id, 
            track_id)
    VALUES (DEFAULT, 550, 1, 3, 3, 3, 
            3);
INSERT INTO mydb.shoppingcart(
            cart_id, price, number_of_items, product_id, user_id, order_id, 
            track_id)
    VALUES (DEFAULT, 85, 1, 4, 4, 4, 
            4);
INSERT INTO mydb.shoppingcart(
            cart_id, price, number_of_items, product_id, user_id, order_id, 
            track_id)
    VALUES (DEFAULT, 24, 1, 5, 5, 5, 
            5);
			
-- -----------------------------------------------------
-- Table mydb.product_has_suppliers
-- -----------------------------------------------------
INSERT INTO mydb.product_has_suppliers(
            product_id, supplier_id, supplier_cost)
    VALUES (1, 1, 450);
INSERT INTO mydb.product_has_suppliers(
            product_id, supplier_id, supplier_cost)
    VALUES (2, 2, 350);
INSERT INTO mydb.product_has_suppliers(
            product_id, supplier_id, supplier_cost)
    VALUES (3, 3, 550);
INSERT INTO mydb.product_has_suppliers(
            product_id, supplier_id, supplier_cost)
    VALUES (4, 4, 85);   
INSERT INTO mydb.product_has_suppliers(
            product_id, supplier_id, supplier_cost)
    VALUES (5, 5, 24);
	