/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muebleria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 *
 * @author Josue
 */
public class Conexion {
    private static final String CONEXIONURL = "jdbc:sqlserver://localhost:1433;"
                    + "database=PruebaTarea1;"
                    + "user=sa;"
                    + "password=admin;"
                    + "loginTimeout=30;";
    public static Connection getConexion(){
            
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection(CONEXIONURL);
            System.out.println("SI SE CONECTO");
            return con;
        } catch (SQLException ex) {
            System.out.println(ex.toString());
            System.out.println("EN LA PRIMERA");
            return null;
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.toString());
            System.out.println("EN LA SEGUNDA");
            return null;
        }  
    }
}
