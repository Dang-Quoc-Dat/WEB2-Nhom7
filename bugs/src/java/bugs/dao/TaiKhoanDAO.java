/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.dao;

import bugs.model.TaiKhoan;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class TaiKhoanDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
    
    public TaiKhoanDAO(String jdbcURL, String jdbcUsername, String jdbcPassword){
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }
    
    private void openDatabase() throws SQLException{
        if(jdbcConnection==null || jdbcConnection.isClosed()){
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }
    
    private void closeDatabase() throws SQLException{
        if(jdbcConnection!=null && !jdbcConnection.isClosed()){
            jdbcConnection.close();
        }       
    }
    
    public boolean insertTaiKhoan(TaiKhoan acc) throws SQLException{
            openDatabase();
                                    
            String sqlInsert = "Insert into tai_khoan(ten_tai_khoan,mat_khau,loai_tai_khoan) Values(?,?,?)";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlInsert);                                
            stmt.setString(1, acc.getTenTaiKhoan());
            stmt.setString(2, acc.getMatKhau());   
            stmt.setString(3, acc.getLoaiTaiKhoan());
            int rowInserted = stmt.executeUpdate();
            
            closeDatabase();
            
            return rowInserted>0;
    }
    
    public boolean deleteTaiKhoan(int id) throws SQLException {        
            openDatabase();
                      
            String sqlDelete = "Delete From tai_khoan Where id = ?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlDelete);                                
            stmt.setInt(1, id);
            int rowDeleted = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowDeleted>1;
    }
    
    public boolean changePassword(TaiKhoan acc) throws SQLException {        
            openDatabase();
            
            //Execute add SinhVien            
            String sqlUpdate = "Update tai_khoan set mat_khau=? Where id=?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlUpdate);                                            
            stmt.setString(1, acc.getMatKhau());            
            stmt.setInt(2, acc.getId());            
            int rowUpdated = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowUpdated>1;        
    }
    
    public boolean checkLogin(String userName, String password) throws SQLException{
            openDatabase();
            
            //Kiem tra tentaikhoan va matkhau
            String sqlCheck = "Select count(id) as SoLuongBanGhi From tai_khoan Where ten_tai_khoan=? AND mat_khau=?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlCheck);                                            
            stmt.setString(1, userName);            
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if(rs.next()){
                int count = rs.getInt("SoLuongBanGhi");
                return count>0;
            }
            
            closeDatabase();
            
            return false;
    }
    
    
     public TaiKhoan getTaiKhoan(String username) throws SQLException{
        TaiKhoan acc = new TaiKhoan();
        
        openDatabase();
        
        String sqlSelect = "Select * From tai_khoan Where ten_tai_khoan = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
           acc = new TaiKhoan(rs.getInt("id"), rs.getString("ten_tai_khoan"), rs.getString("mat_khau"),rs.getString("loai_tai_khoan"));
        }
        
        closeDatabase();
        return acc;
    }
     public TaiKhoan searchTaiKhoan(String username) throws SQLException{
        TaiKhoan acc = new TaiKhoan();

        openDatabase();
        
        String sqlSelect = "select * from tai_khoan where ten_tai_khoan=?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, username);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            acc.setId(rs.getInt("id"));
            acc.setTenTaiKhoan(rs.getString("ten_tai_khoan"));
            acc.setMatKhau(rs.getString("mat_khau"));
        }            
        stmt.close();
        
        closeDatabase();
        
        return acc;
    }
        
    //Lấy danh sách tất cả tai khoan
    public List<TaiKhoan> listTaiKhoan() throws SQLException{
        List<TaiKhoan> listTaiKhoan = new ArrayList<>();

        openDatabase();
        
        String sqlSelect = "Select * from tai_khoan";
        Statement stmt = jdbcConnection.createStatement();
        ResultSet rs = stmt.executeQuery(sqlSelect);
        while(rs.next()){
            TaiKhoan acc = new TaiKhoan(
                    rs.getString("ten_tai_khoan"),
                    rs.getString("mat_khau")
                );
            listTaiKhoan.add(acc);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listTaiKhoan;
    }
}
