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
    public String material;
    public String tipoProducto;
    public String dimensiones;
    public float precio;
    public String nombre;
    public String cuidados;

    public Producto() {
    }

    public Producto(int idProducto, String material, String tipoProducto, String dimensiones, float precio, String nombre, String cuidados) {
        this.idProducto = idProducto;
        this.material = material;
        this.tipoProducto = tipoProducto;
        this.dimensiones = dimensiones;
        this.precio = precio;
        this.nombre = nombre;
        this.cuidados = cuidados;
    }
    
    public String toString(){
        return nombre+"|"+tipoProducto+"|"+material+"|"+dimensiones+"|"+precio;
    }
    
    
}
