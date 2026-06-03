/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDAO;

import Controlador.Controlador;
import Interfaces.Crud;
import Modelo.Persona;
import Controladordatos.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.http.HttpSession;

public class PersonaDAO implements Crud{
    
    Connection con;
    PreparedStatement ps;
    Statement st;
    ResultSet rs;
    Persona p=new Persona();
    Conexion cn= new Conexion();
    
    
    public List consultar(String E) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from usuarios where email='"+E+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                per.setApellidos(rs.getString("apellidos"));
                per.setContra(rs.getString("contra"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
   
    public List consultar2() {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from situaciones";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                per.setApellidos(rs.getString("especialidad"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar3(String Es) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores where especialidad='"+Es+"' order by horF Desc limit 1 ";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("email"));
                per.setEmail(rs.getString("FeProxC"));
                per.setContra(rs.getString("HoProxC"));
                per.setHora(Integer.parseInt(rs.getString("horI")));
                per.setHora2(Integer.parseInt(rs.getString("horF")));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
   
    @Override
    public List consultar4() {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from especialidad";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar5(String Sit) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from situaciones where nombre='"+Sit+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setApellidos(rs.getString("especialidad"));
                per.setVer(rs.getString("duracion"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar6(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where paciente='"+Ema+"' and fecha>='"+Fe+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Doctor"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                per.setCons(rs.getString("Consultorio"));
                per.setEmail(rs.getString("receta"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar7(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where paciente='"+Ema+"' and fecha>='"+Fe+"' and Hora>='"+HoA+"'limit 1";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Doctor"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
            
    public List consultar8() {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("email"));
                per.setEspecialidad(rs.getString("Especialidad"));
                per.setHora(Integer.parseInt(rs.getString("horI")));
                per.setHora2(Integer.parseInt(rs.getString("horF")));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar9(String S) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from situaciones where nombre='"+S+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                per.setHora(Integer.parseInt(rs.getString("duracion")));
                per.setApellidos(rs.getString("especialidad"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
    public List consultar10(String Ema,String Fe) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where doctor='"+Ema+"' and fecha>='"+Fe+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Paciente"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                per.setEmail(rs.getString("receta"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar11(String E) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from especialidad where nombre='"+E+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
        public List consultar12(String E) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from situaciones where nombre='"+E+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
                public List consultar13(String E) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from consultorios where nombre='"+E+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar14() {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from consultorios";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar15() {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("email"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
        public List consultar16(String cons) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores where consultorio='"+cons+"' order by horI Asc limit 1";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("horI"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
    public List consultar17(String cons) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores where consultorio='"+cons+"' order by horF Desc limit 1";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("horF"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar18(String Fe,String Es, int Ho, String Doc) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where Especialidad='"+Es+"'  and doctor='"+Doc+"' and fecha='"+Fe+"' and Hora<='"+Ho+"' and HoraF>='"+Ho+"' order by HoraF Asc";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setHora(Integer.parseInt(rs.getString("hora")));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar19(String Es, int Ho) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores where especialidad='"+Es+"' and horI<'"+Ho+"' and horF>'"+Ho+"' order by horF Desc ";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("email"));
                per.setEmail(rs.getString("FeProxC"));
                per.setContra(rs.getString("HoProxC"));
                per.setHora(Integer.parseInt(rs.getString("horI")));
                per.setHora2(Integer.parseInt(rs.getString("horF")));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
            public List consultar20(String Es) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from doctores where especialidad='"+Es+"' order by horI Asc limit 1 ";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("email"));
                per.setEmail(rs.getString("FeProxC"));
                per.setContra(rs.getString("HoProxC"));
                per.setHora(Integer.parseInt(rs.getString("horI")));
                per.setHora2(Integer.parseInt(rs.getString("horF")));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
    public List consultar21(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where paciente='"+Ema+"' and fecha='"+Fe+"' and HoraF>='"+HoA+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Doctor"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
    
        public List consultar22(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where paciente='"+Ema+"' and fecha>'"+Fe+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Doctor"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                per.setCons(rs.getString("Consultorio"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }
        
        public List consultar23(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from citas where paciente='"+Ema+"' and fecha>'"+Fe+"' limit 1";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("Doctor"));
                per.setApellidos(rs.getString("situacion"));
                per.setContra(rs.getString("hora"));
                per.setVer(rs.getString("fecha"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar24(String Ema,String Fe,int HoA) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select count(*) from citas where fecha='"+Fe+"' and Hora>='"+HoA+"' and doctor='"+Ema+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setHora(Integer.parseInt(rs.getString("COUNT(*)")));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar25(String Ema,String Fe) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select count(*) from citas where fecha>'"+Fe+"' and doctor='"+Ema+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setHora(Integer.parseInt(rs.getString("COUNT(*)")));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar26(String Ema) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select count(*) from citas where doctor='"+Ema+"'";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setHora(Integer.parseInt(rs.getString("COUNT(*)")));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar27(String Usu, String doc) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from mensajes where remitente='"+Usu+"' and destinatario='"+doc+"' or remitente='"+doc+"' and destinatario='"+Usu+"' order by concat(fecha,' ',hora) desc";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("remitente"));
                per.setApellidos(rs.getString("destinatario"));
                per.setContra(rs.getString("fecha"));
                per.setHora(Integer.parseInt(rs.getString("hora")));
                per.setVer(rs.getString("mensaje"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar28(String Usu, String doc) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select count(*) from mensajes where remitente='"+Usu+"' and destinatario='"+doc+"' or remitente='"+doc+"' and destinatario='"+Usu+"' order by concat(fecha,' ',hora) desc";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setHora(Integer.parseInt(rs.getString("COUNT(*)")));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
    
    public List consultar29(String Usu, String doc) {
   
        ArrayList<Persona> list= new ArrayList<>();
        String sql="select * from mensajes where remitente='"+Usu+"' and destinatario='"+doc+"' or remitente='"+doc+"' and destinatario='"+Usu+"' order by concat(fecha,' ',hora) desc limit 1";
        try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("remitente"));
                per.setApellidos(rs.getString("destinatario"));
                per.setContra(rs.getString("fecha"));
                per.setHora(Integer.parseInt(rs.getString("hora")));
                per.setVer(rs.getString("mensaje"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
            return list;
    }
        
    @Override
    public List list(String Usu) {
        ArrayList<Persona> list= new ArrayList<>();
          String sql="select * from usuarios where email='"+Usu+"'";
         try {
            con=cn.Conectar();
            st=con.createStatement();
            rs=st.executeQuery(sql);
            
            while(rs.next()){
                Persona per= new Persona();
                per.setNombre(rs.getString("nombre"));
                per.setApellidos(rs.getString("Apellidos"));
                per.setContra(rs.getString("Contra"));
                per.setEmail(rs.getString("Email"));
                list.add(per);
            }
            
            
        } catch (Exception e) {
            System.err.println("Error"+e);
        }
        
        
        return list;
    }

    @Override
    public boolean registrar(Persona per) {
        String sql="insert into usuarios(nombre,apellidos,email,contra,nivel) values('"+per.getNombre()+"','"+per.getApellidos()+"','"+per.getEmail()+"','"+per.getContra()+"','"+per.getNivel()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    
    }

    public boolean registrar2(Persona per) {
        String sql="insert into situaciones(nombre,duracion,especialidad) values('"+per.getNombre()+"','"+per.getNivel()+"','"+per.getApellidos()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    
    }
    
    public boolean registrar3(Persona per) {
        String sql="insert into doctores(email,especialidad,horI,horF,consultorio) values('"+per.getEmail()+"','"+per.getEspecialidad()+"','"+per.getHora()+"','"+per.getHora2()+"','"+per.getCons()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    
    public boolean registrar4(Persona per) {
        String sql="insert into especialidad(nombre) values('"+per.getNombre()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    
    public boolean registrar5(Persona per) {
        String sql="insert into citas(paciente,doctor,Situacion,Hora,fecha,consultorio,Especialidad,HoraF) values('"+per.getNombre()+"','"+per.getApellidos()+"','"+per.getEmail()+"','"+per.getHora()+"','"+per.getVer()+"','"+per.getCons()+"','"+per.getContra()+"','"+per.getHora2()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
        
    public boolean registrar6(Persona per) {
        String sql="insert into consultorios(nombre) values('"+per.getNombre()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
            
    public boolean registrar7(Persona per) {
        String sql="insert into mensajes(remitente,destinatario,fecha,hora,mensaje) values('"+per.getNombre()+"','"+per.getApellidos()+"','"+per.getContra()+"','"+per.getHora()+"','"+per.getVer()+"')";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }

    public boolean editar(Persona per) {
        String sql="update doctores set FeProxC='"+per.getVer()+"', HoProxC='"+per.getHora()+"' where email='"+per.getApellidos()+"'";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    
    public boolean editarC(Persona per, String E) {
        String sql="update usuarios set nombre='"+per.getNombre()+"', apellidos='"+per.getApellidos()+"', contra='"+per.getContra()+"' where email='"+E+"'";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    
    public boolean editarR(Persona per) {
        String sql="update citas set receta='"+per.getContra()+"' where paciente='"+per.getNombre()+"' and Situacion='"+per.getApellidos()+"' and fecha='"+per.getVer()+"' and Hora='"+per.getHora()+"'";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }

    @Override
    public boolean Eliminar(String ema) {
        String sql="delete from usuarios where email='"+ema+"'";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    
    public boolean Eliminar2(String ema) {
        String sql="delete from doctores where email='"+ema+"'";
        try{
        con=cn.Conectar();
        ps=con.prepareStatement(sql);
        
        ps.executeUpdate();
        }catch(Exception e){
            System.err.println("Error"+e);
        }
        return false;
    }
    

}
