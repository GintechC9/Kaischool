# -*- coding: utf-8 -*-
"""
Created on Wed May  1 19:18:28 2019

@author: Usuario
"""
# import de MySQLdb
#import MySQLdb
import mysql.connector as MySQLdb
import sys
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
plt.rcParams['font.size'] = 20
# Se establece la conexión
db=MySQLdb.connect(host='localhost',user='root', passwd='n0m3l0',db='kaischool')
cursor=db.cursor()
Argumentos=sys.argv
#print (Argumentos)
bol=Argumentos[0]
clave=Argumentos[0]
#print(bol)
cursor.execute("select * from crendimiento where clave_usu='{}'".format(clave))
registro = cursor.fetchone()
alumnos=dict()
rendi=[]
while (registro != None):
    boleta=""
    economico=0
    personalidad=0
    #for i in range(len(registro)):
    #    print (registro[i])    
    #print(registro)
    economico=registro[4]
    personalidad=registro[3]
    clave=registro[1]
    #economico=(economico*10)/418
    
    if economico>=1 and economico<=45:
        economico=1
    elif economico>=46 and economico<=90:
        economico=2
    elif economico>=91 and economico<=136:
        economico=3
    elif economico>=137 and economico<=181:
        economico=4
    elif economico>=182 and economico<=227:
        economico=5
    elif economico>=228 and economico<=272:
        economico=6
    elif economico>=273 and economico<=317:
        economico=7
    elif economico>=318 and economico<=363:
        economico=8
    elif economico>=364 and economico<=408:
        economico=9
    elif economico>=409 and economico<=454:
        economico=10
    else:
        economico=0
        
    if personalidad<=8:
        personalidad=7
    elif personalidad>=9 and personalidad<=13:
        personalidad=10
    else:
        personalidad=8.5
        
        
    rendimientoA=(personalidad*0.25)+(economico*0.30)
    wer=[clave,str(rendimientoA)]
    rendi.append(wer)
    alumnos.update({clave:rendimientoA})
    registro = cursor.fetchone()
    
#print('\n')
#print(alumnos)
#claves=list(alumnos.keys())
#print(claves)
#print(rendi)
#print('\n')
#for c in range(len(alumnos)):
cursor.execute("select * from malumno where clave_usu='{}'".format(clave))
registro = cursor.fetchone()
while (registro != None):
    #for i in range(len(registro)):
    #    print (registro[i])
    boleta=registro[0]
    registro = cursor.fetchone()
    
#3print(boletas)
pra=0
RenAlu=[]
temp=[]
tempf=[]
temphu=[]
temppr=[]
cal=[]
# print('Hola1')
cursor.execute("select * from calificaciones where boleta='{}'".format(boleta))
registroa = cursor.fetchone()
#print(registro)
#print(':(')
while (registroa != None):
    #for i in range(len(registroa)):
    #    print(registroa[i])
            
    #print('\n')        #print(registroa[10])
    tempf.append(registroa[1])
    tempf.append(registroa[2])
    tempf.append(registroa[3])
    temphu.append(registroa[4])
    temphu.append(registroa[5])
    temphu.append(registroa[6])
    tempf.append(registroa[7])
    tempf.append(registroa[8])
    tempf.append(registroa[9])
    temphu.append(registroa[10])
    temphu.append(registroa[11])
    temphu.append(registroa[12])
    tempf.append(registroa[13])
    tempf.append(registroa[14])
    tempf.append(registroa[15])
    temphu.append(registroa[16])
    temphu.append(registroa[17])
    temphu.append(registroa[18])
    temppr.append(registroa[19])
    temppr.append(registroa[20])
    temppr.append(registroa[21])
    tempf.append(registroa[22])
    temphu.append(registroa[23])
    temppr.append(registroa[24])
    cal.append(temp)
    cal.append(temp)
    cal.append(temp)
    cal.append(temp)
    pra=(registroa[1]+registroa[2]+registroa[3]+registroa[4]+registroa[5]+registroa[6]+registroa[7]+registroa[8]+registroa[9]+registroa[10]+registroa[11]+registroa[12]+registroa[13]+registroa[14]+registroa[15]+registroa[16]+registroa[17]+registroa[18]+registroa[19]+registroa[20]+registroa[21]+registroa[22]+registroa[23]+registroa[24])/24   
    ren=pra*0.45
    #print('\n')
    #print(pra)
    cursor.execute("select * from malumno where bol_alu='{}'".format(boleta))
    registrox = cursor.fetchone()
    while (registrox != None):
        #for t in range(len(registrox)):
        #    print(registrox[t])
            
        #print(registrox)
        clave=registrox[1]
        #print(clave)
        #print('\n')
        for t in range(len(rendi)):
            r=rendi[t]
            # print (r)
            for y in range(len(r)):
                #print('HOLA')
                if r[y]==clave:
                    #print(ren)
                    c=(float(r[1])+ren)*.9
                    #print('HOLAABC')
                    #print(c)
                    RenAlu.append([clave,c])
            
        registrox=cursor.fetchone()
    registroa=cursor.fetchone()
    
#print(registro)
#print(RenAlu)

for a in range(len(RenAlu)):
    lista=RenAlu[a]
    for j in range(len(lista)):
        clave=lista[0]
        #print('\n')
        #print(clave)
        rendimiento=lista[1]
        #print(rendimiento)
        sql="UPDATE crendimiento SET rendimiento_ren={} WHERE clave_usu='{}'".format(rendimiento,clave)
        #print(sql)
        cursor=db.cursor()
        cursor.execute(sql)
        

#cursor.close()
#db.commit()
#db.close()
Argumentos=sys.argv
#print (Argumentos)
semestre=['1.1','1.2','1.3','2.1','2.2','2.3','3.1','3.2','3.3','4.1']
xfm=np.array(semestre)
yfm=np.array(tempf)
plt.plot(xfm,yfm,'-ok')
plt.ylabel('Calificacion Area Fisico Matematico')
plt.xlabel('Parciales')
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}FM.png".format(bol)
plt.savefig(route)
plt.clf()
#print(len(tempf))
#print(tempf)
PFM=((tempf[0]+tempf[1]+tempf[2]+tempf[3]+tempf[4]+tempf[5]+tempf[6]+tempf[7]+tempf[8])/9*0.55)+(tempf[9]*0.45)
ProbAFM=((PFM*0.45)+(economico*0.30)+(personalidad*0.25))*9
#print(economico)
#print(personalidad)
#print(PFM)
print(ProbAFM)

regr=linear_model.LinearRegression()
plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
plt.rcParams['font.size'] = 20
x = pd.DataFrame({
        'name': [1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 4.1]
    }, columns=['name'], index=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],dtype=np.float64)
    
y = pd.DataFrame({
        'name': [tempf[0],tempf[1], tempf[2], tempf[3], tempf[4], tempf[5], tempf[6], tempf[7], tempf[8], tempf[9]]
    }, columns=['name'], index=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],dtype=np.float64)
regr.fit(x,y)
regr.coef_
m=regr.coef_[0]
b=regr.intercept_
y_p=m*x+b
plt.scatter(x,y,color='blue')
plt.plot(x,y_p, color='red')
plt.title('',fontsize=16)
plt.xlabel('Tiempo',fontsize=13)
plt.ylabel('Promedios',fontsize=13)
plt.title("Prediccion Area Fisico Matematico", bbox={'facecolor':'0.8', 'pad':5})
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}FMP.png".format(bol)
plt.savefig(route)
plt.clf()



xhu=np.array(semestre)
yhu=np.array(temphu)
plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
plt.rcParams['font.size'] = 20
plt.plot(xhu,yhu,'-ok')
plt.ylabel('Calificacion Area Humanistica')
plt.xlabel('Parciales')
#plt.show()
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}HU.png".format(bol)
plt.savefig(route)

plt.clf()
#print(temphu)
PHU=((temphu[0]+temphu[1]+temphu[2]+temphu[3]+temphu[4]+temphu[5]+temphu[6]+temphu[7]+temphu[8])/9*0.55)+(temphu[9]*0.45)
ProbAHU=((PHU*0.45)+(economico*0.30)+(personalidad*0.25))*9
#print(economico)
#print(personalidad)
#print(PFM)
print(ProbAHU)

regr=linear_model.LinearRegression()
plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
plt.rcParams['font.size'] = 20
x = pd.DataFrame({
        'name': [1.1, 1.2, 1.3, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 4.1]
    }, columns=['name'], index=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],dtype=np.float64)
    
y = pd.DataFrame({
        'name': [temphu[0],temphu[1], temphu[2], temphu[3], temphu[4], temphu[5], temphu[6], temphu[7], temphu[8], temphu[9]]
    }, columns=['name'], index=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],dtype=np.float64)
regr.fit(x,y)
regr.coef_
m=regr.coef_[0]
b=regr.intercept_
y_p=m*x+b
plt.scatter(x,y,color='blue')
plt.plot(x,y_p, color='red')
plt.title('',fontsize=16)
plt.xlabel('Tiempo',fontsize=13)
plt.ylabel('Promedios',fontsize=13)
plt.title("Prediccion Area Humanistica", bbox={'facecolor':'0.8', 'pad':5})
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}HUP.png".format(bol)
plt.savefig(route)
plt.clf()


plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
plt.rcParams.update({'font.size': 20})
sem=['3.1','3.2','3.3','4.1']
xpr=np.array(sem)
ypr=np.array(temppr)
#print(temppr)
plt.plot(xpr,ypr,'-ok')
plt.ylabel('Calificacion Area Profesional')
plt.xlabel('Parciales')
#plt.show()
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}PR.png".format(bol)
plt.savefig(route)
plt.clf()


#print(temppr)
PPR=(((temppr[0]+temppr[1]+temppr[2])/3)*0.55)+(temppr[3]*0.45)
ProbAPR=((PPR*0.45)+(economico*0.30)+(personalidad*0.25))*9
#print(economico)
#print(personalidad)
#print(PPR)
print(ProbAPR)

regr=linear_model.LinearRegression()
plt.rcParams['figure.figsize'] = (16, 9)
plt.style.use('ggplot')
plt.rcParams['font.size'] = 20
x = pd.DataFrame({
        'name': [3.1, 3.2, 3.3, 4.1]
    }, columns=['name'], index=[0, 1, 2, 3],dtype=np.float64)
    
y = pd.DataFrame({
        'name': [temppr[0],temppr[1], temppr[2], temppr[3]]
    }, columns=['name'], index=[0, 1, 2, 3],dtype=np.float64)
regr.fit(x,y)
regr.coef_
m=regr.coef_[0]
b=regr.intercept_
y_p=m*x+b
plt.scatter(x,y,color='blue')
plt.plot(x,y_p, color='red')
plt.title('',fontsize=16)
plt.xlabel('Tiempo',fontsize=13)
plt.ylabel('Promedios',fontsize=13)
plt.title("Prediccion Area Profesional", bbox={'facecolor':'0.8', 'pad':5})
route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}PRP.png".format(bol)
plt.savefig(route)
plt.clf()


sql="UPDATE malumno SET pf_alu={},ph_alu={},pp_alu={} WHERE clave_usu='{}'".format(ProbAFM,ProbAHU,ProbAPR,clave)
#print(sql)
cursor=db.cursor()
cursor.execute(sql)
cursor.close()
db.commit()
db.close()


