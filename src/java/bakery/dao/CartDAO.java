/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dao;

import bakery.dto.AccountDTO;
import bakery.dto.BreadDTO;
import bakery.dto.BreadTypeDTO;
import bakery.dto.CartDTO;
import bakery.dto.CartItemDTO;
import bakery.dto.CustomerDTO;
import bakery.dto.ImageDTO;
import bakery.dto.OrderDTO;
import bakery.utils.DBUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kle
 */
public class CartDAO {

    private static final String GET_CART = "{CALL GetCartItems(?)}";
    private static final String GET_ITEM = "{CALL GetCartItemByCustomerId(?)}";
    private static final String INSERT_ORDER = "{CALL InsertOrderDetailsFromCart(?, ?)}";
    private static final String DELETE_ITEM = "DELETE FROM cart_item WHERE bread_id = ? AND cart_id = ?";
    private static final String UPDATE_ITEM = "UPDATE cart_item SET quantity = ? WHERE cart_id = ? AND bread_id = ?";
    private static final String GET_ORDER_ID = "SELECT order_id FROM [order] WHERE customer_id = ? AND total_amount = ?";
    private static final String GET_ORDER_LIST = "SELECT o.order_id, o.order_date, o.total_amount, SUM(dt.quantity) AS total_products FROM [order] "
            + "AS o JOIN order_detail AS dt ON o.order_id = dt.order_id WHERE o.customer_id = ? GROUP BY o.order_id, o.order_date, o.total_amount;";
    private static final String UPDATE_ORDER = "{CALL UpdateOrder(?, ?, ?, ?, ?, ?, ?)}";
    
    public List<CartItemDTO> getCartItems(int customerId) throws SQLException {
        List<CartItemDTO> cartList = new ArrayList<>();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                cs = c.prepareCall(GET_CART);
                cs.setInt(1, customerId);
                rs = cs.executeQuery();
            }

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và tạo đối tượng CartItemDTO
                int quantity = rs.getInt("quantity");
                int breadId = rs.getInt("bread_id");
                int breadTypeId = rs.getInt("bread_type_id");
                String breadName = rs.getString("bread_name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                int availableQuantity = rs.getInt("available_quantity");
                int imageId = rs.getInt("image_id");
                String imageUrl = rs.getString("image_url");

                BreadDTO bread = new BreadDTO();
                bread.setBreadId(breadId);
                bread.setBreadName(breadName);
                bread.setDescription(description);
                bread.setPrice(price);
                bread.setQuantity(availableQuantity);

                CartItemDTO cartItem = new CartItemDTO();
                cartItem.setQuantity(quantity);
                cartItem.setBreadId(bread);

                cartList.add(cartItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return cartList;
    }

    public List<CartItemDTO> getItemsByCus(int customerId) throws SQLException {
        List<CartItemDTO> cartList = new ArrayList<>();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                cs = c.prepareCall(GET_ITEM);
                cs.setInt(1, customerId);
                rs = cs.executeQuery();
            }

            while (rs.next()) {
                // Đọc dữ liệu từ ResultSet và tạo đối tượng CartItemDTO
                int quantity = rs.getInt("quantity");
                int cartId = rs.getInt("cart_id");
                int breadId = rs.getInt("bread_id");
                String breadName = rs.getString("bread_name");
                double price = rs.getDouble("price");
                int availableQuantity = rs.getInt("available_quantity");
                String imageUrl = rs.getString("image_url");

                BreadDTO bread = new BreadDTO();
                bread.setBreadId(breadId);
                bread.setBreadName(breadName);
                bread.setImageUrl(imageUrl);
                bread.setPrice(price);
                bread.setQuantity(availableQuantity);

                CartDTO cart = new CartDTO();
                cart.setCartId(cartId);

                CartItemDTO cartItem = new CartItemDTO();
                cartItem.setQuantity(quantity);
                cartItem.setBreadId(bread);
                cartItem.setCart(cart);

                cartList.add(cartItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return cartList;
    }

    public boolean deleteItem(int breadId, int cartId) throws SQLException{
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(DELETE_ITEM);
                ps.setInt(1, breadId);
                ps.setInt(2, cartId);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
    
    public boolean updateItem(int quantity, int breadId, int cartId) throws SQLException{
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(UPDATE_ITEM);               
                ps.setInt(1, quantity);
                ps.setInt(2, cartId);
                ps.setInt(3, breadId);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
    
    public boolean insertOrder(int customerId, double totalAmount) throws SQLException{
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(INSERT_ORDER);               
                ps.setInt(1, customerId);
                ps.setDouble(2, totalAmount);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
    
    public OrderDTO getOrderId(int customerId, double totalAmount) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        OrderDTO order = new OrderDTO();

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(GET_ORDER_ID);
                ps.setInt(1, customerId);
                ps.setDouble(2, totalAmount);
                rs = ps.executeQuery();
                
                while(rs.next()){
                    int orderId = rs.getInt("order_id");
                    order.setOrderId(orderId);
                }                                          
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return order;
    }
    
    public boolean updateOrder(int customerId, int orderId, String firstName, String lastName, String address, String phoneNumber, int paymentMethodId) throws SQLException {
        Connection c = null;
        CallableStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareCall(UPDATE_ORDER);
                ps.setInt(1, customerId);
                ps.setInt(2, orderId);
                ps.setString(3, firstName);
                ps.setString(4, lastName);
                ps.setString(5, address);
                ps.setString(6, phoneNumber);
                ps.setInt(7, paymentMethodId);
                
                check = ps.executeUpdate() > 0;                                       
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }
    
    public List<OrderDTO> getOrderList(int customerId) throws SQLException {
        List<OrderDTO> orderList = new ArrayList<>();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                cs = c.prepareCall(GET_ORDER_LIST);
                cs.setInt(1, customerId);
                rs = cs.executeQuery();
            }

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                java.sql.Date orderDate = rs.getDate("order_date");
                double totalAmount = rs.getDouble("total_amount");
                int totalProducts = rs.getInt("total_products");
                
                OrderDTO order = new OrderDTO();
                order.setOrderId(orderId);
                order.setTotalProducts(totalProducts);
                order.setTotalAmount(totalAmount);
                order.setOrderDate(orderDate);
                

                orderList.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return orderList;
    }
}
