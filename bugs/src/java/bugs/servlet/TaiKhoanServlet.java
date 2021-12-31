/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.servlet;

import bugs.dao.TaiKhoanDAO;
import bugs.model.TaiKhoan;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class TaiKhoanServlet extends HttpServlet {

    TaiKhoanDAO taiKhoanDAO;
    
    @Override
    public void init() {
        //đọc các tham số từ web.xml
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        
        //Khởi tạo đối tượng kết nối tới CSDL (Data Access Object - DAO)
        taiKhoanDAO = new TaiKhoanDAO(jdbcURL, jdbcUsername, jdbcPassword);
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
        if (request.getCharacterEncoding() == null) {
                request.setCharacterEncoding("UTF-8");
            }
        //Đọc tham số từ client chuyển về server (request)
        String action = request.getParameter("action");
        try {
            if (action == null) {
                //xem danh sách tai khoan
                //listTaiKhoan(request, response);            
            }
            else {
                switch(action){
                case "register":
                    showRegister(request,response);
                    break;
                case "addAccount":
                    addAccount(request,response);
                    break;
                case "login":
                    //Hien thi Login
                    showLogin(request, response);
                    break;  
                case "checklogin":
                    //Kiem tra dang nhap
                    checkLogin(request, response);
                    break;
                default:
                    break;
                }
            }
        }
        catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void showLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {                  
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");                    
        
        dispatcher.forward(request, response);       
    }
    
    private void showRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {   

        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");                    
        
        dispatcher.forward(request, response); 
    }
    private void addAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String ttk = request.getParameter("txtGetUserName");
        String mk = request.getParameter("txtGetPassword"); 
        String loai = request.getParameter("txtLoai");

        TaiKhoan tk = new TaiKhoan(ttk,mk,loai);        
        //insert to DB
        taiKhoanDAO.insertTaiKhoan(tk);     
        showLogin(request, response);
    }
    
    private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {                  
        String userName = request.getParameter("txtUserName");
        String password = request.getParameter("txtPassword");       
        boolean isSuccess = taiKhoanDAO.checkLogin(userName, password);
        if(isSuccess){        
            TaiKhoan model = taiKhoanDAO.getTaiKhoan(userName);
            request.getSession().setAttribute("taiKhoan", model);   
            request.getSession().setAttribute("loginStatus", 1);
            response.sendRedirect("mathang");  
        }else{
            request.getSession().setAttribute("loginStatus","0");
            response.sendRedirect("account?action=login&status=0"); 
        }            
    }   
    
//    private void searchTaiKhoan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        String tk = request.getParameter("txtUserName");
//        TaiKhoan model = taiKhoanDAO.getTaiKhoan(tk);      
//        request.setAttribute("timTaiKhoan", model);     
//        
//        response.sendRedirect("mathang"); 
//        
//        //request.getSession().setAttribute("sessionName","Student session");
//        
//    }  
    

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
