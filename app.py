from flask import Flask, render_template, request
import sqlite3
import os

app = Flask(__name__)
DATABASE = 'database.db'
SCHEMA_FILE = 'data.sql' # Ensure this file exists

# --- (init_db function remains the same as previous version) ---
def init_db():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(script_dir, DATABASE)
    schema_path = os.path.join(script_dir, SCHEMA_FILE)

    if not os.path.exists(db_path):
        print(f"Database {db_path} not found. Creating from {schema_path}...")
        conn = None
        try:
            if not os.path.exists(schema_path):
                 print(f"Error: The schema file '{SCHEMA_FILE}' was not found at '{schema_path}'.")
                 print("Please ensure 'data.sql' is in the same directory as app.py.")
                 return

            conn = sqlite3.connect(db_path)
            cursor = conn.cursor()
            with open(schema_path, 'r', encoding='utf-8') as f:
                sql_script = f.read()
            cursor.executescript(sql_script)
            conn.commit()
            print(f"Database {DATABASE} created and populated successfully from {SCHEMA_FILE}.")
        except sqlite3.Error as e:
            print(f"An error occurred during database initialization: {e}")
            if os.path.exists(db_path):
                try:
                    if conn: conn.close(); conn = None
                    os.remove(db_path)
                    print(f"Removed partially created database file: {db_path}")
                except OSError as remove_error:
                    print(f"Error removing database file {db_path}: {remove_error}")
        except Exception as general_error:
             print(f"An unexpected error occurred: {general_error}")
             if os.path.exists(db_path):
                try:
                    if conn: conn.close(); conn = None
                    os.remove(db_path)
                    print(f"Removed potentially corrupted database file: {db_path}")
                except OSError as remove_error:
                    print(f"Error removing database file {db_path}: {remove_error}")
        finally:
            if conn: conn.close()
    else:
         print(f"Database {DATABASE} already exists. Skipping initialization.")


def get_db_connection():
    script_dir = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(script_dir, DATABASE)
    conn = sqlite3.connect(db_path)
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/truong', methods=['GET']) # Chỉ cần GET là đủ cho form này
def danh_sach_truong():
    conn = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        # Lấy tham số từ URL query string
        # Dùng request.args vì method là GET
        search_term = request.args.get('ten_truong_search', '').strip() # Tên trường từ ô tìm kiếm ban đầu
        filter_mien = request.args.get('mien', '').strip()
        filter_tinh = request.args.get('tinh_thanh', '').strip()
        # Xác định xem đây là hành động tìm kiếm hay lọc
        # Nếu có mien hoặc tinh_thanh -> lọc. Nếu không -> tìm kiếm ban đầu (hoặc xem tất cả)
        is_filtering = bool(filter_mien or filter_tinh)

        # Base query - Luôn join với Mien để tiện lấy tên miền nếu cần (hoặc chỉ join khi lọc)
        # Chọn cách JOIN luôn để đơn giản hoá query string
        query = """
            SELECT T.*, M.mien
            FROM ThongTin_Truong T
            LEFT JOIN Mien M ON T.ma_truong = M.ma_truong
            WHERE 1=1
        """
        params = []

        # Luôn áp dụng bộ lọc tên trường nếu có
        if search_term:
            query += " AND T.ten_truong LIKE ?"
            params.append(f"%{search_term}%")

        # Chỉ áp dụng bộ lọc miền và tỉnh nếu người dùng đang LỌC
        if is_filtering:
            if filter_mien:
                query += " AND M.mien = ?"
                params.append(filter_mien)
            if filter_tinh:
                query += " AND T.vi_tri LIKE ?"
                params.append(f"%{filter_tinh}%")

        query += " ORDER BY T.ten_truong"

        cursor.execute(query, params)
        ds_truong = cursor.fetchall()

        # Lấy danh sách các tỉnh thành duy nhất từ DB để đưa vào dropdown (Tùy chọn nâng cao)
        # cursor_tinh = conn.cursor()
        # cursor_tinh.execute("SELECT DISTINCT vi_tri FROM ThongTin_Truong ORDER BY vi_tri") # Cần xử lý để chỉ lấy tên tỉnh
        # ds_tinh_thanh = [row['vi_tri'] for row in cursor_tinh.fetchall()] # Cần xử lý chuỗi địa chỉ để lấy tên tỉnh

        # Tạm thời dùng danh sách cố định
        tinh_thanh_options = ["Hà Nội", "TP.HCM", "Đà Nẵng", "Bình Dương", "Long An", "Hưng Yên"] # Thêm các tỉnh có trong data

        return render_template(
            'truong.html',
            ds_truong=ds_truong,
            search_term=search_term, # Giá trị đã nhập vào ô tìm kiếm
            selected_mien=filter_mien, # Miền đã chọn để lọc
            selected_tinh=filter_tinh, # Tỉnh đã chọn để lọc
            tinh_thanh_options=tinh_thanh_options, # Danh sách tỉnh cho dropdown
            request=request # Vẫn truyền request nếu cần dùng các tham số khác
        )

    except sqlite3.Error as e:
        print(f"Database error in /truong route: {e}")
        # Trong trường hợp lỗi DB, trả về trang lỗi hoặc thông báo
        # return "Đã xảy ra lỗi khi truy vấn cơ sở dữ liệu.", 500
        # Hoặc trả về template với danh sách rỗng và thông báo lỗi
        return render_template(
            'truong.html',
            ds_truong=[],
            error_message="Lỗi cơ sở dữ liệu. Không thể tải danh sách trường.",
            tinh_thanh_options = ["Hà Nội", "TP.HCM", "Đà Nẵng", "Bình Dương", "Long An", "Hưng Yên"] # Vẫn cần để render form
        )
    finally:
        if conn:
            conn.close()


# --- (Route chi_tiet không thay đổi) ---
@app.route('/truong/<ma_truong>')
def chi_tiet(ma_truong):
    conn = None
    try:
        conn = get_db_connection()
        truong_data = conn.execute("""
            SELECT T.*, M.mien
            FROM ThongTin_Truong T
            LEFT JOIN Mien M ON T.ma_truong = M.ma_truong
            WHERE T.ma_truong = ?
        """, (ma_truong,)).fetchone()

        if truong_data is None:
             return "Không tìm thấy thông tin trường", 404

        return render_template('chitiet.html', ThongTin_Truong=truong_data)
    except sqlite3.Error as e:
        print(f"Database error in /truong/<ma_truong> route: {e}")
        return "An error occurred while fetching school details.", 500
    finally:
        if conn:
            conn.close()

if __name__ == "__main__":
    init_db() # Initialize DB using data.sql if needed
    app.run(debug=True)
