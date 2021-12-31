/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.servlet;

import bugs.dao.NhapHangDAO;
import bugs.model.NhapHang;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
public class NhapHangServlet extends HttpServlet {

    NhapHangDAO nhapHangDAO;
    
    @Override
    public void init() {        
        //đọc các tham số từ web.xml
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        
        nhapHangDAO = new NhapHangDAO(jdbcURL, jdbcUsername, jdbcPassword);
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
               listNhapHang(request, response);
            }else{
                switch(action){
                    case "newNhapHang":
                        //them moi mat hang
                        addNhapHang(request, response);
                        break;
                    case "editNhapHang":
                        //sua mat hang
                        editNhapHang(request, response);
                        break;
                    case "saveNhapHang":
                        saveNhapHang(request,response);
                        break;
                    case "deleteNhapHang":
                        //xoa mat hang
                        deleteNhapHang(request, response);
                        break;
                    case "searchNhapHang":
                        //tim mat hang
                        searchNhapHang(request,response);
                        break;
                    case "searchNhapHangNgay":
                        //tim mat hang
                        searchNhapHangNgay(request,response);
                        break;
                    case "searchNhapHangLoai":
                        //tim mat hang
                        searchNhapHangLoai(request,response);
                        break;
                    default:
                        break;
                }
            }  
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void listNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //ĐỌc danh sách sinh viên từ Database
        List<NhapHang> model = nhapHangDAO.listNhapHang();      
        RequestDispatcher dispatcher = request.getRequestDispatcher("giaodich.jsp");
        request.setAttribute("listNhapHang", model);        
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);
       
    }   
    
    private void addNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String mh = request.getParameter("txtMaHang");
        String nh = request.getParameter("txtNgayNhap"); 
        String[] arr = nh.split("/"); 
        for(int i = 0 ;i<arr.length;i++){ 
            nh = arr[arr.length-1-i];
        }
        int sl = Integer.parseInt(request.getParameter("txtSoLuong"));
//        int sl = Integer.parseInt(request.getParameter("txtSoLuong")); 

//        MatHang mh = new MatHang(mah,th,gn,gb,sl,loai);     
        NhapHang nhapHang = new NhapHang(mh,nh,sl); 
        //insert to DB
        nhapHangDAO.insertNhapHang(nhapHang);
        response.sendRedirect("nhaphang");  
    }
    
    private void editNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id").trim());
        
        NhapHang model = nhapHangDAO.getNhapHang(id);
        request.setAttribute("suanhaphang", model);
        RequestDispatcher editDispatcher = request.getRequestDispatcher("suanhaphang.jsp");
        editDispatcher.forward(request, response);
    }
    
    private void deleteNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        //delete from DB
        nhapHangDAO.deleteNhapHang(id);
        
        response.sendRedirect("nhaphang");       
    }   

    private void saveNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        NhapHang nh = new NhapHang();
        nh.setId(Integer.parseInt(request.getParameter("txtId")));
        nh.setMaHang(request.getParameter("txtMaHang"));
        nh.setNgayNhap(request.getParameter("txtNgayNhap"));
        nh.setSoLuong(Integer.parseInt(request.getParameter("txtSoLuong")));
        //update to DB
        nhapHangDAO.updateNhapHang(nh);
        //Gọi servlet được mapping "nhaphang" trong web.xml
        response.sendRedirect("nhaphang");  
    }
    
    private void searchNhapHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String mah = request.getParameter("txtTimKiem");
        List<NhapHang> model = nhapHangDAO.searchNhapHang(mah);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemnhaphang.jsp");
        request.setAttribute("searchNhapHang", model);        
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);     
        
    } 
    
    private void searchNhapHangNgay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtNgayNhap");
        String[] arr = id.split("/"); 
        for(int i = 0 ;i<arr.length;i++){ 
            id = arr[arr.length-1-i];
        }
        List<NhapHang> model = nhapHangDAO.searchNhapHangNgay(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemnhapngay.jsp");
        request.setAttribute("searchNhapHangNgay", model);     
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);     
        
    } 
    
    private void searchNhapHangLoai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtLoai");
        List<NhapHang> model = nhapHangDAO.searchNhapHangLoai(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemnhaploai.jsp");
        request.setAttribute("searchNhapHangLoai", model);     
        
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
