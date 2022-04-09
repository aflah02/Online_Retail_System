import re
import flask
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="22510FamSuccess",
    database = 'retaildb')

app = flask.Flask(__name__)


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
        c.execute(f"delete from product where product.name={name} and product.brand_name={brandname}")
        db.commit()
        return "Success"
    except:
        return "Error"
 
 #API for adding brand
@app.route('/addBrand/<string:name>')
def addBrand(name):
    try:
        cursor=db.cursor()
        cursor.execute("insert into brand (brand_name) values(%s)" ,(name))
        db.commit()
        return "Success"
    except:
        return "Error"


#API for deleting brand
@app.route('/deleteBrand/<string:brandname>')
def deleteBrand(brandname):
    # try:
    c=db.cursor()
    c.execute(f"delete from brand where brand_name={brandname}")
    db.commit()
    return "Success"
    # except:
    #     return "Error"

#list all products 
@app.route('/listAllProducts')
def listAllProducts():
    try:
        c=db.cursor()
        c.execute("Select * from product")
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
    # try:
    c=db.cursor()
    c.execute(f"Select * from product where product_name={name}and exists(select product_id from inventory where inventory.product_id = product.product_id and inventory.quantity>0)")
    result = c.fetchall()
    return flask.jsonify(result)
    # except:
    #     return "Error"

if __name__ == '__main__':
    app.run(debug=True)