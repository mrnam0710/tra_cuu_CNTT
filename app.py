from flask import Flask, render_template, request
import sqlite3
import os

app = Flask(__name__)
DATABASE = 'database.db'
SCHEMA_FILE = 'schema.sql' # Define the schema filename

# Function to create the database and tables using the schema.sql file
def init_db():
    if not os.path.exists(DATABASE):
        print(f"Database {DATABASE} not found. Creating from {SCHEMA_FILE}...")
        conn = None # Initialize conn to None
        try:
            conn = sqlite3.connect(DATABASE)
            cursor = conn.cursor()
            # Read the SQL file
            with open(SCHEMA_FILE, 'r', encoding='utf-8') as f: # Use utf-8 encoding
                sql_script = f.read()
            # Execute the entire SQL script
            cursor.executescript(sql_script)
            conn.commit()
            print(f"Database {DATABASE} created and populated successfully from {SCHEMA_FILE}.")
        except sqlite3.Error as e:
            print(f"An error occurred during database initialization: {e}")
            # Optionally remove the partially created DB file if error occurs
            if os.path.exists(DATABASE):
                os.remove(DATABASE)
        except FileNotFoundError:
            print(f"Error: The schema file '{SCHEMA_FILE}' was not found in the same directory as app.py.")
            print("Please create the schema.sql file with your table definitions and data.")
        finally:
            if conn:
                conn.close() # Ensure connection is closed even if errors occur
    else:
         print(f"Database {DATABASE} already exists. Skipping initialization.")


def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row # Return rows as dictionary-like objects
    return conn

@app.route('/')
def index():
    return render_template('index.html')

# Changed route to /truong
@app.route('/truong')
def danh_sach_truong():
    # Get search parameters from the form in truong.html
    ten = request.args.get('ten_truong', '').strip()
    tinh = request.args.get('tinh_thanh', '').strip() # Changed parameter name

    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT * FROM ThongTin_Truong WHERE 1=1"
    params = []

    if ten:
        query += " AND ten_truong LIKE ?"
        params.append(f"%{ten}%")
    if tinh:
        # Search within the vi_tri column for the city/province name
        query += " AND vi_tri LIKE ?"
        params.append(f"%{tinh}%")

    # Add ordering for consistency
    query += " ORDER BY ten_truong"

    cursor.execute(query, params)
    ds_truong = cursor.fetchall()
    conn.close()

    # Pass request.args to template to help retain search values
    return render_template('truong.html', ds_truong=ds_truong, request=request)

# Changed route to /truong/<ma_truong>
@app.route('/truong/<ma_truong>')
def chi_tiet(ma_truong):
    conn = get_db_connection()
    # Fetch the specific school by ma_truong
    truong_data = conn.execute("SELECT * FROM ThongTin_Truong WHERE ma_truong = ?", (ma_truong,)).fetchone()
    conn.close()

    if truong_data is None:
         # Handle case where ma_truong doesn't exist
         return "Không tìm thấy thông tin trường", 404

    # Pass data to template using the correct variable name 'ThongTin_Truong'
    return render_template('chitiet.html', ThongTin_Truong=truong_data)

if __name__ == "__main__":
    init_db() # Initialize DB using schema.sql if needed
    app.run(debug=True)
