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
public class MatHang {
    private String maHang;
    private String tenHang;
    private int giaNhap;
    private int giaBan;
    private int soLuong;
    private String loai;
    
    public MatHang(){}
    public MatHang(String mh, String th, int gn, int gb, int sl, String loai){
        this.maHang = mh;
        this.tenHang = th;
        this.giaNhap = gn;
        this.giaBan = gb;
        this.soLuong = sl;
        this.loai = loai;
    }
    public MatHang(String mh, String th, int gn, int gb, String l){
        this.maHang = mh;
        this.tenHang = th;
        this.giaNhap = gn;
        this.giaBan = gb;
        this.loai = l;
    }

    public String getMaHang() {
        return maHang;
    }

    public String getTenHang() {
        return tenHang;
    }

    public int getGiaNhap() {
        return giaNhap;
    }

    public int getGiaBan() {
        return giaBan;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public String getLoai() {
        return loai;
    }

    public void setMaHang(String maHang) {
        this.maHang = maHang;
    }

    public void setTenHang(String tenHang) {
        this.tenHang = tenHang;
    }

    public void setGiaNhap(int giaNhap) {
        this.giaNhap = giaNhap;
    }

    public void setGiaBan(int giaBan) {
        this.giaBan = giaBan;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public void setLoai(String loai) {
        this.loai = loai;
    }
    
    
}
