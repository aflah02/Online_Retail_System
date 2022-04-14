import flask
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="mysql",
    database = 'retaildb')

app = flask.Flask(__name__)

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

# update billing_address in billing_details table
@app.route('/updateBillingAddress/<int:billing_id>/<string:billing_address>', methods=['GET'])
def updateBillingAddress(billing_id, billing_address):
    try:
        cursor = db.cursor()
        cursor.execute(f"""UPDATE billing_details SET billing_address = '{billing_address}' WHERE billing_id = {billing_id};""")
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


if __name__ == '__main__':
    app.run(debug=True)