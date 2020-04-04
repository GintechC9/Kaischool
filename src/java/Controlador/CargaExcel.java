/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.FileInputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import java.lang.ClassLoader;
//import javax.management.ObjectName;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
//import java.util.logging.*;
//import oracle.jdbc.driver.OracleDriver;
//import oracle.jdbc.OracleDriver;
//import com.mysql.cj.*;

/**
 *
 * @author carlo
 */
public class CargaExcel {

    public static int Carga(String fileName) {
        int estado = 0;
        //String fileName = "C:\\Respaldos\\AlignPro\\Proyecto Proteo OD\\OracleDB\\PbaCargaDC_STYLE_ODB_2.xlsx";
        fileName = "C:\\Users\\Javier\\Downloads\\Kaischool\\Cal_Area.xlsx";
        try {
            
            XSSFWorkbook workBook = readWorkbook(fileName);
            for (int c_hoj = 0; c_hoj < workBook.getNumberOfSheets(); ++c_hoj) {
                Vector dataHolder = readSheet(workBook, c_hoj);
                saveToDatabase(dataHolder, workBook.getSheetAt(c_hoj).getSheetName());
            }
        } catch (Exception e) {
            estado = -1;
            System.out.println(e.getMessage());
        }

        return estado;
    }

    public static XSSFWorkbook readWorkbook(String fileName) {
        try {
            System.out.println("HOLA1");
            FileInputStream myInput = new FileInputStream(fileName);
            System.out.println("HOLA!");
            XSSFWorkbook myWorkBook = new XSSFWorkbook(myInput);
            myInput.close();
            return myWorkBook;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Vector readSheet(XSSFWorkbook myWorkBook, int sheetNum) {
        Vector cellVectorHolder = new Vector();
        try {

            if (sheetNum >= myWorkBook.getNumberOfSheets()) {
                return null;
            }
            XSSFSheet mySheet = myWorkBook.getSheetAt(sheetNum);
            Iterator rowIter = mySheet.rowIterator();
            while (rowIter.hasNext()) {
                XSSFRow myRow = (XSSFRow) rowIter.next();
                Iterator cellIter = myRow.cellIterator();
                List list = new ArrayList();
                while (cellIter.hasNext()) {
                    XSSFCell myCell = (XSSFCell) cellIter.next();
                    list.add(myCell);
                }
                cellVectorHolder.addElement(list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cellVectorHolder;
    }

    private static void saveToDatabase(Vector dataHolder, String table) {

        Connection con;

        if ((table.equals("")) || (dataHolder == null)) {
            return;
        }

        //System.out.println("Tabla:" + table + ", Contenido del Excel:" + dataHolder);
        System.out.println("Tabla:" + table);

        try {
            // Abre la Conexión
            String username, password, url;

            url = "jdbc:mysql://localhost/kaischool";
            username = "root";
            password = "n0m3l0";
            //Connection con = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url, username, password);
                System.out.println("Conexion Exitosa");

            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                System.out.println("Conexion no exitosa");
                return;
            }

            // Itera los datos del Excel 
            String fld_str = "", // String con los nombres de los campos        CAMPO1,CAMPO2,CAMPO3,...
                    fld_qmr = ""; // String con interrogaciones para cada campo  ?,?,?,...
            int cnt = 0,
                    fc = 0;
            for (Iterator iterator = dataHolder.iterator(); iterator.hasNext();) {
                List list = (List) iterator.next();
                // Para el primer renglón obtiene los nombres de los campos
                if (fld_str.equals("")) {
                    cnt = 0;    // Número total de campos
                    while (cnt < list.size()) {
                        if (cnt > 0) {
                            fld_str = fld_str + ",";
                            fld_qmr = fld_qmr + ",";
                        }
                        fld_str = fld_str + list.get(cnt).toString();
                        fld_qmr = fld_qmr + "?";
                        ++cnt;
                    }
                } else {
                    // Para el segundo renglón en adelante obtiene los datos
                    String strStmt = "INSERT INTO " + table + "(" + fld_str + ") VALUES(" + fld_qmr + ")";
                    System.out.println(strStmt);
                    PreparedStatement stmt = con.prepareStatement(strStmt);

                    fc = 0;     // Contador de campos
                    while (fc < cnt) {
                        try {
                            stmt.setString(fc + 1, list.get(fc).toString());
                            //((XSSFCell)list.get(fc)).getCellType()
                        } catch (IndexOutOfBoundsException e) {
                            stmt.setString(fc + 1, "");
                        }
                        ++fc;
                    }

                    try {
                        stmt.executeUpdate();
                        System.out.print("Los datos han sido insertados:");
                        try {
                            for (int i = 0; i < cnt; ++i) {
                                System.out.print(list.get(i).toString() + ",");
                            }
                        } catch (IndexOutOfBoundsException ex) {
                        }
                        System.out.println();
                    } catch (SQLException e) {
                        e.printStackTrace();
                        //System.out.println(((JDBC4PreparedStatement)stmt).asSql());
                        //System.out.println(((OraclePreparedStatement)stmt).);
                        System.out.println("PreparedStatement:" + stmt.toString());
                        System.out.println("Mensaje de error:" + e.getMessage().trim());
                        System.out.print("Valor de campos:");
                        try {
                            for (int i = 0; i < cnt; ++i) {
                                System.out.print(list.get(i).toString() + "|");
                            }
                        } catch (IndexOutOfBoundsException ec) {
                        }
                        System.out.println();
                    } finally {
                        stmt.close();
                    }
                }
            }

            /*    // disable logging
            mbs.setAttribute(name, new javax.management.Attribute("LoggingEnabled", false));  */
            // Cierra la Conexión
            con.close();
            System.out.println("Conexión cerrada");

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
