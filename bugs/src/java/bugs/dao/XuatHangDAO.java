/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.dao;

import bugs.model.MatHang;
import java.sql.Connection;
import bugs.model.XuatHang;
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
public class XuatHangDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
    
    public XuatHangDAO(String jdbcURL, String jdbcUsername, String jdbcPassword){
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
    
    public boolean insertXuatHang(XuatHang xh) throws SQLException{
            openDatabase();
                   
        MatHang mh = new MatHang();
        String sqlSelect = "select * from mat_hang where ma_hang = ?";
        PreparedStatement stmtSelect = jdbcConnection.prepareStatement(sqlSelect);
        stmtSelect.setString(1, xh.getMaHang());
        ResultSet rs = stmtSelect.executeQuery();
        while (rs.next()) {
            mh.setMaHang(rs.getString("ma_hang"));
            mh.setTenHang(rs.getString("ten_hang"));
            mh.setGiaNhap(rs.getInt("gia_nhap"));
            mh.setGiaBan(rs.getInt("gia_ban"));
            mh.setSoLuong(rs.getInt("so_luong"));
            mh.setLoai(rs.getString("loai"));
        }

        //lay gia tri gia nhap va so luong hien tai
        int giaBan = (int)mh.getGiaBan();
        int slXuatHang = (int)xh.getSoLuong();
        int b;
        b = giaBan * slXuatHang;
            //Execute            
            String sqlInsert = "Insert into xuat_hang(ma_hang,ngay_xuat,so_luong,trang_thai) Values(?,?,?,?);"
                + " update mat_hang set so_luong = so_luong - ?  Where ma_hang=?;"
                + "update xuat_hang set don_gia = ? ORDER BY id DESC LIMIT 1 ";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlInsert);                                
            stmt.setString(1, xh.getMaHang());   
            stmt.setString(2, xh.getNgayXuat());
            stmt.setInt(3, xh.getSoLuong());
            stmt.setString(4, xh.getTrangThai());
            stmt.setInt(5, xh.getSoLuong());
            stmt.setString(6, xh.getMaHang());
            stmt.setInt(7, b);
            int rowInserted = stmt.executeUpdate(); 
            
            closeDatabase();
            
            return rowInserted>0;
    }
    
    public boolean deleteXuatHang(int id) throws SQLException {        
            openDatabase();
            
            //Execute            
            String sqlDelete = "update mat_hang inner join xuat_hang on xuat_hang.ma_hang = mat_hang.ma_hang" +
                                " SET mat_hang.so_luong = mat_hang.so_luong + (SELECT so_luong from xuat_hang where id = ?);" +
                                " Delete From xuat_hang Where id = ?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlDelete);                                
            stmt.setInt(1, id);
            stmt.setInt(2, id);
            int rowDeleted = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowDeleted>1;
    }
    
    public boolean updateXuatHang(XuatHang xh) throws SQLException {        
            openDatabase();
                      
            String sqlUpdate = "update xuat_hang set trang_thai = ? Where id=?";
            PreparedStatement stmt = jdbcConnection.prepareStatement(sqlUpdate);                                            
            stmt.setString(1, xh.getTrangThai());
            stmt.setInt(2, xh.getId()); 
            int rowUpdated = stmt.executeUpdate();            
            stmt.close();
            
            closeDatabase();
            
            return rowUpdated>1;        
    }
    
    public XuatHang getXuatHang(int id) throws SQLException{
        XuatHang xh = new XuatHang();
        
        openDatabase();
        
        String sqlSelect = "select * From xuat_hang Where id=?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            xh.setId(id);
            xh.setMaHang(rs.getString("ma_hang"));
            xh.setNgayXuat(rs.getString("ngay_xuat"));
            xh.setSoLuong(rs.getInt("so_luong"));
            xh.setTrangThai(rs.getString("trang_thai"));
        }
        stmt.close();
        
        closeDatabase();
        return xh;
    }
    
    public List<XuatHang> listXuatHang() throws SQLException{
        List<XuatHang> listXuatHang = new ArrayList<>();

        openDatabase();
        
        String sqlSelect = "select * from xuat_hang";
        Statement stmt = jdbcConnection.createStatement();
        ResultSet rs = stmt.executeQuery(sqlSelect);
        while(rs.next()){
            XuatHang xh = new XuatHang();
            xh.setId(rs.getInt("id"));
            xh.setMaHang(rs.getString("ma_hang"));
            xh.setNgayXuat(rs.getString("ngay_xuat"));
            xh.setSoLuong(rs.getInt("so_luong"));
            xh.setDonGia(rs.getInt("don_gia"));
            xh.setTrangThai(rs.getString("trang_thai"));
            listXuatHang.add(xh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listXuatHang;
    }
    
    public List<XuatHang> searchXuatHang(String id) throws SQLException{
        List<XuatHang> listXuatHang = new ArrayList<>();
        openDatabase();
        
        String sqlSelect = "select * from xuat_hang where id like ? or ma_hang like ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, "%"+id+"%");
        stmt.setString(2, "%"+id+"%");
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            XuatHang xh = new XuatHang();
            xh.setId(rs.getInt("id"));
            xh.setMaHang(rs.getString("ma_hang"));
            xh.setNgayXuat(rs.getString("ngay_xuat"));
            xh.setSoLuong(rs.getInt("so_luong"));
            xh.setDonGia(rs.getInt("don_gia"));
            xh.setTrangThai(rs.getString("trang_thai"));
            listXuatHang.add(xh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listXuatHang;
    }
    
    public List<XuatHang> searchXuatHangNgay(String id) throws SQLException{
        List<XuatHang> listXuatHang = new ArrayList<>();
        openDatabase();
        
        String sqlSelect = "select * from xuat_hang where ngay_xuat = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            XuatHang xh = new XuatHang();
            xh.setId(rs.getInt("id"));
            xh.setMaHang(rs.getString("ma_hang"));
            xh.setNgayXuat(rs.getString("ngay_xuat"));
            xh.setSoLuong(rs.getInt("so_luong"));
            xh.setDonGia(rs.getInt("don_gia"));
            xh.setTrangThai(rs.getString("trang_thai"));
            listXuatHang.add(xh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listXuatHang;
    }
    
    public List<XuatHang> searchXuatHangTrangThai(String id) throws SQLException{
        List<XuatHang> listXuatHang = new ArrayList<>();
        openDatabase();
        
        String sqlSelect = "select * from xuat_hang where trang_thai = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            XuatHang xh = new XuatHang();
            xh.setId(rs.getInt("id"));
            xh.setMaHang(rs.getString("ma_hang"));
            xh.setNgayXuat(rs.getString("ngay_xuat"));
            xh.setSoLuong(rs.getInt("so_luong"));
            xh.setDonGia(rs.getInt("don_gia"));
            xh.setTrangThai(rs.getString("trang_thai"));
            listXuatHang.add(xh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listXuatHang;
    }
}
