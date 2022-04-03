/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muebleria;

/**
 *
 * @author Josue
 */
public class Producto {
    public int idProducto;
    public String nombre;
    public float precio;
    public int cantidad;
    
    

    public Producto() {
    }

    public Producto(int idProducto, String nombre, float precio, int cantidad) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    /*
    
    public String toString(){
        return nombre+"|"+tipoProducto+"|"+material+"|"+dimensiones+"|"+precio;
    }*/
    
    
}
