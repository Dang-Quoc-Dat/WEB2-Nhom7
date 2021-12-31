/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bugs.dao.MatHangDAO;
import bugs.model.MatHang;
import java.sql.SQLException;
import javax.servlet.annotation.MultipartConfig;
/**
 *
 * @author Dell
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class MatHangServlet extends HttpServlet {
    MatHangDAO matHangDAO;
    
    @Override
    public void init() {        
        //đọc các tham số từ web.xml
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        
        matHangDAO = new MatHangDAO(jdbcURL, jdbcUsername, jdbcPassword);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //hien thi co dau
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        //Kiem tra trang thai dang nhap
        Object obj = request.getSession().getAttribute("loginStatus");
        if(obj==null){
            response.sendRedirect("account?action=login");  
            return;
        }else{            
            int status = (int)obj;
            if(status==0){
                response.sendRedirect("account?action=login"); 
                return;
            }
        }        
        //get parameters
        String action = request.getParameter("action");
        try {
            if(action == null){
                //hien thi danh sach sinh vien
               listMatHang(request, response);
            }else{
                switch(action){
                    case "new":
                        //them moi mat hang
                        addMatHang(request, response);
                        break;
                    case "edit":
                        //sua mat hang
                        editMatHang(request, response);
                        break;
                    case "save":
                        saveMatHang(request,response);
                        break;
                    case "delete":
                        //xoa mat hang
                        deleteMatHang(request, response);
                        break;
                    case "search":
                        //tim mat hang
                        searchMatHang(request,response);
                        break;
                    default:
                        break;
                }
            }  
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void listMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //ĐỌc danh sách sinh viên từ Database
        List<MatHang> model = matHangDAO.listMatHang();      
        RequestDispatcher dispatcher1 = request.getRequestDispatcher("danhsachmathang.jsp");
        request.setAttribute("listMatHang", model);        
        
//        request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher1.forward(request, response);
       
    }   
    
    private void addMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String mah = request.getParameter("txtMaHang");
        String th = request.getParameter("txtTenHang");
        int gn = Integer.parseInt(request.getParameter("txtGiaNhap"));
        int gb = Integer.parseInt(request.getParameter("txtGiaBan"));
//        int sl = Integer.parseInt(request.getParameter("txtSoLuong"));  
        String loai = request.getParameter("txtLoai");

//        MatHang mh = new MatHang(mah,th,gn,gb,sl,loai);     
        MatHang mh = new MatHang(mah,th,gn,gb,loai); 
        //insert to DB
        matHangDAO.insertMatHang(mh);
        response.sendRedirect("mathang");  
    }
    
    private void editMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("id").trim();
        MatHang model = matHangDAO.getMatHang(id);
        request.setAttribute("suamathang", model);
        RequestDispatcher editDispatcher = request.getRequestDispatcher("suamathang.jsp");
        editDispatcher.forward(request, response);
    }
    
    private void deleteMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("id");
        //delete from DB
        matHangDAO.deleteMatHang(id);
        
        response.sendRedirect("mathang");       
    }   

    private void saveMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        MatHang mh = new MatHang();
        mh.setMaHang(request.getParameter("txtMaHang"));
        mh.setTenHang(request.getParameter("txtTenHang"));
        mh.setGiaNhap(Integer.parseInt(request.getParameter("txtGiaNhap")));
        mh.setGiaBan(Integer.parseInt(request.getParameter("txtGiaBan")));
        mh.setLoai(request.getParameter("txtLoai"));
        //update to DB
        matHangDAO.updateMatHang(mh);
        //Gọi servlet được mapping "mathang" trong web.xml
        response.sendRedirect("mathang");  
    }
    
    private void searchMatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtTimKiem");
        List<MatHang> model = matHangDAO.searchMatHang(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("danhsachtimkiem.jsp");
        request.setAttribute("searchMatHang", model);        
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);     
        
    }  
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
