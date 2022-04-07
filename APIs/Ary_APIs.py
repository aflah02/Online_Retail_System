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


if __name__ == '__main__':
    app.run(debug=True)