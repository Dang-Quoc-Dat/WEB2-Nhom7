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
public class TaiKhoan {
    private int id;
    private String tenTaiKhoan;
    private String matKhau;
    private String loaiTaiKhoan;
    
    public TaiKhoan(){};
    
    public TaiKhoan(String userName, String password){
        this.tenTaiKhoan = userName;
        this.matKhau = password;
    }
    
    public TaiKhoan(String userName, String password,String loai){
        this.loaiTaiKhoan=loai;
        this.tenTaiKhoan = userName;
        this.matKhau = password;
    }
    
    public TaiKhoan(int id, String userName, String password,String loaiTaiKhoan){
        this.id=id;
        this.tenTaiKhoan = userName;
        this.matKhau = password;
        this.loaiTaiKhoan = loaiTaiKhoan;
    }

    public void setTenTaiKhoan(String tenTaiKhoan) {
        this.tenTaiKhoan = tenTaiKhoan;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    
    public void setLoaiTaiKhoan(String loaiTaiKhoan) {
        this.loaiTaiKhoan = loaiTaiKhoan;
    }
    
    public void setId(int ID) {
        this.id = ID;
    }

    public int getId() {
        return id;
    }

    public String getTenTaiKhoan() {
        return tenTaiKhoan;
    }

    public String getMatKhau() {
        return matKhau;
    } 
    
    public String getLoaiTaiKhoan() {
        return loaiTaiKhoan;
    }
}
