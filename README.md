# Online Retail System

- Built using Python and Flutter 🎉
- Backend is Flask APIs returning data from a MySQL Database 🧑‍💻
- Frontend is a cross-platform application built using Flutter 🔍

# Some Cool Features 🕵️:
- Fully functional ordering, cancelling, cart system and coupons.
- Over 150 Products in diverse categories
- Supports multiple brands
- Allows searching based on multiple parameters such as brand names, category names and product names
- Ranks products based on best selling (quantity and cost wise) in the app homepage
- Gives admins a separate dashboard to modify the app
- Admins can add, remove and update products with the click of a button
- Proper care has been taken to use views to hide confidential information away from users and admins 

# Setup Instructions:

## To create database 📅:
- Run `Data/createDB.sql` to create the database `retaildb`
- Run `Data/DataDump.sql` to create all tables and populate data inside `retaildb`

## To run backend 👈:
- Install the following python dependencies:
  - [flask](https://flask.palletsprojects.com/en/2.1.x/)
  - [mysql-connector](https://github.com/mysql/mysql-connector-python)
- Replace with your MySQL Server credentials [here](https://github.com/aflah02/DBMS_Project/blob/b0e70229fc58b750a9858b558403c4ee734182d5/APIs/backend.py#L7) in `backend.py`
- Run `backend.py`

## To run frontend 👉:
- Build the app located in `FrontEnd/` by following instructions [here](https://www.geeksforgeeks.org/how-to-install-flutter-on-visual-studio-code/)
- Run it after starting backend and viola enjoy 🎇

## Notes:
 - The project scope and proposal can be found [here](https://github.com/aflah02/DBMS_Project/blob/main/Final%20Project%20proposal.pdf)
 - The Entity Relation Diagram used to design this project:
   ![ERD](https://raw.githubusercontent.com/aflah02/DBMS_Project/main/Diagrams/ERD.png)
