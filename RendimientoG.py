# -*- coding: utf-8 -*-
"""
Created on Tue May 14 03:21:40 2019

@author: Usuario
"""
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
try:
    db=MySQLdb.connect(host='localhost',user='root', passwd='n0m3l0',db='kaischool')
    cursor=db.cursor()
    Argumentos=sys.argv

    codigog=Argumentos[1]


    cursor.execute("select * from malumno where codigogrupo_alu='{}'".format(codigog))
    registro = cursor.fetchone()
    pfm=[]
    phu=[]
    ppr=[]
    aluc=0
    while (registro != None):
        #print(registro)
    
        pfm.append(registro[5])
        phu.append(registro[6])
        ppr.append(registro[7])
        
        aluc=aluc+1
        
        registro = cursor.fetchone()
        
        
        spf=0
        for u in range(len(pfm)):
            spf=spf+pfm[u]
    
    pl=(spf/aluc)

    pk=100-pl

    labels='Probabilidad',''
    
    sizes = [pl,pk]
    explode = (0, 0.15)  # only "explode" the 2nd slice (i.e. 'Hogs')
    fig1, ax1 = plt.subplots()
    ax1.pie(sizes, explode=explode,labels=labels, autopct='%1.1f%%',shadow=True, startangle=90)
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.title("Prbabilidad Grupal Area Fisico Matematico", bbox={'facecolor':'0.8', 'pad':5})
    #plt.show()
    route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}FM.png".format(codigog)
    plt.savefig(route)
    plt.clf()

    sph=0
    for u in range(len(phu)):
        sph=sph+phu[u]
    
    plh=(sph/aluc)
    
    pk=100-pl
    #labels='Probabilidad',''
    sizes = [plh,pk]
    explode = (0, 0.15)  # only "explode" the 2nd slice (i.e. 'Hogs')
    fig1, ax1 = plt.subplots()
    ax1.pie(sizes, explode=explode,labels=labels, autopct='%1.1f%%',shadow=True, startangle=90)
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.title("Probabilidad Grupal Area Humanistica", bbox={'facecolor':'0.8', 'pad':5})
    #plt.show()
    route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}HU.png".format(codigog)
    plt.savefig(route)
    plt.clf()
    
    spr=0
    for u in range(len(ppr)):
        spr=spr+ppr[u]
    
    plp=(spr/aluc)

    pk=100-pl
    #labels='Probabilidad',''
    sizes = [plp,pk]
    explode = (0, 0.15)  # only "explode" the 2nd slice (i.e. 'Hogs')
    fig1, ax1 = plt.subplots()
    ax1.pie(sizes, explode=explode,labels=labels, autopct='%1.1f%%',shadow=True, startangle=90)
    ax1.axis('equal')  # Equal aspect ratio ensures that pie is drawn as a circle.
    plt.title("Probabilidad Grupal Area Profesional", bbox={'facecolor':'0.8', 'pad':5})
    #plt.show()
    route="C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\web\\Rendimientos\\{}PR.png".format(codigog)
    plt.savefig(route)
    plt.clf()
    
    print(pl)
    print(plh)
    print(plp)

    cursor.close()
    db.commit()
    db.close()
except:
    print('N')
