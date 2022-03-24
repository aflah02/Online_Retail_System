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
        cursor.execute(f'select Temp.Username, SUM(Temp.Total) as "Total cost" from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total from User U, items_contained I,product P where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp group by Temp.Username;')
        result = cursor.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

if __name__ == '__main__':
    app.run(debug=True)