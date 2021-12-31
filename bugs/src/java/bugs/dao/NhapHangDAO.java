/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.dao;

import bugs.model.MatHang;
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
import bugs.model.NhapHang;

/**
 *
 * @author Dell
 */
public class NhapHangDAO {

    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public NhapHangDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    private void openDatabase() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    private void closeDatabase() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    public boolean insertNhapHang(NhapHang nh) throws SQLException {
        openDatabase();
        //Execute add SinhVien    
        //goi danh sach mat hang

        MatHang mh = new MatHang();
        String sqlSelect = "select * from mat_hang where ma_hang = ?";
        PreparedStatement stmtSelect = jdbcConnection.prepareStatement(sqlSelect);
        stmtSelect.setString(1, nh.getMaHang());
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
        int giaNhap = (int)mh.getGiaNhap();
        int slNhapHang = (int)nh.getSoLuong();
        int b;
        b = giaNhap * slNhapHang;
        
        String sqlInsert = "Insert into nhap_hang(ma_hang,ngay_nhap,so_luong) Values(?,?,?);"
                + " update mat_hang set so_luong = so_luong + ?  Where ma_hang=?;"
                + " update nhap_hang set don_gia = ? ORDER BY id DESC LIMIT 1 ";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlInsert);
        stmt.setString(1, nh.getMaHang());
        stmt.setString(2, nh.getNgayNhap());
        stmt.setInt(3, nh.getSoLuong());
        stmt.setInt(4, nh.getSoLuong());
        stmt.setString(5, nh.getMaHang());
        stmt.setInt(6, b);
        int rowInserted = stmt.executeUpdate();


        closeDatabase();

        return rowInserted > 0;
    }

    public boolean deleteNhapHang(int id) throws SQLException {
        openDatabase();

        //Execute add SinhVien            
        String sqlDelete = "update mat_hang inner join nhap_hang on nhap_hang.ma_hang = mat_hang.ma_hang" +
                               " SET mat_hang.so_luong = mat_hang.so_luong - (select so_luong from nhap_hang where id = ?" +
                                " Delete From nhap_hang Where id = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlDelete);
        stmt.setInt(1, id);
        stmt.setInt(2, id);
        int rowDeleted = stmt.executeUpdate();
        stmt.close();

        closeDatabase();

        return rowDeleted > 1;
    }

    public boolean updateNhapHang(NhapHang nh) throws SQLException {
        openDatabase();

        String sqlUpdate = "update nhap_hang set so_luong=?,ngay_nhap=? Where id=?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlUpdate);
        stmt.setInt(1, nh.getSoLuong());
        stmt.setString(2, nh.getNgayNhap());
        stmt.setInt(3, nh.getId());
        int rowUpdated = stmt.executeUpdate();
        stmt.close();

        closeDatabase();

        return rowUpdated > 1;
    }

    public NhapHang getNhapHang(int id) throws SQLException {
        NhapHang nh = new NhapHang();

        openDatabase();

        String sqlSelect = "select * From nhap_hang Where id=?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            nh.setId(id);
            nh.setMaHang(rs.getString("ma_hang"));
            nh.setNgayNhap(rs.getString("ngay_nhap"));
            nh.setSoLuong(rs.getInt("so_luong"));
            nh.setDonGia(rs.getInt("don_gia"));
        }
        stmt.close();

        closeDatabase();
        return nh;
    }

    public List<NhapHang> listNhapHang() throws SQLException {
        List<NhapHang> listNhapHang = new ArrayList<>();

        openDatabase();

        String sqlSelect = "select * from nhap_hang";
        Statement stmt = jdbcConnection.createStatement();
        ResultSet rs = stmt.executeQuery(sqlSelect);
        while (rs.next()) {
            NhapHang nh = new NhapHang();
            nh.setId(rs.getInt("id"));
            nh.setMaHang(rs.getString("ma_hang"));
            nh.setNgayNhap(rs.getString("ngay_nhap"));
            nh.setSoLuong(rs.getInt("so_luong"));
            nh.setDonGia(rs.getInt("don_gia"));
            listNhapHang.add(nh);
        }
        stmt.close();

        closeDatabase();

        return listNhapHang;
    }

    public List<NhapHang> searchNhapHang(String id) throws SQLException {
        List<NhapHang> listNhapHang = new ArrayList<>();

        openDatabase();

        String sqlSelect = "select * from nhap_hang where ma_hang like ? or id like ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, "%" + id + "%");
        stmt.setString(2, "%" + id + "%");
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            NhapHang nh = new NhapHang();
            nh.setId(rs.getInt("id"));
            nh.setMaHang(rs.getString("ma_hang"));
            nh.setNgayNhap(rs.getString("ngay_nhap"));
            nh.setSoLuong(rs.getInt("so_luong"));
            nh.setDonGia(rs.getInt("don_gia"));
            listNhapHang.add(nh);
        }
        stmt.close();

        closeDatabase();

        return listNhapHang;
    }
    
    public List<NhapHang> searchNhapHangNgay(String id) throws SQLException{
        List<NhapHang> listNhapHang = new ArrayList<>();
        openDatabase();
        
        String sqlSelect = "select * from nhap_hang where ngay_nhap = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            NhapHang nh = new NhapHang();
            nh.setId(rs.getInt("id"));
            nh.setMaHang(rs.getString("ma_hang"));
            nh.setNgayNhap(rs.getString("ngay_nhap"));
            nh.setSoLuong(rs.getInt("so_luong"));
            nh.setDonGia(rs.getInt("don_gia"));
            listNhapHang.add(nh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listNhapHang;
    }
    
    public List<NhapHang> searchNhapHangLoai(String id) throws SQLException{
        List<NhapHang> listNhapHang = new ArrayList<>();
        openDatabase();
        
        String sqlSelect = "select * from nhap_hang inner join mat_hang on mat_hang.ma_hang = nhap_hang.ma_hang where mat_hang.loai = ?";
        PreparedStatement stmt = jdbcConnection.prepareStatement(sqlSelect);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        while(rs.next()){
            NhapHang nh = new NhapHang();
            nh.setId(rs.getInt("id"));
            nh.setMaHang(rs.getString("ma_hang"));
            nh.setNgayNhap(rs.getString("ngay_nhap"));
            nh.setSoLuong(rs.getInt("so_luong"));
            nh.setDonGia(rs.getInt("don_gia"));
            listNhapHang.add(nh);
        }            
        stmt.close();
        
        closeDatabase();
        
        return listNhapHang;
    }
}
