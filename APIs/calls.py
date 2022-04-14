import flask
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234",
    database = 'retaildb')

app = flask.Flask(__name__)

"""API endpoint to authenticate if user credentials are correct"""
@app.route('/authenticate/<string:username>/<string:password>')
def authenticate(username,password):
    try:
        cursor=db.cursor()
        cursor.execute(f"select * from user where Name='{username}' and Password='{password}'")
        data=cursor.fetchall()
        if len(data)>0:
            return "Success"
        else:
            return "Error"
    except:
        return "Error"

"""API endpoint to get allShipperData"""
@app.route('/getAllShipperData')
def getAllShipperData():
    try:
        cursor=db.cursor()
        cursor.execute("select * from shipper")
        data=cursor.fetchall()
        return flask.jsonify(data)
    except:
        return "Error"

"""API endpoint to get couponData"""
@app.route('/getCouponData')
def getCouponData():
    try:
        cursor=db.cursor()
        cursor.execute("select * from coupon_data")
        data=cursor.fetchall()
        return flask.jsonify(data)
    except:
        return "Error"

"""API endpoint to list usable coupons for a particular User"""
@app.route('/listCoupons/<int:userID>')
def listCoupons(userID):
    try:
        cursor=db.cursor()
        cursor.execute(f"""
        CREATE VIEW usableCoupon AS
        select *
        from coupon_data
        where coupon_data.ExpiryDate > CURRENT_DATE AND coupon_data.Unique_id = 5 AND coupon_data.isUsed = 0;
        select *
        from usableCoupon
        """)
        data=cursor.fetchall()
        return flask.jsonify(data)
    except:
        return "Error"

"""API endpoint to Delete all Expired Coupons"""
@app.route('/deleteExpiredCoupons')
def deleteExpiredCoupons():
    try:
        cursor=db.cursor()
        cursor.execute("delete from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE;")
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint to delete user given userID if no pending orders"""
@app.route('/deleteUser/<int:userID>')
def deleteUser(userID):
    try:
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
        if len(data)>0:
            return "Success"
        else:
            return "Error"
    except:
        return "Error"

"""API endpoint to add products when the product is already in cart it increases it's quantity by a given quantity"""
@app.route('/addProductsWhenAlreadyExistsInCart/<int:productID>/<int:quantity>/<int:cartID>')
def addProductsToCart(productID, quantity, cartID):
    try:
        cursor=db.cursor()
        cursor.execute(f"""
        update items_contained 
        set quantity = case 
            when {productID} in (select product_id from items_contained where unique_id = {cartID}) 
            then quantity + {quantity} 
            else quantity end;
        """)
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint called listAllOrders to list all Orders by a User"""
@app.route('/listAllOrders/<int:uniqueID>')
def listAllOrders(uniqueID):
    try:
        cursor=db.cursor()
        cursor.execute(f"select * from items_purchased where Order_id in (select Order_id from order_table where Unique_id = {uniqueID});")
        result=cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

"""API endpoint called addUser to add new User which takes 5 Strings as Input"""
@app.route('/addUser/<string:Name>/<string:Address>/<string:EmailID>/<string:Password>/<string:PhoneNumber>', methods=['POST'])
def addUser(Name,Address,EmailID,Password,PhoneNumber):
    try:
        cursor=db.cursor()
        cursor.execute("insert into user (Address, Name, EmailID, Password, PhoneNumber) values(%s,%s,%s,%s,%s)" ,(Address,Name,EmailID,Password,PhoneNumber))
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint called cartDetails which takes int input and returns the cart details of the user"""
@app.route('/cartDetails/<int:user_id>', methods=['GET'])
def cartDetails(user_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"select P.product_name as \"Name\",P.brand_name As brand ,P.product_cost as \"Product Cost\",I.Quantity,P.product_cost*I.Quantity As Cost from product P,items_contained I where P.product_id=I.Product_ID and I.Unique_id = 1 and P.product_id IN (select product_id from inventory where quantity>0);")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

"""API endpoint called cartTotal which takes int input and returns the cart total of all the users"""
@app.route('/cartTotal/', methods=['GET'])
def cartTotal():
    try:
        cursor = db.cursor()
        cursor.execute(f"""select Temp.Username, SUM(Temp.Total) as "Total cost"
            from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
            from User U, items_contained I,product P
            where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
            group by Temp.Username""")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

"""API endpoint called cancelOrder which takes int input and deletes Order for that orderID"""
@app.route('/cancelOrder/<int:order_id>', methods=['GET'])
def cancelOrder(order_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"update inventory set quantity = quantity + (select quantity from items_purchased where order_id = {order_id} and inventory.product_id = items_purchased.product_id) where product_id in (select product_id from items_purchased where order_id = {order_id}); delete from items_purchased where order_id = {order_id}; delete from order_table where order_id = {order_id};")
        db.commit()
        return "Success"
    except:
        return "Error"

# """API endpoint called BuyNow which places order for a given user"""
# @app.route('/BuyNow/<int:user_id>', methods=['GET'])
# def BuyNow(user_id):
#     try:
#         cursor = db.cursor()
#         cursor.execute(f"update inventory set quantity = quantity - (select quantity from items_contained where inventory.product_id = items_contained.product_id and items_contained.Unique_id = {user_id}) where product_id in (select product_id from items_contained where Unique_id = {user_id});")
#         db.commit()
#         return "Success"
#     except:
#         return "Error"

"""API endpoint called emptyCart which empties cart for a particular userID"""
@app.route('/emptyCart/<int:user_id>', methods=['GET'])
def emptyCart(user_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"delete from items_contained where items_contained.Unique_id = {user_id};")
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint called removeGivenProductfromGivenCart which removes particular product from cart for a particular user"""
@app.route('/removeGivenProductfromGivenCart/<int:user_id>/<int:product_id>', methods=['GET'])
def removeGivenProductfromGivenCart(user_id,product_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"delete from items_contained where items_contained.Unique_id = {user_id} and items_contained.product_id = {product_id};")
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint called addProductToCart which adds a product to cart for a particular user in given quantity"""
@app.route('/addProductToCart/<int:user_id>/<int:product_id>/<int:quantity>', methods=['GET'])
def addProductToCart(user_id,product_id,quantity):
    try:
        cursor = db.cursor()
        cursor.execute(f"insert into items_contained values({user_id},{product_id},{quantity});")
        db.commit()
        return "Success"
    except:
        return "Error"

"""API endpoint called OrderCost which calculates cost of an Order"""
@app.route('/OrderCost/<int:order_id>', methods=['GET'])
def OrderCost(order_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"""select order_id as "Order Number", sum(items_purchased.quantity * (select product_cost from product where product.product_id = items_purchased.product_id )) from items_purchased where items_purchased.order_id = {order_id};""")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

# Update the inventory (quantity) of a product by its name & brand
@app.route('/updateInventory/<string:product_name>/<string:brand_name>/<int:quantity>', methods=['GET'])
def updateInventory(product_name, brand_name, quantity):
    try:
        cursor = db.cursor()
        cursor.execute(f"""UPDATE Inventory I 
        SET I.quantity = I.quantity + {quantity}
        WHERE I.product_id = (SELECT product_id from product where product_name = '{product_name}' and brand_name = '{brand_name}');""")
        db.commit()
        return "Success"
    except:
        return "Error"

# List customer orders by shipper name
@app.route('/listOrders/<string:shipper_name>', methods=['GET'])
def listOrders(shipper_name):
    try:
        cursor = db.cursor()
        cursor.execute(f"""SELECT O.order_id, U.name AS "Customer Name", O.delivery_address, S.shipper_name, S.delivery_speed
                           FROM order_table O, shipper S, user U
                           WHERE O.shipper_id = S.shipper_id AND U.id = O.unique_id AND S.shipper_name='{shipper_name}';""")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

# list all orders where there exists atleast one product belonging to a particular category (say Electronics)
@app.route('/listOrdersByCategory/<string:category>', methods=['GET'])
def listOrdersByCategory(category):
    try:
        cursor = db.cursor()
        cursor.execute(f"""SELECT * from order_table where order_id in (
                           SELECT DISTINCT I.order_id from items_purchased I where I.product_id in (
                           SELECT product_id from belongsTo where category_id = (
                           SELECT category_id from category where category_name = '{category}'
        )
    )
);""")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

# List all shippers with speed >= x
@app.route('/listShippersbySpeed/<int:speed>', methods=['GET'])
def listShippersbySpeed(speed):
    try:
        cursor = db.cursor()
        cursor.execute(f"""SELECT S.shipper_name, S.delivery_speed
                           FROM shipper S
                           WHERE S.delivery_speed >= {speed};""")
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

# insert into billing_details
@app.route('/addBillingDetails/<int:billing_id>/<string:payment_mode>/<string:billing_address>', methods=['GET'])   
def addBillingDetails(billing_id, payment_mode, billing_address):
    try:
        cursor = db.cursor()
        cursor.execute(f"""INSERT INTO billing_details (billing_id, payment_mode, billing_address)
                            VALUES ({billing_id}, '{payment_mode}', '{billing_address}');""")
        db.commit()
        return "Success"
    except:
        return "Error"

# delete from billing_details
@app.route('/deleteBillingDetails/<int:billing_id>', methods=['GET'])
def deleteBillingDetails(billing_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"""DELETE FROM billing_details WHERE billing_id = {billing_id};""")
        db.commit()
        return "Success"
    except:
        return "Error"

# insert into inventory
@app.route('/addInventory/<int:product_id>/<int:quantity>', methods=['GET'])
def addInventory(product_id, quantity):
    try:
        cursor = db.cursor()
        cursor.execute(f"""INSERT INTO inventory (product_id, quantity)
                            VALUES ({product_id}, {quantity});""")
        db.commit()
        return "Success"
    except:
        return "Error"

# delete from inventory
@app.route('/deleteInventory/<int:product_id>', methods=['GET'])
def deleteInventory(product_id):
    try:
        cursor = db.cursor()
        cursor.execute(f"""DELETE FROM inventory WHERE product_id = {product_id};""")
        db.commit()
        return "Success"
    except:
        return "Error"

# API for adding products 
@app.route('/addProducts/<string:name>/<string:brandname>/<int:cost>')
def addProducts(name,brandname,cost):
    try:
        cursor=db.cursor()
        cursor.execute("insert into product (product_name,product_cost ,brand_name) values(%s,%s,%s)" ,(name,cost, brandname))
        db.commit()
        return "Success"
    except:
        return "Error"

#API for deleting products
@app.route('/deleteProduct/<string:name>/<string:brandname>')
def deleteProduct(name,brandname):
    try:
        c=db.cursor()
        c.execute(f"delete from product where product_name='{name}' and product.brand_name='{brandname}'")
        db.commit()
        return "Success"
    except:
        return "Error"
 
 #API for adding brand
@app.route('/addBrand/<string:name>')
def addBrand(name):
    try:
        cursor=db.cursor()
        cursor.execute(f"insert into brand (brand_name) values('{name}')")
        db.commit()
        return "Success"
    except:
        return "Error"


#API for deleting brand
@app.route('/deleteBrand/<string:brandname>')
def deleteBrand(brandname):
    try:
        c=db.cursor()
        c.execute(f"delete from brand where brand_name='{brandname}'")
        db.commit()
        return "Success"
    except:
        return "Error"

#list all products 
@app.route('/listAllProducts')
def listAllProducts():
    try:
        c=db.cursor()
        c.execute("Select product_name, product_cost,brand_name from product")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

#list all brands
@app.route('/listAllBrands')
def listAllBrands():
    try:
        c=db.cursor()
        c.execute("Select * from brand")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

#API for searching using product name
@app.route('/searchUsingProductName/<string:name>')
def searchUsingProductName(name):
    try:
        c=db.cursor()
        c.execute(f"Select product_name, product_cost,brand_name from product where product_name='{name}' and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"


#API for searching using brand name
@app.route('/searchUsingBrandName/<string:name>')
def searchUsingBrandName(name):
    try:
        c=db.cursor()
        c.execute(f"Select product_name, product_cost,brand_name from product where brand_name='{name}' and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

#list out category information
@app.route('/displayCategories')
def displayCategories():
    try:
        c=db.cursor()
        c.execute(f"select category_name,category_info from category ")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"


# search products using category name
@app.route('/searchUsingCategoryName/<string:name>')
def searchUsingCategoryName(name):
    try:
        c=db.cursor()
        c.execute(f"select product_name,product_cost,brand_name from product natural join belongsto where category_id IN (select category_id from category where category_name='{name}') and exists (select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

#add category information
@app.route('/addCategory/<string:name>/<string:info>')
def addCategory(name,info):
    try:
        cursor=db.cursor()
        cursor.execute(f"insert into category(category_name, category_info) values('{name}','{info}')")
        db.commit()
        return "Success"
    except:
        return "Error"

#API for deleting category
@app.route('/deleteCategory/<string:categoryname>')
def deleteCategory(categoryname):
    try:
        c=db.cursor()
        c.execute(f"delete from category where category_name='{categoryname}'")
        db.commit()
        return "Success"
    except:
        return "Error"
        
if __name__ == '__main__':
    app.run(debug=True)