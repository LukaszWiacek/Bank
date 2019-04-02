
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.table.DefaultTableModel;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author student
 */
public class Klient extends javax.swing.JFrame {
    String pesell;
    String[] rach=null;
    String[] idlokat=null;
    String[] idkart=null;
    /**
     * Creates new form Klient
     */
    public Klient(String pesel) throws ClassNotFoundException, SQLException {
        initComponents();
        DefaultTableModel model = null;
        pesell=pesel;
        Object obj[]=null;
        int r[]=null;
        int v=0;
        for (int n = 0; n < 4; n++) {

            Polaczenie conn = new Polaczenie();
            String nazwa[] = {"rachunek", "lokata", "karta","historia_transakcji"};
            ResultSet result=null;
            if(n!=2)
            result = conn.stmt.executeQuery("select * from " + nazwa[n]+" where pesel="+pesel+"");
              ResultSetMetaData meta=null;
            
            if (n == 0) {
                 meta = result.getMetaData();
                model = (DefaultTableModel) jTabRach.getModel();
                result.last();
                int z=result.getRow();
                rach = new String[z];
                DefaultTableModel mkarta=(DefaultTableModel)jTabKar.getModel();
                for(int a=0;a<z;a++){
                    result.absolute(a+1);
                    rach[a]=result.getObject(1).toString();
                }
                v = jTabRach.getColumnCount();
                r=new int[5];
                r[0]=2;
                r[1]=3;
                r[2]=4;
                r[3]=6;
                r[4]=7;
                
                
                obj = new Object[jTabRach.getColumnCount()];    
            }

            if (n == 1) {
                 meta = result.getMetaData();
                model = (DefaultTableModel) jTabLok.getModel();
                v = jTabLok.getColumnCount();
                r=new int[6];
                r[0]=2;
                r[1]=3;
                r[2]=4;
                r[3]=5;
                r[4]=6;
                r[5]=7;
                
                obj = new Object[jTabLok.getColumnCount()];
            }

            if (n == 2) {
                
                model = (DefaultTableModel) jTabKar.getModel();
                for(int x=0;x<rach.length;x++)
                {
                    result = conn.stmt.executeQuery("select * from " + nazwa[n]+" where idrachunku="+rach[x]+"");
                     meta = result.getMetaData();
                    result.last();
                    int count = result.getRow();
                    v = jTabKar.getColumnCount();
                r=new int[5];
                r[0]=3;
                r[1]=4;
                r[2]=5;
                r[3]=6;
                r[4]=7;
                
                obj = new Object[jTabKar.getColumnCount()];
                    for (int i = 1; i <= count; i++) {

                
                result.absolute(i);
                
                
                for (int u = 1; u <= v; u++) {
                    if(result.getObject(r[u-1])!=null&&(result.getObject(r[u-1]).toString().endsWith("00:00:00.0")))
                        obj[u-1]=result.getObject(r[u-1]).toString().substring(0, 10);
                    else
                    obj[u - 1] = result.getObject(r[u-1]);
                }

                model.addRow(obj);
                
            }
                }
            }
            if (n == 3) {
                 meta = result.getMetaData();
                model = (DefaultTableModel) jTabHis.getModel();
                v = jTabHis.getColumnCount();
                r=new int[6];
                r[0]=2;
                r[1]=3;
                r[2]=4;
                r[3]=5;
                r[4]=6;
                r[5]=7;
                
                obj = new Object[jTabHis.getColumnCount()];
            }
            if(n!=2)
            {
            result.last();
            int count = result.getRow();
            
            for (int i = 1; i <= count; i++) {

                
                result.absolute(i);
                
                for (int u = 1; u <= v; u++) {
                    if(result.getObject(r[u-1])!=null&&(result.getObject(r[u-1]).toString().endsWith("00:00:00.0")))
                        obj[u-1]=result.getObject(r[u-1]).toString().substring(0, 10);
                    else
                    obj[u - 1] = result.getObject(r[u-1]);
                }

                model.addRow(obj);
                
            }
            if(n==3)
                {
                    
                    for(int i=0;i<model.getRowCount();i++){
 
                    result=conn.stmt.executeQuery("select nrrachunku from rachunek where idrachunku="+model.getValueAt(i, 0)+"");
                    result.absolute(1);
                    model.setValueAt(result.getObject("nrrachunku"), i, 0);
                    
                    }
                }
            if(n==1)
            {
                idlokat=new String[model.getRowCount()];
                 for(int i=0;i<model.getRowCount();i++){
 
                    result=conn.stmt.executeQuery("select nrrachunku from rachunek where idrachunku="+model.getValueAt(i, 0)+"");
                    result.absolute(1);
                    model.setValueAt(result.getObject("nrrachunku"), i, 0);
                    result=conn.stmt.executeQuery("select idlokaty from lokata where pesel="+pesel+"");
                    
                    result.absolute(i+1);
                    idlokat[i]=result.getObject("idlokaty").toString();
                    }
            }
            
            }
            if(n==2)
            {
                //System.out.println(model.getRowCount());
                idkart=new String[model.getRowCount()];
                
                  for(int i=0;i<model.getRowCount();i++){  
                      result=conn.stmt.executeQuery("select idkarty from karta where pesel="+pesel+"");
                    result.absolute(i+1);
                     // System.out.println(result.getObject("idkarty").toString());
                    idkart[i]=result.getObject("idkarty").toString();
                     // System.out.println(idkart[i]);
                  }
            }
            result = conn.stmt.executeQuery("select * from wlasciciel where pesel="+pesel+"");
            result.first();
            jLabel1.setText("Witaj, "+result.getObject("imie")+" "+result.getObject("nazwisko"));
            conn.con.close();
            
            
            
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jTabbedPane1 = new javax.swing.JTabbedPane();
        jRachunek = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTabRach = new javax.swing.JTable();
        jTabRachDod = new javax.swing.JButton();
        jTabRachUsu = new javax.swing.JButton();
        jLokata = new javax.swing.JPanel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTabLok = new javax.swing.JTable();
        jTabLokDod = new javax.swing.JButton();
        jTabLokUsu = new javax.swing.JButton();
        jKarta = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        jTabKar = new javax.swing.JTable();
        jTabKarDod = new javax.swing.JButton();
        jTabKarUsu = new javax.swing.JButton();
        jHistoria = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        jTabHis = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        jButton3 = new javax.swing.JButton();
        jButton1 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jTabRach.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Nazwa", "Numer rachunku", "Środki", "Waluta", "Przyznany"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTabRach);

        jTabRachDod.setText("Dodaj rachunek");
        jTabRachDod.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabRachDod.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabRachDodActionPerformed(evt);
            }
        });

        jTabRachUsu.setText("Zrezygnuj z rachunku");
        jTabRachUsu.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabRachUsu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabRachUsuActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jRachunekLayout = new javax.swing.GroupLayout(jRachunek);
        jRachunek.setLayout(jRachunekLayout);
        jRachunekLayout.setHorizontalGroup(
            jRachunekLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jRachunekLayout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 522, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jRachunekLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jTabRachDod, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jTabRachUsu, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(0, 54, Short.MAX_VALUE))
        );
        jRachunekLayout.setVerticalGroup(
            jRachunekLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jRachunekLayout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(jRachunekLayout.createSequentialGroup()
                .addGap(17, 17, 17)
                .addComponent(jTabRachDod, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTabRachUsu, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(36, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Rachunki", jRachunek);

        jTabLok.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Na rachunku", "Nazwa lokaty", "Data założenia", "Data zapadalności", "Kwota", "Oprocentowanie"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTabLok);

        jTabLokDod.setText("Dodaj lokatę");
        jTabLokDod.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabLokDod.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabLokDodActionPerformed(evt);
            }
        });

        jTabLokUsu.setText("Zrezygnuj z lokaty");
        jTabLokUsu.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabLokUsu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabLokUsuActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jLokataLayout = new javax.swing.GroupLayout(jLokata);
        jLokata.setLayout(jLokataLayout);
        jLokataLayout.setHorizontalGroup(
            jLokataLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jLokataLayout.createSequentialGroup()
                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 522, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(23, 23, 23)
                .addGroup(jLokataLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jTabLokDod, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jTabLokUsu, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addGap(0, 43, Short.MAX_VALUE))
        );
        jLokataLayout.setVerticalGroup(
            jLokataLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
            .addGroup(jLokataLayout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addComponent(jTabLokDod, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTabLokUsu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(39, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Lokaty", jLokata);

        jTabKar.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Nazwa karty", "Data ważności", "Limit dzienny", "Limit miesięczny", "Waluta"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, true, true, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane3.setViewportView(jTabKar);

        jTabKarDod.setText("Dodaj kartę");
        jTabKarDod.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabKarDod.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabKarDodActionPerformed(evt);
            }
        });

        jTabKarUsu.setText("Zrezygnuj z karty");
        jTabKarUsu.setPreferredSize(new java.awt.Dimension(170, 80));
        jTabKarUsu.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTabKarUsuActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jKartaLayout = new javax.swing.GroupLayout(jKarta);
        jKarta.setLayout(jKartaLayout);
        jKartaLayout.setHorizontalGroup(
            jKartaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jKartaLayout.createSequentialGroup()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 522, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jKartaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jTabKarDod, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTabKarUsu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(0, 48, Short.MAX_VALUE))
        );
        jKartaLayout.setVerticalGroup(
            jKartaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jKartaLayout.createSequentialGroup()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(jKartaLayout.createSequentialGroup()
                .addGap(14, 14, 14)
                .addComponent(jTabKarDod, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jTabKarUsu, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(39, Short.MAX_VALUE))
        );

        jTabbedPane1.addTab("Karty", jKarta);

        jTabHis.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Rachunek zewnętrzny", "Typ operacji", "Data transakcji", "Tytułem", "Kwota", "Waluta"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane4.setViewportView(jTabHis);

        javax.swing.GroupLayout jHistoriaLayout = new javax.swing.GroupLayout(jHistoria);
        jHistoria.setLayout(jHistoriaLayout);
        jHistoriaLayout.setHorizontalGroup(
            jHistoriaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 758, Short.MAX_VALUE)
        );
        jHistoriaLayout.setVerticalGroup(
            jHistoriaLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 225, Short.MAX_VALUE)
        );

        jTabbedPane1.addTab("Historia", jHistoria);

        jLabel1.setFont(new java.awt.Font("Dialog", 1, 24)); // NOI18N
        jLabel1.setText("Witaj");

        jButton3.setText("Wyloguj się");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton1.setText("Wykonaj przelew");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1)
                .addContainerGap())
            .addGroup(layout.createSequentialGroup()
                .addGap(83, 83, 83)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 163, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(jButton3)
                    .addComponent(jButton1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jTabbedPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 251, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        new Start().setVisible(true);
        this.dispose();        // TODO add your handling code here:
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            new Przelew(rach,pesell).setVisible(true);
            this.dispose();// TODO add your handling code here:
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Klient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Klient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTabRachDodActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabRachDodActionPerformed
         new Rachunek(pesell).setVisible(true);
        this.dispose();  // TODO add your handling code here:
    }//GEN-LAST:event_jTabRachDodActionPerformed

    private void jTabRachUsuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabRachUsuActionPerformed
        DefaultTableModel m=(DefaultTableModel) jTabRach.getModel();
        new RachUs(pesell,m.getValueAt(jTabRach.getSelectedRow(), 1).toString()).setVisible(true);
        
        this.dispose();         // TODO add your handling code here:
    }//GEN-LAST:event_jTabRachUsuActionPerformed

    private void jTabLokDodActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabLokDodActionPerformed
       DefaultTableModel m=(DefaultTableModel) jTabRach.getModel();
       String[] rach=new String[m.getRowCount()];
       for(int i=0;i<m.getRowCount();i++)
           rach[i]=m.getValueAt(i, 1).toString();
        new Lokata(rach,pesell).setVisible(true);
        
        
        this.dispose(); // TODO add your handling code here:
    }//GEN-LAST:event_jTabLokDodActionPerformed

    private void jTabLokUsuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabLokUsuActionPerformed
        try {
            DefaultTableModel m=(DefaultTableModel) jTabLok.getModel();
            Polaczenie conn=new Polaczenie();
            ResultSet result = conn.stmt.executeQuery("select idrachunku from lokata where idlokaty="+idlokat[jTabLok.getSelectedRow()].toString()+"");
            result.first();
            String rachuu=result.getObject("idrachunku").toString();
            new LokUs(pesell,rachuu,idlokat[jTabLok.getSelectedRow()]).setVisible(true);
            
            this.dispose(); // TODO add your handling code here:
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Klient.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Klient.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jTabLokUsuActionPerformed

    private void jTabKarDodActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabKarDodActionPerformed
       DefaultTableModel m=(DefaultTableModel) jTabRach.getModel();
       String[] rach=new String[m.getRowCount()];
       for(int i=0;i<m.getRowCount();i++)
           rach[i]=m.getValueAt(i, 1).toString();
        new Karta(rach,pesell).setVisible(true);
        
        
        this.dispose(); 
        // TODO add your handling code here:
    }//GEN-LAST:event_jTabKarDodActionPerformed

    private void jTabKarUsuActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTabKarUsuActionPerformed
        DefaultTableModel m=(DefaultTableModel) jTabKar.getModel();
        
        new KarUs(pesell,idkart[jTabKar.getSelectedRow()]).setVisible(true);
        this.dispose();
    }//GEN-LAST:event_jTabKarUsuActionPerformed

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
            java.util.logging.Logger.getLogger(Klient.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Klient.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Klient.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Klient.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                
                
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton3;
    private javax.swing.JPanel jHistoria;
    private javax.swing.JPanel jKarta;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jLokata;
    private javax.swing.JPanel jRachunek;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTable jTabHis;
    private javax.swing.JTable jTabKar;
    private javax.swing.JButton jTabKarDod;
    private javax.swing.JButton jTabKarUsu;
    private javax.swing.JTable jTabLok;
    private javax.swing.JButton jTabLokDod;
    private javax.swing.JButton jTabLokUsu;
    private javax.swing.JTable jTabRach;
    private javax.swing.JButton jTabRachDod;
    private javax.swing.JButton jTabRachUsu;
    private javax.swing.JTabbedPane jTabbedPane1;
    // End of variables declaration//GEN-END:variables
}
