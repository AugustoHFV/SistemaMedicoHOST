/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.NoSuchProviderException;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import javax.swing.JOptionPane;
/**
 *
 * @author werna
 */
public class Correos {
    private static String emailFrom = "flores.vargas.augustoh@gmail.com";
    private static String passwordFrom = "yhctbxsyimvfjgmz";
    private String emailTo;
    private String subject;
    private String content;

    private Properties mProperties;
    private Session mSession;
    private MimeMessage mCorreo;


    private void createEmail(String email,String T,String M) {
        mProperties = new Properties();
        emailTo = email;
        subject = T;
        content = M;
    }

    private void sendEmail() {
    }
    
    public void Correo(String email,String T,String M) {
    }
}
