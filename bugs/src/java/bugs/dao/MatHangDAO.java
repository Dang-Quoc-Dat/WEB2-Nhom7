/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import bugs.model.MatHang;

/**
 *
 * @author Dell
 */
public class MatHangDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
    
    public MatHangDAO(String jdbcURL, String jdbcUsername, String jdbcPassword){
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
    
    public boolean insertMatHang(MatHang mh) throws SQLException{
            openDatabase();
                         
            String sqlInsert = "Insert into mat_hang(ma_hang,ten_hang,gia_nhap,gia_ban,loai) Values(?,?,?,?,?)";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlInsert);                                
            stmt.setString(1, mh.getMaHang());
            stmt.setString(2, mh.getTenHang());         
            stmt.setInt(3, mh.getGiaNhap());
            stmt.setInt(4, mh.getGiaBan());
//            stmt.setInt(5, mh.getSoLuong());  
            stmt.setString(5, mh.getLoai());  
            int rowInserted = stmt.executeUpdate();
            
            closeDatabase();
            
            return rowInserted>0;
    }
    
    public boolean deleteMatHang(String maHang) throws SQLException {        
            openDatabase();
            
            //Execute add SinhVien            
            String sqlDelete = "Delete From mat_hang Where ma_hang = ?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlDelete);                                
            stmt.setString(1, maHang);
            int rowDeleted = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowDeleted>1;
    }
    
    public boolean updateMatHang(MatHang mh) throws SQLException {        
            openDatabase();
                      
            String sqlUpdate = "update mat_hang set ten_hang=?,gia_nhap=?,gia_ban=?,loai=? Where ma_hang=?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlUpdate);                                            
            stmt.setString(1, mh.getTenHang());
            stmt.setInt(2, mh.getGiaNhap());         
            stmt.setInt(3, mh.getGiaBan());
            stmt.setString(4, mh.getLoai());  
            stmt.setString(5, mh.getMaHang());  
            int rowUpdated = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowUpdated>1;        
    }
    
    public MatHang getMatHang(String mahang) throws SQLException{
        MatHang mh = new MatHang();
        
        openDatabase();
        
        String sqlSelect = "select * From mat_hang Where ma_hang=?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, mahang);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            mh.setMaHang(mahang);
            mh.setTenHang(rs.getString("ten_hang"));
            mh.setGiaNhap(rs.getInt("gia_nhap"));
            mh.setGiaBan(rs.getInt("gia_ban"));
            mh.setSoLuong(rs.getInt("so_luong"));
            mh.setLoai(rs.getString("loai"));
        }
        stmt.close();
        
        closeDatabase();
        return mh;
    }
    
    public List<MatHang> listMatHang() throws SQLException{
        List<MatHang> listMatHang = new ArrayList<>();

        openDatabase();
        
        String sqlSelect = "select * from mat_hang";
        Statement stmt = jdbcConnection.createStatement();
        ResultSet rs = stmt.executeQuery(sqlSelect);
        while(rs.next()){
            MatHang mh = new MatHang();
            mh.setMaHang(rs.getString("ma_hang"));
            mh.setTenHang(rs.getString("ten_hang"));
            mh.setGiaNhap(rs.getInt("gia_nhap"));
            mh.setGiaBan(rs.getInt("gia_ban"));
            mh.setSoLuong(rs.getInt("so_luong"));
            mh.setLoai(rs.getString("loai"));
            listMatHang.add(mh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listMatHang;
    }
    
    public List<MatHang> searchMatHang(String matHang) throws SQLException{
        List<MatHang> listMatHang = new ArrayList<>();

        openDatabase();
        
        String sqlSelect = "select * from mat_hang where ma_hang like ? or ten_hang like ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, "%"+matHang+"%");
        stmt.setString(2, "%"+matHang+"%");
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            MatHang mh = new MatHang();
            mh.setMaHang(rs.getString("ma_hang"));
            mh.setTenHang(rs.getString("ten_hang"));
            mh.setGiaNhap(rs.getInt("gia_nhap"));
            mh.setGiaBan(rs.getInt("gia_ban"));
            mh.setSoLuong(rs.getInt("so_luong"));
            mh.setLoai(rs.getString("loai"));
            listMatHang.add(mh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listMatHang;
    }
}
