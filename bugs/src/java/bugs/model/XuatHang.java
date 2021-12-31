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
public class XuatHang {
    private int id;
    private String maHang;
    private String ngayXuat;
    private int soLuong;
    private int donGia;
    private String trangThai;
    
    public XuatHang(){}
    
     public XuatHang(int id,String mh, String nx, int sl, int dg, String th){
        this.id = id;
        this.maHang = mh;
        this.ngayXuat = nx;
        this.soLuong = sl;
        this.donGia = dg;
        this.trangThai = th;
    }
     
    public XuatHang(int id,String mh, String nx, int sl, String th){
        this.id = id;
        this.maHang = mh;
        this.ngayXuat = nx;
        this.soLuong = sl;
        this.trangThai = th;
    }
    
    public XuatHang(int id,String mh, String nx, int sl){
        this.id = id;
        this.maHang = mh;
        this.ngayXuat = nx;
        this.soLuong = sl;
    }
    public XuatHang(String mh, String nx, int sl){
        this.maHang = mh;
        this.ngayXuat = nx;
        this.soLuong = sl;
    }
    
    public XuatHang(String mh, String nx,int sl, String th){
        this.maHang = mh;
        this.ngayXuat = nx;
        this.trangThai = th;
        this.soLuong = sl;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getMaHang() {
        return maHang;
    }

    public String getNgayXuat() {
        return ngayXuat;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public int getDonGia() {
        return donGia;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setMaHang(String maHang) {
        this.maHang = maHang;
    }

    public void setNgayXuat(String ngayXuat) {
        this.ngayXuat = ngayXuat;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
    
}

