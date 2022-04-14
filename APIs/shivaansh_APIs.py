import flask
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234",
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
        c.execute("Select product_name, product_cost,brand_name from userProductView")
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
        c.execute(f"select category_name,category_info from categoryUserView ")
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


#API for updating category information
@app.route('/updateCategory/<string:categoryname>/<string:description>')
def updateCategory(categoryname,description):
    try:
        c=db.cursor()
        c.execute(f"update category set category_info = '{description}' where category_name='{categoryname}'")
        db.commit()
        return "Success"
    except:
        return "Error"


#API for updating product cost
@app.route('/updateCost/<int:productID>/<int:cost>')
def updateCost(productID,cost):
    try:
        c=db.cursor()
        c.execute(f"update product set product_cost = {cost} where product_id={productID}")
        db.commit()
        return "Success"
    except:
        return "Error"



#API for adding in belongs to table
@app.route('/addBelongsTo/<int:productID>/<int:categoryID>')
def addBelongsTo(productID,categoryID):
    try:
        c=db.cursor()
        c.execute(f"insert into belongsto(product_id, category_id) values ({productID},{categoryID})")
        db.commit()
        return "Success"
    except:
        return "Error"

#API for deleting in belongs to table
@app.route('/deleteBelongsTo/<int:productID>/<int:categoryID>')
def deleteBelongsTo(productID,categoryID):
    try:
        c=db.cursor()
        c.execute(f"delete from belongsto where product_id = {productID} and category_id = {categoryID}")
        db.commit()
        return "Success"
    except:
        return "Error"

#API for displaying belongsTo
@app.route('/BelongsTo')
def BelongsTo():
    try:
        c=db.cursor()
        c.execute(f"select * from belongsto")
        result = c.fetchall()
        return flask.jsonify(result)
    except:
        return "Error"

if __name__ == '__main__':
    app.run(debug=True)