from flask import Flask, render_template
from mysql import MySQLController    
app = Flask(__name__)

@app.route('/')
def index():
    return render_template('Login.html')

@app.route('/Bodega')
def bodega():
    return render_template('Bodega.html')

@app.route('/Prendas')
def prendas():
    return render_template('Prendas.html')

@app.route('/Empleado')
def empleado():
    return render_template('Empleado.html')

@app.route('/Homepage')
def homepage():
    return render_template('Homepage.html')

@app.route('/Inventario')
def inventario():
    return render_template('Inventario.html')

@app.route('/MateriaPrima')
def materiaPrima():
    return render_template('MateriaPrima.html')

@app.route('/PlantaProduccion')
def plantaProduccion():
    return render_template('PlantaProduccion.html')

@app.route('/Proveedores')
def proveedores():
    return render_template('Proveedores.html')

if __name__ == "__main__":
    app.run(debug = True)