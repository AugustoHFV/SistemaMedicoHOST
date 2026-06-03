/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controladordatos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Consultas extends Conexion{
   ResultSet rs;
    
    public Consultas(){
        try{
            Conectar();
            System.out.println("conectado 2");
        }catch(Exception e){
            System.err.println("Error"+e);
        }
    }
    
    public int Login(String email,String contra) throws SQLException{
     
        int nivel=0;
        try{
        String sql="select nivel from usuarios where Email='"+email+"'and contra='"+contra+"'";
        PreparedStatement ps=conexion.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next()){
            nivel=rs.getInt(1);
        }
            
        }catch(SQLException e){
            System.out.println("error"+e);
        }
        
        return nivel;
    }      
}
