package controller;

import bo.ProductBO;
import bo.ProductBoImpl;
import dao.ProductDaoImpl;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = {"","/productServlet"})

public class ProductServlet extends HttpServlet {
    ProductBO productBO = new ProductBoImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                registerNewStudent(request,response);
                break;
            case "update":
                updateProduct(request,response);
                break;
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                response.sendRedirect("create.jsp");
                break;
            case "detail":
                getInfoProduct(request,response);
                break;
            case "update":
                goUpdate(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "find":
                findProduct(request,response);
                break;
            default:
                listProduct(request,response);
        }
    }




    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listProduct", productBO.getListProduct());
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
    private void registerNewStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = (int) (Math.random()*1000);
        String name = request.getParameter("name");
        Product product = new Product(id,name);
        productBO.save(product);
        request.setAttribute("message","create new product successfully!!");
        listProduct(request,response);
    }
    private void getInfoProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Product product = productBO.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("detail.jsp").forward(request,response);
    }
    private void goUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        Product product = productBO.findById(id);
        request.setAttribute("product",product);
        request.getRequestDispatcher("update.jsp").forward(request,response);
    }
    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String name = request.getParameter("name");
        Product product = new Product(id,name);
        productBO.save(product);
        request.setAttribute("message","Update Information product successfully!!");
        listProduct(request,response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        productBO.deleteById(id);
        request.setAttribute("message","Delete product successfully!!");
        listProduct(request,response);
    }
    private void findProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> product = productBO.findByName(name);
        request.setAttribute("listProduct",product);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }
}
