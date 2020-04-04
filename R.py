# -*- coding: utf-8 -*-
"""
Created on Sat May  4 23:42:06 2019

@author: Usuario
"""
import numpy as np
import pandas as pd
import seaborn as sb
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
from sklearn import linear_model
from sklearn.metrics import mean_squared_error, r2_score

data = pd.read_csv("C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\movies2.csv")

print('Duration with Budget')
filtered_data = data[(data['duration'] <= 165) & (data['budget'] <= 260000000)] 
colores=['orange','blue']
tamanios=[30,60] 
f1 = filtered_data['duration'].values
f2 = filtered_data['budget'].values
# Vamos a pintar en colores los puntos por debajo y por encima de la media de Cantidad de Palabras
asignar=[]
for index, row in filtered_data.iterrows():
    if(row['duration']>150):
        asignar.append(colores[0])
    else:
        asignar.append(colores[1])    
plt.scatter(f1, f2, c=asignar, s=tamanios[0])
# Asignamos nuestra variable de entrada X para entrenamiento y las etiquetas Y.
dataX =filtered_data[["duration"]]
X_train = np.array(dataX)
y_train = filtered_data['budget'].values 
# Creamos el objeto de Regresión Linear
regr = linear_model.LinearRegression() 
# Entrenamos nuestro modelo
regr.fit(X_train, y_train) 
# Hacemos las predicciones que en definitiva una línea (en este caso, al ser 2D)
y_pred = regr.predict(X_train) 
# Veamos los coeficienetes obtenidos, En nuestro caso, serán la Tangente
print('Coefficients: \n', regr.coef_)
# Este es el valor donde corta el eje Y (en X=0)
print('Independent term: \n', regr.intercept_)
# Error Cuadrado Medio
print("Mean squared error: %.2f" % mean_squared_error(y_train, y_pred))
# Puntaje de Varianza. El mejor puntaje es un 1.0
print('Variance score: %.2f' % r2_score(y_train, y_pred))
#Función Lineal.
def f(x):
   return regr.coef_*x+200000000
x = range(0, 190)
plt.plot(x, [f(i) for i in x])
#Establecemos el color de los ejes.
plt.axhline(0, color="black")
plt.axvline(0, color="black")
#Especificamos los limites de los ejes.
plt.xlim(90,185)
plt.xlabel('Duracion')
plt.ylim(190000000,265000000)
plt.ylabel('Budget')
# Mostramos el gráfico.
plt.savefig('C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Python-Graficas\\web\\Grafica.png')