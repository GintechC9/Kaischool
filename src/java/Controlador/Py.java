/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Usuario
 */
public class Py {

    public static int RendimientoA(String clave,String boleta) {

        int estado = 0;
        
        try {
            //Process p = Runtime.getRuntime().exec("cmd /c dir");
            Process p = Runtime.getRuntime().exec("python C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\RendimientoA.py "+boleta+" "+clave);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            //System.out.println("HOLA5");
            String line = reader.readLine();
            while (line != null) {
                System.out.println(line);
                line = reader.readLine();
            }
        } catch (IOException e1) {
            System.out.println("IOException:");
            e1.printStackTrace();
            estado = -1;
        } catch (InterruptedException e2) {
            System.out.println("InterruptedException:");
            e2.printStackTrace();
            estado = -2;
        }
        
        System.out.println("Done");
        return estado;
    }
    
    public static List<String> RenA(String clave,String boleta) {

         List<String> lista = new ArrayList<>();
        
        try {
            //Process p = Runtime.getRuntime().exec("cmd /c dir");
            System.out.println(boleta);
            System.out.println(clave);
            Process p = Runtime.getRuntime().exec("python C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\RendimientoA.py "+boleta+" "+clave);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = reader.readLine();
            //System.out.println("Hola        ");
            System.out.println(line);
            while (line != null) {
                lista.add(line);
                System.out.println(line);
                line = reader.readLine();
            }
        } catch (IOException e1) {
            System.out.println("IOException:");
            e1.printStackTrace();
            //estado = -1;
        } catch (InterruptedException e2) {
            System.out.println("InterruptedException:");
            e2.printStackTrace();
            //estado = -2;
        }
        System.out.println("Done");
        System.out.println(lista);
        return lista;
    }
    
        public static int RendimientoG(String codigo) {

        int estado = 0;
        
        try {
            //Process p = Runtime.getRuntime().exec("cmd /c dir");
            Process p = Runtime.getRuntime().exec("python C:\\Users\\Usuario\\Documents\\NetBeansProjects\\Kaischool\\RendimientoG.py "+codigo);
            p.waitFor();
            BufferedReader reader = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = reader.readLine();
            if(line.equals("N")){
                estado=-4;
                }
            while (line != null) {
                System.out.println(line);
                line = reader.readLine();
            }
        } catch (IOException e1) {
            System.out.println("IOException:");
            e1.printStackTrace();
            estado = -1;
        } catch (InterruptedException e2) {
            System.out.println("InterruptedException:");
            e2.printStackTrace();
            estado = -2;
        }
        System.out.println("Done");
        return estado;
    }
}
