/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muebleria;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Josue
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        String execute = "SELECT BulkColumn FROM OPENROWSET(BULK 'C:/abeja.jpg',SINGLE_BLOB) AS Imagen";
            
            
        PreparedStatement sql = Conexion.getConexion().prepareStatement(execute);


        ResultSet resultado = sql.executeQuery();

        resultado.next();

        byte [] data = resultado.getBytes("BulkColumn");
        System.out.println(data);
        Index menu = new Index();
        menu.setVisible(true);
    }
    
}
