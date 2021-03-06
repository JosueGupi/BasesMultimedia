/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muebleria;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Josue
 */
public class CrearCuenta extends javax.swing.JFrame {

    /**
     * Creates new form CrearCuenta
     */
    public CrearCuenta() {
        initComponents();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnCrear = new javax.swing.JButton();
        lblTitulo = new javax.swing.JLabel();
        lblNombre = new javax.swing.JLabel();
        lblContrasena = new javax.swing.JLabel();
        lblTipoP = new javax.swing.JLabel();
        txtNombre = new javax.swing.JTextField();
        txtContraseña = new javax.swing.JTextField();
        txtCvc = new javax.swing.JTextField();
        lblNombre1 = new javax.swing.JLabel();
        txtApellido = new javax.swing.JTextField();
        lblTarjeta = new javax.swing.JLabel();
        txtTarjeta = new javax.swing.JTextField();
        lblContrasena1 = new javax.swing.JLabel();
        txtDireccion = new javax.swing.JTextField();
        lblContrasena2 = new javax.swing.JLabel();
        txtUsuario = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(755, 483));
        getContentPane().setLayout(null);

        btnCrear.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        btnCrear.setText("Crear");
        btnCrear.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCrearActionPerformed(evt);
            }
        });
        getContentPane().add(btnCrear);
        btnCrear.setBounds(305, 393, 80, 33);

        lblTitulo.setFont(new java.awt.Font("Bahnschrift", 1, 18)); // NOI18N
        lblTitulo.setText("Crear Cuenta");
        getContentPane().add(lblTitulo);
        lblTitulo.setBounds(321, 34, 121, 22);

        lblNombre.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblNombre.setText("Nombre:");
        getContentPane().add(lblNombre);
        lblNombre.setBounds(115, 104, 77, 23);

        lblContrasena.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblContrasena.setText("Contraseña:");
        getContentPane().add(lblContrasena);
        lblContrasena.setBounds(210, 322, 77, 23);

        lblTipoP.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblTipoP.setText("CVC:");
        getContentPane().add(lblTipoP);
        lblTipoP.setBounds(210, 182, 85, 23);
        getContentPane().add(txtNombre);
        txtNombre.setBounds(210, 104, 147, 30);
        getContentPane().add(txtContraseña);
        txtContraseña.setBounds(305, 322, 146, 30);
        getContentPane().add(txtCvc);
        txtCvc.setBounds(305, 182, 146, 30);

        lblNombre1.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblNombre1.setText("Apellido:");
        getContentPane().add(lblNombre1);
        lblNombre1.setBounds(367, 104, 63, 23);
        getContentPane().add(txtApellido);
        txtApellido.setBounds(434, 104, 147, 30);

        lblTarjeta.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblTarjeta.setText("Tarjeta:");
        getContentPane().add(lblTarjeta);
        lblTarjeta.setBounds(200, 148, 68, 23);
        getContentPane().add(txtTarjeta);
        txtTarjeta.setBounds(272, 148, 248, 30);

        lblContrasena1.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblContrasena1.setText("Dirección:");
        getContentPane().add(lblContrasena1);
        lblContrasena1.setBounds(210, 223, 77, 23);
        getContentPane().add(txtDireccion);
        txtDireccion.setBounds(305, 223, 146, 30);

        lblContrasena2.setFont(new java.awt.Font("Bahnschrift", 0, 14)); // NOI18N
        lblContrasena2.setText("Usuario:");
        getContentPane().add(lblContrasena2);
        lblContrasena2.setBounds(210, 272, 77, 23);

        txtUsuario.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtUsuarioActionPerformed(evt);
            }
        });
        getContentPane().add(txtUsuario);
        txtUsuario.setBounds(305, 272, 146, 30);

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/imagenes/fondo-vector.jpg"))); // NOI18N
        jLabel2.setText("jLabel2");
        getContentPane().add(jLabel2);
        jLabel2.setBounds(10, 10, 740, 480);

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void btnCrearActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCrearActionPerformed
        // TODO add your handling code here:
        try {
            // TODO add your handling code here:
            
            String select = "EXECUTE SP_ValidarUsuario ?, ?, ?, ?, ?, ?, ?, 0";
            
            
            PreparedStatement sql = Conexion.getConexion().prepareStatement(select);
            sql.setString(1, txtNombre.getText());
            sql.setString(2, txtApellido.getText());
            sql.setString(3, txtTarjeta.getText());
            sql.setInt(4, Integer.parseInt(txtCvc.getText()));
            sql.setString(5, txtDireccion.getText());
            sql.setString(6, txtUsuario.getText());
            sql.setString(7, txtContraseña.getText());
            
            ResultSet resultado = sql.executeQuery();
            
            resultado.next();
            Usuario u = new Usuario(resultado.getInt("IdCliente"),resultado.getString("Nombre"),resultado.getString("Apellido"),resultado.getString("Tarjeta"),
                        resultado.getInt("CVC"),resultado.getString("DireccionEntrega"),resultado.getString("Usuario"),resultado.getString("Contra"));
            System.out.println(u.toString());
            Cliente c = new Cliente(u);
            c.setVisible(true);
            this.dispose();
            
        } catch (Exception ex) {
            txtUsuario.setText("NOMBRE YA EN USO");
            txtNombre.setText("");
            txtApellido.setText("");
            txtTarjeta.setText("");
            txtCvc.setText("");
            txtDireccion.setText("");
            txtContraseña.setText("");
            /*Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);*/
            
        }
    }//GEN-LAST:event_btnCrearActionPerformed

    private void txtUsuarioActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtUsuarioActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txtUsuarioActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(CrearCuenta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(CrearCuenta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(CrearCuenta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(CrearCuenta.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new CrearCuenta().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCrear;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel lblContrasena;
    private javax.swing.JLabel lblContrasena1;
    private javax.swing.JLabel lblContrasena2;
    private javax.swing.JLabel lblNombre;
    private javax.swing.JLabel lblNombre1;
    private javax.swing.JLabel lblTarjeta;
    private javax.swing.JLabel lblTipoP;
    private javax.swing.JLabel lblTitulo;
    private javax.swing.JTextField txtApellido;
    private javax.swing.JTextField txtContraseña;
    private javax.swing.JTextField txtCvc;
    private javax.swing.JTextField txtDireccion;
    private javax.swing.JTextField txtNombre;
    private javax.swing.JTextField txtTarjeta;
    private javax.swing.JTextField txtUsuario;
    // End of variables declaration//GEN-END:variables
}
