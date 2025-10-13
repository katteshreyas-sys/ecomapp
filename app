#app
from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

# --- Create database connection ---
def get_db_connection():
    conn = sqlite3.connect('products.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def home():
    conn = get_db_connection()
    products = conn.execute('SELECT * FROM products').fetchall()
    conn.close()
    return render_template('home.html', products=products)

@app.route('/product/<int:id>')
def product_detail(id):
    conn = get_db_connection()
    product = conn.execute('SELECT * FROM products WHERE id = ?', (id,)).fetchone()
    conn.close()
    return render_template('product.html', product=product)

if __name__ == '__main__':
    app.run(debug=True)
