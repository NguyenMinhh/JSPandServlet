/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import store.Product;
import store.QLCSDL;

/**
 *
 * @author hv
 */
@WebServlet(name = "InsertNewProductServlet", urlPatterns = {"/insertnew"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, //10MB
        maxFileSize = 1024 * 1024 * 50, //50MB
        maxRequestSize = 1024 * 1024 * 100) //100MB
public class InsertNewProductServlet extends HttpServlet {

    private static final long serialVersionUID = 205242440643911308L;
    private static final String UPLOAD_DIR = "/web/images/product";

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertNewProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertNewProductServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        try {
            //viec 1: dua hinh nguoi dung chon vao TM hinh cua UD
            String applicationPath = request.getServletContext().getRealPath("/");
            //tao duong dan dung cho hinh
            String pathNew = applicationPath.substring(0, applicationPath.length() - 11);
            //constructs path of the directory to save uploaded file
            String uploadFilePath = pathNew + UPLOAD_DIR;

            //creates the save directory if it does not exists
            File fileSaveDir = new File(uploadFilePath);

            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            System.out.println("Upload File Directory" + fileSaveDir.getAbsolutePath());

            Part filePart = request.getPart("image");//Retrieves <input type ="file" name="file">
            String fileName = getSubmittedFileName(filePart);//filename :dsdsds.jpg
            filePart.write(uploadFilePath + File.separator + fileName);
            //viec 2: dua thong tin product vao CSDL
            //lay ngay hien tai cua he thong
            request.setCharacterEncoding("utf-8");
            System.out.println("Chay toi day r ne");
            Calendar c = Calendar.getInstance(Locale.ENGLISH);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            QLCSDL qlcsdl = new QLCSDL();
            Product p = new Product();
            p.setName(request.getParameter("name"));
            p.setPrice(Double.parseDouble(request.getParameter("price")));
            p.setPrice(Integer.parseInt(request.getParameter("amount")));
            p.setImage(fileName);
            p.setCategory_id(Integer.parseInt(request.getParameter("category_id")));
            p.setCreate_date(format.format(c.getTime()));

            qlcsdl.themProduct(p);
            request.setAttribute("message", "Sản phẩm đã được thêm mới! ");
            getServletContext().getRequestDispatcher("/responseproduct.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException | UnsupportedEncodingException ex) {
            Logger.getLogger(InsertNewProductServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }

}
