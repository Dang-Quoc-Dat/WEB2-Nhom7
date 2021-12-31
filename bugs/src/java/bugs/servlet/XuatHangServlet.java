/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bugs.servlet;

import bugs.dao.XuatHangDAO;
import bugs.model.XuatHang;
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
public class XuatHangServlet extends HttpServlet {

    XuatHangDAO xuatHangDAO;
    
    @Override
    public void init() {        
        //đọc các tham số từ web.xml
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
        
        xuatHangDAO = new XuatHangDAO(jdbcURL, jdbcUsername, jdbcPassword);
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
               listXuatHang(request, response);
            }else{
                switch(action){
                    case "newXuatHang":
                        //them moi mat hang
                        addXuatHang(request, response);
                        break;
                    case "editTrangThai":
                        //sua mat hang
                        editTrangThai(request, response);
                        break;
                    case "saveTrangThai":
                        saveTrangThai(request,response);
                        break;
                    case "deleteXuatHang":
                        //xoa mat hang
                        deleteXuatHang(request, response);
                        break;
                    case "searchXuatHang":
                        //tim mat hang
                        searchXuatHang(request,response);
                        break;
                    case "searchXuatHangNgay":
                        //tim mat hang
                        searchXuatHangNgay(request,response);
                        break;
                    case "searchXuatHangTrangThai":
                        //tim mat hang
                        searchXuatHangTrangThai(request,response);
                        break;
                    default:
                        break;
                }
            }  
        }catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    private void listXuatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //ĐỌc danh sách sinh viên từ Database
        List<XuatHang> model = xuatHangDAO.listXuatHang();      
        RequestDispatcher dispatcher = request.getRequestDispatcher("giaodichxuat.jsp");
        request.setAttribute("listxuathang", model);        
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);
       
    }   
    
    private void addXuatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String mh = request.getParameter("txtMaHang");
        String nx = request.getParameter("txtNgayXuat");
        int sl = Integer.parseInt(request.getParameter("txtSoLuong")); 
        String th = request.getParameter("txtTrangThai");
        String[] arr = nx.split("/"); 
        for(int i = 0 ;i<arr.length;i++){ 
            nx = arr[arr.length-1-i];
        }
        XuatHang xuatHang = new XuatHang(mh,nx,sl,th); 
        //insert to DB
        xuatHangDAO.insertXuatHang(xuatHang);
        response.sendRedirect("xuathang");  
    }
    
    private void editTrangThai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        XuatHang model = xuatHangDAO.getXuatHang(id);
        request.setAttribute("capnhattrangthai", model);
        RequestDispatcher editDispatcher = request.getRequestDispatcher("capnhattrangthai.jsp");
        editDispatcher.forward(request, response);
    }
    
    private void deleteXuatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id").trim());
        //delete from DB
        xuatHangDAO.deleteXuatHang(id);
        
        response.sendRedirect("xuathang");       
    }   

    private void saveTrangThai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        XuatHang xh = new XuatHang();
        xh.setId(Integer.parseInt(request.getParameter("txtID")));
        xh.setMaHang(request.getParameter("txtMaHang"));
        xh.setNgayXuat(request.getParameter("txtNgayXuat"));
        xh.setSoLuong(Integer.parseInt(request.getParameter("txtSoLuong")));
        xh.setTrangThai(request.getParameter("txtTrangThai"));
        //update to DB
        xuatHangDAO.updateXuatHang(xh);
        //Gọi servlet được mapping "xuathang" trong web.xml
        response.sendRedirect("xuathang");  
    }
    
    private void searchXuatHang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtTimKiem");
        List<XuatHang> model = xuatHangDAO.searchXuatHang(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemxuathang.jsp");
        request.setAttribute("searchXuatHang", model);     
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);     
        
    }  
    private void searchXuatHangNgay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtNgayXuat");
        String[] arr = id.split("/"); 
        for(int i = 0 ;i<arr.length;i++){ 
            id = arr[arr.length-1-i];
        }
        List<XuatHang> model = xuatHangDAO.searchXuatHangNgay(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemxuatngay.jsp");
        request.setAttribute("searchXuatHangNgay", model);     
        
        //request.getSession().setAttribute("sessionName","Student session");
        
        dispatcher.forward(request, response);     
        
    } 
    
    private void searchXuatHangTrangThai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String id = request.getParameter("txtTrangThai");
        List<XuatHang> model = xuatHangDAO.searchXuatHangTrangThai(id);      
        RequestDispatcher dispatcher = request.getRequestDispatcher("timkiemxuattrangthai.jsp");
        request.setAttribute("searchXuatHangTrangThai", model);     
        
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
