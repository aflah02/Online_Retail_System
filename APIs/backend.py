from distutils.log import error
import flask
import mysql.connector
import json
import datetime

usernamelogin="root"
passwlogin="password"
def connectToDB():
    db = mysql.connector.connect(
        host="localhost",
        user=usernamelogin,
        passwd=passwlogin,
        database = 'retaildb')
    return db

app = flask.Flask(__name__)

"""The main purpose of this API is to change the connection to a user if he logs in as one"""
@app.route('/authenticateUser/<string:username>/<string:passw>')
def authenticateUser(username,passw):
    try:
        global usernamelogin
        global passwlogin
        usernamelogin="root"
        passwlogin="password"
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select * from user where EmailID='{username}' and Password='{passw}'")
        data=cursor.fetchall()
        if len(data)>0:
            usernamelogin="customer"
            passwlogin=passw
            cursor.execute(f"DROP USER IF EXISTS customer@localhost")
            cursor.execute(f"FLUSH PRIVILEGES")
            cursor.execute(f"CREATE USER customer@localhost IDENTIFIED BY '{passw}'", )
            #cursor.execute(f"GRANT user_role TO customer@localhost")
            cursor.execute(f"grant select on retaildb.usableCouponView to customer@localhost")
            cursor.execute(f"grant select on retaildb.userProductView to customer@localhost")
            cursor.execute(f"grant select on retaildb.categoryUserView to customer@localhost")
            cursor.execute(f"grant select,update on retaildb.inventory to customer@localhost")
            cursor.execute(f"grant select, update,insert,delete on retaildb.items_purchased to customer@localhost")
            cursor.execute(f"grant select, update,insert,delete on retaildb.order_table to customer@localhost")
            cursor.execute(f"grant select on retaildb.shipper to customer@localhost")
            cursor.execute(f"grant select, insert,update,delete on retaildb.billing_details to customer@localhost")
            cursor.execute(f"grant select on retaildb.belongsto to customer@localhost")
            cursor.execute(f"grant select on retaildb.product to customer@localhost")
            cursor.execute(f"grant select on retaildb.brand to customer@localhost")
            cursor.execute(f"grant select on retaildb.category to customer@localhost")
            cursor.execute(f"grant select,update,insert,delete on retaildb.items_contained to customer@localhost")
            cursor.execute(f"grant select on retaildb.cart_data to customer@localhost")
            cursor.execute(f"grant select,update on retaildb.coupon_data to customer@localhost")
            cursor.execute(f"grant select on retaildb.user to customer@localhost")
            cursor.execute(f"grant select on retaildb.protectedUserView to customer@localhost")
            db.close()
            return "Success"
        db.close()
        return "Error"
    except Exception as e:
        return str(e)

"""The main purpose of this API is to change the connection to a admin if he logs in as one"""
@app.route('/authenticateAdmin/<string:username>/<string:passw>')
def authenticateAdmin(username,passw):
    try:
        global usernamelogin
        global passwlogin
        usernamelogin="root"
        passwlogin="password"
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select * from admin_table where username='{username}' and passKey='{passw}'")
        data=cursor.fetchall()
        if len(data)>0:
            usernamelogin="administer" #used as a short form for administrator
            passwlogin=passw
            cursor.execute(f"DROP USER IF EXISTS administer@localhost")
            cursor.execute(f"FLUSH PRIVILEGES")
            cursor.execute(f"CREATE USER administer@localhost IDENTIFIED BY '{passw}'", )
            #cursor.execute(f"GRANT admin_role TO administer@localhost")

            cursor.execute(f"grant all on retaildb.user to administer@localhost")
            cursor.execute(f"grant all on retaildb.coupon_data to administer@localhost")
            #not given admin any data related to cart and order
            cursor.execute(f"grant all on retaildb.category to administer@localhost")
            cursor.execute(f"grant all on retaildb.brand to administer@localhost")
            cursor.execute(f"grant all on retaildb.product to administer@localhost")
            cursor.execute(f"grant all on retaildb.belongsto to administer@localhost")
            cursor.execute(f"grant all on retaildb.billing_details to administer@localhost")
            #for the time being an admin does not have to write alter on other admins
            cursor.execute(f"grant select on retaildb.admin_table to administer@localhost")
            cursor.execute(f"grant all on retaildb.shipper to administer@localhost")
            cursor.execute(f"grant select,update,insert,delete,create,drop on retaildb.order_table to administer@localhost")
            cursor.execute(f"grant select,update,insert,delete,create,drop on retaildb.items_purchased to administer@localhost")
            cursor.execute(f"grant all on retaildb.inventory to administer@localhost")
            cursor.execute(f"grant all on retaildb.userProductView to administer@localhost")
            cursor.execute(f"grant all on retaildb.categoryUserView to administer@localhost")
            cursor.execute(f"grant all on retaildb.protectedUserView to administer@localhost")
            cursor.execute(f"grant all on retaildb.usableCouponView to administer@localhost")



            db.close()
            return "Success"
        db.close()
        return "Error"
    except Exception as e:
        return str(e)

"""API Endpoint to get all Order Details for a User"""
@app.route('/getOrderDetailsForUser/<int:user_id>', methods=['GET'])
def getOrderIDsForUser(user_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select *
            From order_table
            Where Unique_id = {user_id}
        """)
        order_ids = cursor.fetchall()
        db.close()
        return flask.jsonify(order_ids)
    except Exception as e:
        return str(e)

"""API Endpoint to get all Item Details for an Order"""
@app.route('/getItemDetailsForOrder/<int:order_id>', methods=['GET'])
def getItemDetailsForOrder(order_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select *
            From items_purchased
            Where Order_id = {order_id}
        """)
        order_ids = cursor.fetchall()
        db.close()
        return flask.jsonify(order_ids)
    except Exception as e:
        return str(e)
"""API Endpoint to get list of all Products"""
@app.route('/getProductNameList', methods=['GET'])
def getProductNameList():
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select product_name
            From product
           
        """)
        order_ids = cursor.fetchall()
        db.close()
        return flask.jsonify(order_ids)
    except Exception as e:
        return str(e)

"""API Endpoint which gives cartTotal after coupon"""
@app.route('/getCartTotalPostCoupon/<int:user_id>/<string:coupon_id>', methods=['GET'])
def getCartTotalPostCoupon(user_id, coupon_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select *
            From coupon_data
            where Coupon_id = {coupon_id}
        """)
        coupon_details = cursor.fetchall()
        if (len(coupon_details) == 0):
            return "Coupon Not Found"
        if (coupon_details[0][-1] == 1):
            return "Coupon is Used"
        dateExpiry = coupon_details[0][2]
        print(dateExpiry)
        dateToday = datetime.date.today()
        if (dateExpiry < dateToday):
            return "Expired Coupon"
        cursor.execute(f"""
            select * from (select Temp.Unique_id, Temp.Username, SUM(Temp.Total) as "Total cost"
            from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
            from User U, items_contained I,product P
            where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
            group by Temp.Unique_id) as BigTemp where BigTemp.Unique_id = {user_id}
            """)
        result = cursor.fetchall()
        totalCost = float(result[0][-1])
        discount = float(int(coupon_details[0][1])/100)
        discountedCost = totalCost - totalCost * discount
        return flask.jsonify(discountedCost)
    except Exception as e:
        return str(e)

"""API Endpoint that Returns Items Ranked by Amount they've been sold for"""
@app.route('/RankedByProfitMade', methods=['GET'])
def RankedByProfitMade():
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select Product_ID, HighestSeller from (
            SELECT  Product_ID, Quantity, SUM(Cost) Cost, rank () over (order by Cost desc) as HighestSeller
            FROM    items_purchased 
            GROUP BY Product_ID) as H
            """)
        result = cursor.fetchall()
        db.close()
        setProducts = set([])
        for i in result:
            setProducts.add(i[0])
        setAllProducts = set([i for i in range(1, 151)])
        setRemainingProducts = setAllProducts - setProducts
        currInd = result[-1][-1]
        for i in setRemainingProducts:
            result.append((i,currInd))
            currInd+=1
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API Endpoint that Returns Items Ranked by Quantity they've sold"""
@app.route('/RankedByQuantitySold', methods=['GET'])
def RankedByQuantitySold():
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select Product_ID, HighestSeller from (
            SELECT  Product_ID, SUM(Quantity) Quantity, rank () over (order by Quantity desc) as HighestSeller
            FROM    items_purchased 
            GROUP BY Product_ID) as H
            """)
        result = cursor.fetchall()
        db.close()
        setProducts = set([])
        for i in result:
            setProducts.add(i[0])
        setAllProducts = set([i for i in range(1, 151)])
        setRemainingProducts = setAllProducts - setProducts
        currInd = result[-1][-1]
        for i in setRemainingProducts:
            result.append((i,currInd))
            currInd+=1
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""Get Shipper ID from Shipper Name"""
@app.route('/getShipperID/<string:shipper_name>', methods=['GET'])
def getShipperID(shipper_name):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""
            Select * from shipper where shipper_name = '{shipper_name}'
        """)
        shipper_id = cursor.fetchall()
        db.close()
        return flask.jsonify(shipper_id)
    except Exception as e:
        return str(e)

"""Get User Details from EmailID API Endpoint"""
@app.route('/getUserDetailsFromEmail/<string:emailID>', methods=['GET'])
def getUserDetails(emailID):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""Select *
            From user
            where EmailID = {emailID}""")
        result = cursor.fetchall()
        db.close()
        if result:
            return flask.jsonify(result)
        else:
            return "No User Found"
    except Exception as e:
        return str(e)

"""API endpoint to get Product Information from Product ID"""
@app.route('/getProductDetailsFromProductID/<int:product_id>', methods=['GET'])
def getProductDetails(product_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""Select *
            From product
            where Product_ID = {product_id}""")
        result = cursor.fetchall()
        db.close()
        if result:
            return flask.jsonify(result)
        else:
            return "No Product Found"
    except Exception as e:
        return str(e)

"""API endpoint to get all Matching Products from Product Name"""
@app.route('/getAllProductsMatchingName/<string:name>', methods=['GET'])
def getAllProductsMatchingName(name):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""Select *
            From product
            Where product_name = {name}""")
        result = cursor.fetchall()
        db.close()
        if result:
            return flask.jsonify(result)
        else:
            return "No Product Found"
    except Exception as e:
        return str(e)

"""API endpoint to get URL for product Images"""
@app.route('/getProductImage/<string:brand_name>/<string:product_name>', methods=['GET'])
def getProductImage(brand_name, product_name):
    try:
        f = open('productLinks.json')
        data = json.load(f)
        key = brand_name + ' ' + product_name
        print(key)
        if key in data:
            return flask.jsonify(data[key])
        else:
            return flask.jsonify(brand_name + ' ' + product_name)
    except Exception as e:
        return str(e)

"""API endpoint to get URL for category Images"""
@app.route('/getProductImage/<string:categoryName>', methods=['GET'])
def getCategoryImage(categoryName):
    try:
        f = open('categoryLinks.json')
        data = json.load(f)
        if categoryName in data:
            return flask.jsonify(data[categoryName])
        else:
            return flask.jsonify('No image found')
    except Exception as e:
        print(e)
        return str(e)

"""API endpoint to authenticate if user credentials are correct"""
@app.route('/authenticate/<string:email>/<string:password>')
def authenticate(email,password):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"select * from user where EmailID='{email}' and Password='{password}'")
        data=cursor.fetchall()
        db.close()
        if len(data)>0:
            return "Success"
        else:
            return "Error"
    except Exception as e:
        return str(e)

"""API endpoint to get allShipperData"""
@app.route('/getAllShipperData')
def getAllShipperData():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("select * from shipper")
        data=cursor.fetchall()
        db.close()
        return flask.jsonify(data)
    except Exception as e:
        return str(e)

"""API endpoint to get couponData"""
@app.route('/getCouponData')
def getCouponData():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("select * from coupon_data")
        data=cursor.fetchall()
        db.close()
        return flask.jsonify(data)
    except Exception as e:
        return str(e)

"""API endpoint to list usable coupons"""
@app.route('/listCoupons')
def listCoupons():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"""
        select *
        from usableCouponView
        """)
        data=cursor.fetchall()
        db.close()
        return flask.jsonify(data)
    except Exception as e:
        return str(e)

"""API endpoint to Delete all Expired Coupons"""
@app.route('/deleteExpiredCoupons')
def deleteExpiredCoupons():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("delete from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE;")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


"""API endpoint to List all Expired Coupons"""
@app.route('/listExpiredCoupons')
def listExpiredCoupons():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("Select * from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE;")
        result=cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to List all Expired Coupons for a particular user"""
@app.route('/listExpiredCouponsForUser/<int:userID>')
def listExpiredCouponsForUser(userID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"Select * from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE and Unique_id = {userID};")
        result=cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to List all Available Coupons"""
@app.route('/listAvailableCoupons')
def listAvailableCoupons():
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("Select * from coupon_data where coupon_data.ExpiryDate >= CURRENT_DATE and coupon_data.isUsed = {0};")
        result=cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to List all Available Coupons for a particular user"""
@app.route('/listAvailableCouponsForUser/<int:userID>')
def listAvailableCouponsForUser(userID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"Select * from coupon_data where coupon_data.ExpiryDate >= CURRENT_DATE and Unique_id = {userID} and coupon_data.isUsed = {0};")
        result=cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to check If Coupon Is Used"""
@app.route('/checkIfCouponIsUsed/<string:couponID>')
def checkIfCouponIsUsed(couponID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"Select * from coupon_data where Coupon_id = {couponID};")
        result=cursor.fetchall()
        db.close()
        if len(result) == 0:
            return "Coupon Not Found"
        if result[0][-1] == 1:
            return flask.jsonify(True)
        return flask.jsonify(False)
    except Exception as e:
        return str(e)

"""API endpoint to check If Coupon Is Used"""
@app.route('/checkIfCouponIsExpired/<string:couponID>')
def checkIfCouponIsExpired(couponID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"Select * from coupon_data where Coupon_id = {couponID};")
        coupon_details=cursor.fetchall()
        db.close()
        if (len(coupon_details) == 0):
            return "Coupon Not Found"
        dateExpiry = coupon_details[0][2]
        dateToday = datetime.date.today()
        if (dateExpiry < dateToday):
            return "Expired Coupon"
        return "Not Expired"
    except Exception as e:
        return str(e)

"""API endpoint to delete user given userID if no pending orders"""
@app.route('/deleteUser/<int:userID>')
def deleteUser(userID):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"""
            delete from billing_details where billing_details.billing_id 
            IN (Select billing_id From order_table where order_table.Unique_id = {userID}) 
            AND EXISTS (Select * From order_table,shipper 
            Where DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) > 0
            AND order_table.Shipper_id = shipper.shipper_id And order_table.billing_id=billing_details.billing_id);
            delete from user where user.id = 3 AND NOT EXISTS (Select * From order_table,shipper 
            Where DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) > 0 
            AND order_table.Shipper_id = shipper.shipper_id);
            SELECT 
                *
            FROM
                order_table
            WHERE
                Unique_id = {userID}
        """)
        db.commit()
        c.execute(f"select * from user where id='{userID}'")
        data=c.fetchall()
        db.close()
        if len(data) == 0:
            return "Success"
        else:
            return "Error"
    except Exception as e:
        return str(e)

"""API endpoint to add products when the product is already in cart it increases it's quantity by a given quantity"""
@app.route('/addProductsWhenAlreadyExistsInCart/<int:productID>/<int:quantity>/<int:cartID>')
def addProductsToCart(productID, quantity, cartID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"""
        update items_contained 
        set quantity = quantity+{quantity} where Product_ID={productID} and Unique_id={cartID}
        """)
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# """API endpoint to add products when the product is already in cart it increases it's quantity by a given quantity"""
# @app.route('/markCouponAsUsed/<string:couponID>')
# def markCouponAsUsed(couponID):
#     try:
#         db = connectToDB()
#         cursor=db.cursor()
#         cursor.execute(f"""
#         update items_contained 
#         set quantity = quantity+{quantity} where Product_ID={productID} and Unique_id={cartID}
#         """)
#         db.commit()
#         db.close()
#         return "Success"
#     except Exception as e:
#         return str(e)

"""API endpoint to decrease quantity of products when the product is already in cart """
@app.route('/decQuanProductsWhenAlreadyExistsInCart/<int:productID>/<int:cartID>')
def decQuanProductsWhenAlreadyExistsInCart(productID, cartID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"""
        update items_contained 
        set quantity = quantity-1 where Product_ID={productID} and Unique_id={cartID}
        """)
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)




"""API endpoint called listAllOrders to list all Orders by a User"""
@app.route('/listAllOrders/<int:uniqueID>')
def listAllOrders(uniqueID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"select * from items_purchased where Order_id in (select Order_id from order_table where Unique_id = {uniqueID});")
        result=cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to add new coupon"""
@app.route('/addNewCoupon/<string:couponID>/<int:discount>/<int:YearofExpiry>/<int:monthOfExpiry>/<int:dateofExpiry>/<int:userID>', methods=['GET','POST'])
def addNewCoupon(couponID, discount, YearofExpiry, monthOfExpiry, dateofExpiry, userID):
    try:
        db = connectToDB()
        cursor=db.cursor()
        date = datetime.date(YearofExpiry, monthOfExpiry, dateofExpiry).strftime('%Y/%m/%d')
        cursor.execute(f"insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values('{couponID}',{discount},'{date}',{userID});")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint to add new shipper"""
@app.route('/addNewShipper/<string:shipperName>/<string:shipperDeliverySpeed>', methods=['GET','POST'])
def addNewShipper(shipperName, shipperDeliverySpeed):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"insert into shipper (shipper_name, Delivery_speed) values('{shipperName}',{shipperDeliverySpeed});")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called addUser to add new User which takes 5 Strings as Input"""
@app.route('/addUser/<string:Name>/<string:Address>/<string:EmailID>/<string:Password>/<string:PhoneNumber>', methods=['POST'])
def addUser(Name,Address,EmailID,Password,PhoneNumber):
    try:
        usernamelogin="root"
        passwlogin="1234"
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("insert into user (Address, Name, EmailID, Password, PhoneNumber) values(%s,%s,%s,%s,%s)" ,(Address,Name,EmailID,Password,PhoneNumber))
        cursor.execute(f"select max(id) from user")
        data=cursor.fetchall()
        u=data[0][0]
        cursor.execute(f"insert into cart_data (Unique_id) values ({u})")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called cartDetails which takes int input and returns the cart details of the user"""
@app.route('/cartDetails/<int:user_id>', methods=['GET'])
def cartDetails(user_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select P.product_name as \"Name\",P.brand_name As brand ,P.product_cost as \"Product Cost\",I.Quantity,P.product_cost*I.Quantity As Cost from product P,items_contained I where P.product_id=I.Product_ID and I.Unique_id = {user_id} and P.product_id IN (select product_id from inventory where quantity>0);")
        result = cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint called cartTotal which takes int input and returns the cart total of all the users"""
@app.route('/cartTotal/', methods=['GET'])
def cartTotal():
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""select Temp.Username, SUM(Temp.Total) as "Total cost"
            from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
            from User U, items_contained I,product P
            where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
            group by Temp.Username""")
        result = cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint called cancelOrder which takes int input and deletes Order for that orderID"""
@app.route('/cancelOrder/<int:order_id>', methods=['GET'])
def cancelOrder(order_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"update inventory set quantity = quantity + (select quantity from items_purchased where order_id = {order_id} and inventory.product_id = items_purchased.product_id) where product_id in (select product_id from items_purchased where order_id = {order_id}); delete from items_purchased where order_id = {order_id}; delete from order_table where order_id = {order_id};")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called to check for inventories before BuyNow which places order for a given user"""
@app.route('/checkBuyNow/<int:user_id>', methods=['GET'])
def checkBuyNow(user_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select product_id, product_name,brand_name from product where product_id IN (select items_contained.Product_ID as id from items_contained,inventory where items_contained.Unique_id={user_id} and items_contained.Product_ID=inventory.product_id and items_contained.Quantity>inventory.quantity)")
        data=cursor.fetchall()
        if len(data)>0:
            db.close()
            return flask.jsonify(data)
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint to add item in billing details with input payment mode and billing address before BuyNow which places order for a given user"""
@app.route('/addBeforeOrderBillingDetails/<string:paymentMode>/<string:Address>', methods=['GET'])
def addBeforeOrderBillingDetails(paymentMode,Address):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"insert into billing_details (payment_mode, billing_address) values ('{paymentMode}', '{Address}')")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint to add item in order_table  before BuyNow which places order for a given user"""
@app.route('/addBeforeOrderTableDetails/<string:address>/<int:userid>/<int:shipperid>', methods=['GET'])
def addBeforeOrderTableDetails(address,userid,shipperid):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select max(billing_id) from billing_details;")
        data=cursor.fetchall()
        billling=data[0][0]
        #add shipper here as well
        cursor.execute(f"insert into order_table (Delivery_Address,Shipper_id, Date_Time, Unique_id, billing_id ) values ('{address}',{shipperid},CURDATE(), {userid}, {billling})")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint to add items in items_purchased before BuyNow which places order for a given user and updating inventory"""
@app.route('/addItemsPurchased/<int:userid>', methods=['GET'])
def addItemsPurchased(userid):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"select max(Order_id) from order_table;")
        data=cursor.fetchall()
        order=data[0][0]
        cursor.execute(f"INSERT INTO items_purchased (Order_id, Product_ID, Quantity) SELECT {order}, Product_ID, Quantity FROM items_contained where Unique_id={userid}")
        cursor.execute(f"UPDATE inventory, items_contained SET inventory.quantity = inventory.quantity - items_contained.Quantity WHERE items_contained.Unique_id={userid} and items_contained.Product_ID=inventory.product_id")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


"""API endpoint called emptyCart which empties cart for a particular userID"""
@app.route('/emptyCart/<int:user_id>', methods=['GET'])
def emptyCart(user_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"delete from items_contained where items_contained.Unique_id = {user_id};")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called removeGivenProductfromGivenCart which removes particular product from cart for a particular user"""
@app.route('/removeGivenProductfromGivenCart/<int:user_id>/<int:product_id>', methods=['GET'])
def removeGivenProductfromGivenCart(user_id,product_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"delete from items_contained where items_contained.Unique_id = {user_id} and items_contained.product_id = {product_id};")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called addProductToCart which adds a product to cart for a particular user in given quantity"""
@app.route('/addProductToCart/<int:user_id>/<int:product_id>/<int:quantity>', methods=['GET'])
def addProductToCart(user_id,product_id,quantity):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"insert into items_contained values({user_id},{product_id},{quantity});")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""API endpoint called OrderCost which calculates cost of an Order"""
@app.route('/OrderCost/<int:order_id>', methods=['GET'])
def OrderCost(order_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""select order_id as "Order Number", sum(items_purchased.quantity * (select product_cost from product where product.product_id = items_purchased.product_id )) from items_purchased where items_purchased.order_id = {order_id};""")
        result = cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# Update the inventory (quantity) of a product by its name & brand
@app.route('/updateInventory/<string:product_name>/<string:brand_name>/<int:quantity>', methods=['GET'])
def updateInventory(product_name, brand_name, quantity):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""UPDATE Inventory I 
        SET I.quantity = I.quantity + {quantity}
        WHERE I.product_id = (SELECT product_id from product where product_name = '{product_name}' and brand_name = '{brand_name}');""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# List customer orders by shipper name
@app.route('/listOrders/<string:shipper_name>', methods=['GET'])
def listOrders(shipper_name):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""SELECT O.order_id, U.name AS "Customer Name", O.delivery_address, S.shipper_name, S.delivery_speed
                           FROM order_table O NATURAL JOIN shipper S INNER JOIN User U ON U.id=O.Unique_id
                           WHERE S.shipper_name='{shipper_name}';""")
        result = cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# list all orders where there exists atleast one product belonging to a particular category (say Electronics)
@app.route('/listOrdersByCategory/<string:category>', methods=['GET'])
def listOrdersByCategory(category):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""SELECT * from order_table where order_id in (
                           SELECT DISTINCT I.order_id from items_purchased I where I.product_id in (
                           SELECT product_id from belongsTo where category_id = (
                           SELECT category_id from category where category_name = '{category}'
        )
    )
);""")
        result = cursor.fetchall() 
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# List all shippers with speed >= x
@app.route('/listShippersbySpeed/<int:speed>', methods=['GET'])
def listShippersbySpeed(speed):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""SELECT S.shipper_name, S.Delivery_speed
                           FROM shipper S
                           WHERE S.Delivery_speed <= {speed};""")
        result = cursor.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# insert into billing_details
@app.route('/addBillingDetails/<int:billing_id>/<string:payment_mode>/<string:billing_address>', methods=['GET'])   
def addBillingDetails(billing_id, payment_mode, billing_address):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""INSERT INTO billing_details (billing_id, payment_mode, billing_address)
                            VALUES ({billing_id}, '{payment_mode}', '{billing_address}');""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# delete from billing_details
@app.route('/deleteBillingDetails/<int:billing_id>', methods=['GET'])
def deleteBillingDetails(billing_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""DELETE FROM billing_details WHERE billing_id = {billing_id};""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# update billing_address in billing_details table
@app.route('/updateBillingAddress/<int:billing_id>/<string:billing_address>', methods=['GET'])
def updateBillingAddress(billing_id, billing_address):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""UPDATE billing_details SET billing_address = '{billing_address}' WHERE billing_id = {billing_id};""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# insert into inventory
@app.route('/addInventory/<int:product_id>/<int:quantity>', methods=['GET'])
def addInventory(product_id, quantity):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""INSERT INTO inventory (product_id, quantity)
                            VALUES ({product_id}, {quantity});""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

# delete from inventory
@app.route('/deleteInventory/<int:product_id>', methods=['GET'])
def deleteInventory(product_id):
    try:
        db = connectToDB()
        cursor = db.cursor()
        cursor.execute(f"""DELETE FROM inventory WHERE product_id = {product_id};""")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


# API for adding products 
@app.route('/addProducts/<string:name>/<string:brandname>/<int:cost>')
def addProducts(name,brandname,cost):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute("insert into product (product_name,product_cost ,brand_name) values(%s,%s,%s)" ,(name,cost, brandname))
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

"""Add product Image to json"""
@app.route('/addProductImage/<string:productname>/<string:brandname>/<path:imageUrl>')
def addProductImage(productname, brandname, imageUrl):
    try:
        a_dict = {f'{brandname} {productname}': f'{imageUrl}'}
        with open(r'productLinks.json') as f:
            data = json.load(f)
        data.update(a_dict)
        with open(r'productLinks.json', 'w') as f:
            json.dump(data, f)
        with open(r'productLinks.json', 'r+') as f:
            data = json.load(f)
            f.seek(0)
            json.dump(data, f, indent=4)
            f.truncate()
        return "Success"
    except Exception as e:
        return str(e)

"""Add Category Image to json"""
@app.route('/addCategoryImage/<string:categoryName>/<path:imageUrl>')
def addCategoryImage(categoryName, imageUrl):
    try:
        a_dict = {f'{categoryName}': f'{imageUrl}'}
        with open(r'categoryLinks.json') as f:
            data = json.load(f)
        data.update(a_dict)
        with open(r'categoryLinks.json', 'w') as f:
            json.dump(data, f)
        with open(r'categoryLinks.json', 'r+') as f:
            data = json.load(f)
            f.seek(0)
            json.dump(data, f, indent=4)
            f.truncate()
        return "Success"
    except Exception as e:
        return str(e)

"""Add brand Image to json"""
@app.route('/addBrandImage/<string:brandName>/<path:imageUrl>')
def addBrandImage(brandName, imageUrl):
    try:
        a_dict = {f'{brandName}': f'{imageUrl}'}
        with open(r'brandlinks.json') as f:
            data = json.load(f)
        data.update(a_dict)
        with open(r'brandlinks.json', 'w') as f:
            json.dump(data, f)
        with open(r'brandlinks.json', 'r+') as f:
            data = json.load(f)
            f.seek(0)
            json.dump(data, f, indent=4)
            f.truncate()
        return "Success"
    except Exception as e:
        return str(e)


#API for deleting products
@app.route('/deleteProduct/<string:name>/<string:brandname>')
def deleteProduct(name,brandname):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"delete from product where product_name='{name}' and product.brand_name='{brandname}'")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)
 
 #API for adding brand
@app.route('/addBrand/<string:name>')
def addBrand(name):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"insert into brand (brand_name) values('{name}')")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


#API for deleting brand
@app.route('/deleteBrand/<string:brandname>')
def deleteBrand(brandname):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"delete from brand where brand_name='{brandname}'")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

#list all products 
@app.route('/listAllProducts')
def listAllProducts():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute("Select product_name, product_cost,brand_name from userProductView")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

#list all brands
@app.route('/listAllBrands')
def listAllBrands():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute("Select * from brand")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to get URL for brand Images"""
@app.route('/getBrandImage/<string:brandName>', methods=['GET'])
def getBrandImage(brandName):
    try:
        f = open('brandlinks.json')
        data = json.load(f)
        if brandName in data:
            return flask.jsonify(data[brandName])
        else:
            return flask.jsonify('No image found')
    except Exception as e:
        
        return e

#API for searching using product name
@app.route('/searchUsingProductName/<string:name>')
def searchUsingProductName(name):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"Select product_name, product_cost,brand_name from product where product_name='{name}' and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)


#API for searching using brand name
@app.route('/searchUsingBrandName/<string:name>')
def searchUsingBrandName(name):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"Select product_name, product_cost,brand_name from product where brand_name='{name}' and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

#list out category information
@app.route('/displayCategories')
def displayCategories():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select category_name,category_info from categoryUserView ")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

#list out category name only
@app.route('/displayCategoriesName')
def displayCategoriesName():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select category_name from categoryUserView ")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# search products using category name
@app.route('/searchUsingCategoryName/<string:name>')
def searchUsingCategoryName(name):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select product_name,product_cost,brand_name from product natural join belongsto where category_id IN (select category_id from category where category_name='{name}') and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)
#API for getting category id from category name

@app.route('/getCategoryID/<string:category>')
def getCategoryID(category):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select category_id from category where category_name='{category}'")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

#add category information
@app.route('/addCategory/<string:name>/<string:info>')
def addCategory(name,info):
    try:
        db = connectToDB()
        cursor=db.cursor()
        cursor.execute(f"insert into category(category_name, category_info) values('{name}','{info}')")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

#API for deleting category
@app.route('/deleteCategory/<string:categoryname>')
def deleteCategory(categoryname):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"delete from category where category_name='{categoryname}'")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


#API for updating category information
@app.route('/updateCategory/<string:categoryname>/<string:description>')
def updateCategory(categoryname,description):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"update category set category_info = '{description}' where category_name='{categoryname}'")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


#API for updating product cost
@app.route('/updateCost/<int:productID>/<int:cost>')
def updateCost(productID,cost):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"update product set product_cost = {cost} where product_id={productID}")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)


#API for adding in belongs to table
@app.route('/addBelongsTo/<int:productID>/<int:categoryID>')
def addBelongsTo(productID,categoryID):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"insert into belongsto(product_id, category_id) values ({productID},{categoryID})")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

#API for deleting in belongs to table
@app.route('/deleteBelongsTo/<int:productID>/<int:categoryID>')
def deleteBelongsTo(productID,categoryID):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"delete from belongsto where product_id = {productID} and category_id = {categoryID}")
        db.commit()
        db.close()
        return "Success"
    except Exception as e:
        return str(e)

#API for displaying belongsTo
@app.route('/BelongsTo')
def BelongsTo():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select * from belongsto")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)
        
# API that gives product id given product name and brand name
@app.route('/getProductID/<string:productName>/<string:brandName>')
def getProductID(productName,brandName):
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"select product_id from product where product_name='{productName}' and brand_name='{brandName}'")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

"""API endpoint to view inventory"""
@app.route('/viewInventory')
def viewInventory():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"Select * from inventory")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)

# API to show average purchased cost of each product category next to purchased products
@app.route('/averageCategoryCost')
def averagePurchaseCost():
    try:
        db = connectToDB()
        c=db.cursor()
        c.execute(f"""SELECT T.Product_ID,T.category_id,T.Cost,AVG(T.Cost) OVER( PARTITION BY T.category_id) AS Avg_Category_Cost
FROM (SELECT P.Product_ID AS Product_ID,B.category_id AS category_id, SUM(P.Cost) AS Cost FROM items_purchased P NATURAL JOIN belongsTo B GROUP BY P.Product_ID) AS T;
""")
        result = c.fetchall()
        db.close()
        return flask.jsonify(result)
    except Exception as e:
        return str(e)
    

if __name__ == '__main__':
    app.run(debug=True)