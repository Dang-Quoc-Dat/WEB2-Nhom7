/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.model;

/**
 *
 * @author Dell
 */
public class NhapHang {
    private int id;
    private String maHang;
    private String ngayNhap;
    private int soLuong;
    private int donGia;
    
    public NhapHang(){}
    
    
    public NhapHang(int id, String mh, String nn, int sl, int dg){
        this.maHang = mh;
        this.ngayNhap = nn;
        this.soLuong = sl;
        this.donGia = dg;
        this.id = id;
    }
    public NhapHang(String mh, String nn, int sl, int dg){
        this.maHang = mh;
        this.ngayNhap = nn;
        this.soLuong = sl;
        this.donGia = dg;
    }
    
    public NhapHang(String mh,String nn, int sl){
        this.maHang = mh;
        this.ngayNhap = nn;
        this.soLuong = sl;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
     
    public void setMaHang(String maHang) {
        this.maHang = maHang;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public void setNgayNhap(String ngayNhap) {
        this.ngayNhap = ngayNhap;
    }

    public String getMaHang() {
        return maHang;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public int getDonGia() {
        return donGia;
    }

    public String getNgayNhap() {
        return ngayNhap;
    }
}
