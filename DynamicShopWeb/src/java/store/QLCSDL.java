/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hv
 */
public class QLCSDL {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/store?useUnicode=true&characterEncoding=utf8";
    private static final String JDBC_DRIVER_CLASS = "com.mysql.jdbc.Driver";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "1234";

    private Connection connect() throws SQLException, ClassNotFoundException {
        Class.forName(JDBC_DRIVER_CLASS);
        Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        return conn;
    }

    //product
    public List<Product> dsProduct() throws SQLException, ClassNotFoundException {
        List<Product> rs;
        try (Connection conn = this.connect()) {
            rs = new ArrayList<>();
            java.sql.Statement statement = conn.createStatement();
            String sql = "SELECT * FROM product";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product p = new Product();
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setPrice(resultSet.getDouble("price"));
                p.setAmount(resultSet.getInt("amount"));
                p.setImage(resultSet.getString("image"));
                p.setState(resultSet.getInt("state"));
                rs.add(p);
            }
            conn.close();
        }
        return rs;
    }

    public List<Product> dsProductTheoSQL(String sql) throws SQLException, ClassNotFoundException {
        List<Product> rs;
        try (Connection conn = this.connect()) {
            rs = new ArrayList<>();
            java.sql.Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Product p = new Product();
                p.setId(resultSet.getInt("id"));
                p.setName(resultSet.getString("name"));
                p.setPrice(resultSet.getDouble("price"));
                p.setAmount(resultSet.getInt("amount"));
                p.setImage(resultSet.getString("image"));
                p.setCategory_id(resultSet.getInt("category_id"));
                p.setCreate_date(resultSet.getDate("create_date").toString());
                p.setState(resultSet.getInt("state"));
                rs.add(p);
            }
            conn.close();
        }
        return rs;
    }

    public List<Category> dsCategory() throws SQLException, ClassNotFoundException {
        List<Category> rs;
        try (Connection conn = this.connect()) {
            rs = new ArrayList<>();
            java.sql.Statement statement = conn.createStatement();
            String sql = "select * from category";
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Category category = new Category();
                category.setId(resultSet.getInt("id"));
                category.setName(resultSet.getString("name"));
                category.setDescription(resultSet.getString("description"));
                category.setImage(resultSet.getString("image"));
                rs.add(category);
            }
        }
        return rs;
    }

    public void capnhatProduct(Product p) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        try (Connection conn = this.connect()) {
            String sql = "update product set price = " + p.getPrice() + ", amount = " + p.getAmount() + " where id = " + p.getId() + "";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.execute();
        }
    }

    public void xoaProduct(int id) throws SQLException, ClassNotFoundException, UnsupportedEncodingException {
        try (Connection conn = this.connect()) {
            String sql = "delete from product where id = " + id;
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.execute();
        }
    }
    public User timUser(String username,String password)throws SQLException,ClassNotFoundException{
        User user = null;
        try(Connection conn = this.connect()){
            java.sql.Statement statement = conn.createStatement();
            String sql = "Select * from user where username like '"+username+"' and password like '"+password+"'";
            ResultSet resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
                user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setAddress(resultSet.getString("address"));
                user.setEmail(resultSet.getString("email"));
                user.setPhone(resultSet.getString("phone"));
                user.setRole(resultSet.getString("role"));
                break;
            }
        }
        return user;
    }
    public void themCategory(Category c)throws SQLException,ClassNotFoundException,UnsupportedEncodingException{
        try(Connection conn = this.connect()){
            String sql = "Insert into category values(NULL,'"+c.getName()+"','"+c.getDescription()+"',NULL)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.execute();
            conn.close();
        }catch (Exception ex){
            System.out.println("Error: "+ex.getMessage());
        }
    }
    public void themProduct(Product product) throws SQLException,ClassNotFoundException,UnsupportedEncodingException{
        try (Connection conn = this.connect()){
            String sql = "insert into product values(NULL,'"+product.getName()
                    +"' ,'"+product.getPrice()
                    +"' ,'"+product.getAmount()
                    +"' ,'"+product.getImage()+"' ,'"
                    +product.getCategory_id()+"' ,'"
                    +product.getCreate_date()+"' ,'"+1+"')";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.execute();
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error: ~~~~~~~~~~~~~"+ex.getMessage());
        }
        }
    }
