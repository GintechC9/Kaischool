# -*- coding: utf-8 -*-
"""
Created on Tue Apr 30 01:30:56 2019

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

data = pd.read_csv("movies2.csv")
#print (data)
#print(data.shape)
#print(data.head())
#print(data.describe())
#Visualizamos rápidamente las caraterísticas de entrada
#data.drop(['num','color'],1).hist()
#plt.show()
print('Duration with Budget')
filtered_data = data[(data['duration'] <= 165) & (data['budget'] <= 260000000)]
print(data['duration'])
print(filtered_data)
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
plt.show()
#Vamos a comprobar:
# Quiero predecir cuántos "Shares" voy a obtener por un artículo con 2.000 palabras,
# según nuestro modelo, hacemos:
print ('Si la pelicula dura 130 minutos el budget aprox sera de:')
y_Dosmil = regr.predict([[130]])
print(int(y_Dosmil))

#Segunda Regresion

print('\n\nnum_critic_for_reviews with Gross')
filtered_data = data[(data['num_critic_for_reviews'] <= 650) & (data['gross'] <= 750000000)]
 
colores=['orange','blue']
tamanios=[30,60]
 
f1 = filtered_data['num_critic_for_reviews'].values
f2 = filtered_data['gross'].values

# Vamos a pintar en colores los puntos por debajo y por encima de la media de Cantidad de Palabras

asignar=[]
for index, row in filtered_data.iterrows():
    if(row['num_critic_for_reviews']>350):
        asignar.append(colores[0])
    else:
        asignar.append(colores[1])
    
plt.scatter(f1, f2, c=asignar, s=tamanios[0])


# Asignamos nuestra variable de entrada X para entrenamiento y las etiquetas Y.
dataX =filtered_data[["num_critic_for_reviews"]]
X_train = np.array(dataX)
y_train = filtered_data['gross'].values
 
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
x = range(0, 820)

plt.plot(x, [f(i) for i in x])

#Establecemos el color de los ejes.
plt.axhline(0, color="black")
plt.axvline(0, color="black")

#Especificamos los limites de los ejes.
plt.xlim(0,800)
plt.xlabel('Numero de Criticas')
#plt.ylim(0,5)
plt.ylabel('Gross')


# Mostramos el gráfico.
plt.show()
#Vamos a comprobar:
# Quiero predecir cuántos "Shares" voy a obtener por un artículo con 2.000 palabras,
# según nuestro modelo, hacemos:
print ('Si el Numero de criticas es de 800 el gross aprox sera de:')
y_Dosmil = regr.predict([[800]])
print(int(y_Dosmil))


#Terccera Regresion

print('\n\ndirector_facebook_likes with movie_facebook_likes')
filtered_data = data[(data['director_facebook_likes'] <= 600) & (data['movie_facebook_likes'] <= 170000)]
 
colores=['orange','blue']
tamanios=[30,60]
 
f1 = filtered_data['director_facebook_likes'].values
f2 = filtered_data['movie_facebook_likes'].values

# Vamos a pintar en colores los puntos por debajo y por encima de la media de Cantidad de Palabras

asignar=[]
for index, row in filtered_data.iterrows():
    if(row['director_facebook_likes']>300):
        asignar.append(colores[0])
    else:
        asignar.append(colores[1])
    
plt.scatter(f1, f2, c=asignar, s=tamanios[0])


# Asignamos nuestra variable de entrada X para entrenamiento y las etiquetas Y.
dataX =filtered_data[['director_facebook_likes']]
X_train = np.array(dataX)
y_train = filtered_data['movie_facebook_likes'].values
 
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
   return regr.coef_*x+40000
x = range(0, 700)

plt.plot(x, [f(i) for i in x])

#Establecemos el color de los ejes.
plt.axhline(0, color="black")
plt.axvline(0, color="black")

#Especificamos los limites de los ejes.
plt.xlabel('Director Facebook likes')
plt.xlim(-10,600)
#plt.ylim(0,5)
plt.ylabel('Movie Facebook Likes')


# Mostramos el gráfico.
plt.show()
#Vamos a comprobar:
# Quiero predecir cuántos "Shares" voy a obtener por un artículo con 2.000 palabras,
# según nuestro modelo, hacemos:
print ('Si el director_facebook_likes  es de 100 movie_facebook_likes aprox sera de:')
y_Dosmil = regr.predict([[100]])
print(int(y_Dosmil))