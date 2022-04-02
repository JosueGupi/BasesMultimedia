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
public class Usuario {
    public int id;
    public String nombre;
    public String apellido;
    public String Tarjeta;
    public int CVC;
    public String DireccionEntrega;
    public String Usuario;
    public String Contra;

    public Usuario(int id, String nombre, String apellido, String Tarjeta, int CVC, String DireccionEntrega, String Usuario, String Contra) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.Tarjeta = Tarjeta;
        this.CVC = CVC;
        this.DireccionEntrega = DireccionEntrega;
        this.Usuario = Usuario;
        this.Contra = Contra;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + ", Tarjeta=" + Tarjeta + ", CVC=" + CVC + ", DireccionEntrega=" + DireccionEntrega + ", Usuario=" + Usuario + ", Contra=" + Contra + '}';
    }
    
    
}
