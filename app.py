from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

def get_db_connection():
    conn = sqlite3.connect('database.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/ThongTin_Truong')
def danh_sach_truong():
    ten = request.args.get('ten_truong', '')
    tenta = request.args.get('ten_t_a', '')

    conn = get_db_connection()
    cursor = conn.cursor()

    query = "SELECT * FROM ThongTin_Truong WHERE 1=1"
    params = []

    if ten:
        query += " AND ten_truong LIKE ?"
        params.append(f"%{ten}%")
    if tenta:
        query += " AND dia_chi = ?"
        params.append(tenta)

    cursor.execute(query, params)
    ds_truong = cursor.fetchall()
    conn.close()
    return render_template('truong.html', ds_truong=ds_truong)

@app.route('/ThongTin_Truong/<ma_truong>')
def chi_tiet(ma_truong):
    conn = get_db_connection()
    truong = conn.execute("SELECT * FROM ThongTin_Truong WHERE ma_truong = ?", (ma_truong,)).fetchone()
    conn.close()
    return render_template('chitiet.html', truong=truong)

if __name__ == "__main__":
    app.run(debug=True)
