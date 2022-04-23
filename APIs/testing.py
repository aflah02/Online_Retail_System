import re
import flask
import mysql.connector
import json

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234",
    database = 'retaildb')
db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="1234",
    database = 'retaildb')