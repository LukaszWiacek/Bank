
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author student
 */
public class Polaczenie {
    
    Statement stmt;
    String tabela;
    Connection con;
    Polaczenie() throws ClassNotFoundException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@localhost:1521:kosmos";
            String username = "student";
            String password = "student";
               
             con = DriverManager.getConnection(url, username, password);

            stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        } catch (SQLException e) {
            throw new IllegalStateException("Nie można połączyć", e);
        }
    }
    String DodajWlasciciela(String pesel,String imie,String nazw, String adr,String tel, String login,String haslo){
        
        
        try {
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.ADD_WLASCICEL (?, ?,?,?,?,?,?)}");
            cstmt.setString (1, pesel);
            cstmt.setString (2, imie);
            cstmt.setString (3, nazw);
            cstmt.setString (4, adr);
            cstmt.setString (5, tel);
            cstmt.setString (6, login);
            cstmt.setString (7, haslo);
            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            return "Błąd :(";
        }
        
        return "Możesz się teraz zalogować";
    }
    String Loguj(String login, String haslo) throws SQLException{
        ResultSet result;
        try {
             result = stmt.executeQuery("select * from wlasciciel where login='"+login+"' and haslo='"+haslo+"'");
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            return "0";
        }
        result.first();
        //System.out.println(result.getObject("pesel"));
        return result.getObject("pesel").toString();
    }
    void Przelew(String r1,String r2, String kwota,String tyt){
        try {
            /*ResultSet result= stmt.executeQuery("select idrachunku from rachunek where nrrachunku'"+r2+"'");
            result.last();
            r2=result.getObject("nrrachunku").toString();*/
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.PRZELEW (?, ?,?,?,?)}");
            cstmt.setString (1, r1);
            cstmt.setString (2, r2);
            cstmt.setString (3, kwota);
            cstmt.setString (4, tyt);
            cstmt.setString (5, tyt);
            
            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
    void DodajRach(String naz,String nr, String sr, String pes,String wal)
    {
        try {
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.NOWYRACHUNEK (?, ?,?,?,?)}");
            cstmt.setString (1, naz);
            cstmt.setString (2, nr);
            cstmt.setString (3, sr);
            cstmt.setString (4, pes);
            cstmt.setString (5, wal);
            
            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            
        }
    }
    void UsunRach(String nr) throws SQLException {
       //ResultSet result = stmt.executeQuery("select * from "+tabela);
        String query = "DELETE FROM rachunek WHERE nrrachunku='" +nr+ "'";
        stmt.executeUpdate(query);

    }
    void DodajLokate(String id,String naz,String kw,String tyt)
    {
        try {
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.NOWALOKATA (?, ?,?,?)}");
            cstmt.setString (1, id);
            cstmt.setString (2, naz);
            cstmt.setString (3, kw);
            cstmt.setString (4, tyt);
            
            
            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
    }
    void UsunLokate(String idl,String idr,String tyt)
    {
        try {
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.ZERWIJ_LOKATE (?, ?,?)}");
            cstmt.setString (1, idl);
            cstmt.setString (2, idr);
            cstmt.setString (3, tyt);
            
            
            
            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
    }
    void DodajKarte(String idr,String nazw)
    {
        try {
            CallableStatement cstmt = con.prepareCall ("{ call STUDENT.NOWAKARTA (?, ?)}");
            cstmt.setString (1, idr);
            cstmt.setString (2, nazw);

            cstmt.execute ();
        } catch (SQLException ex) {
            Logger.getLogger(Polaczenie.class.getName()).log(Level.SEVERE, null, ex);
            
        }
        
    }
    void UsunKarte(String nr) throws SQLException {
       //ResultSet result = stmt.executeQuery("select * from "+tabela);
        String query = "DELETE FROM karta WHERE idkarty='" +nr+ "'";
        stmt.executeUpdate(query);

    }
}
