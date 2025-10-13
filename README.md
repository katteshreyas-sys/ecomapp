# ecomapp
This is a e commerce application project good for students of BCA to do and is a portfolio worthy project!
import sqlite3

connection = sqlite3.connect('products.db')

with connection:
    connection.execute('''
        CREATE TABLE products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            price REAL NOT NULL,
            description TEXT,
            image TEXT
        );
    ''')

    connection.execute('''
        INSERT INTO products (name, price, description, image)
        VALUES
        ('Wireless Headphones', 2999, 'High-quality sound with noise cancellation', 'headphones.jpg'),
        ('Smartwatch', 4999, 'Track your fitness and stay connected', 'watch.jpg'),
        ('Gaming Mouse', 1599, 'RGB lighting and ergonomic design', 'mouse.jpg');
    ''')

print("Database created and sample data inserted!")
