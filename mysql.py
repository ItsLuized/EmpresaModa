import pymysql.cursors

class MySQLController():
    def __init__(self):
    # Connect to the database
    connection = pymysql.connect(host='localhost',
                                user='root',
                                password='',
                                db='EmpresaModa',
                                charset='utf8mb4',
                                cursorclass=pymysql.cursors.DictCursor)

    def insert(self, sql, val):
        try:
            with self.connection.cursor() as cursor:
                cursor.execute(sql, val)
            self.connection.commit()
        except pymysql.err.IntegrityError as e:
            print("Database Error: Error insertando datos en User: \t", e)

    def select(self, sql, val):
        try:
            with self.connection.cursor() as cursor:
                cursor.execute(sql, val)
                result = cursor.fetchall()

                return result
                
        except pymysql.err.IntegrityError as e:
            print("Database Error: Error realizando un query en User: \t", e)
