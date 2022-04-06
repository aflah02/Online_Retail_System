import flask
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234",
    database = 'retaildb')

app = flask.Flask(__name__)

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

if __name__ == '__main__':
    app.run(debug=True)