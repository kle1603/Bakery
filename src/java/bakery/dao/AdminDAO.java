/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dao;

import bakery.dto.BreadDTO;
import bakery.dto.BreadTypeDTO;
import bakery.dto.OrderDTO;
import bakery.utils.DBUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kle
 */
public class AdminDAO {
    
    private static final String DELETE_PRODUCT = "{Call DeleteBreadById(?, ?)}";

    public List<BreadDTO> getProductList() throws SQLException {
        List<BreadDTO> breadList = new ArrayList<>();
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                ps = c.prepareStatement("SELECT bread.*, bread_type.*, image.image_url FROM bread JOIN bread_type ON bread.bread_type_id = bread_type.bread_type_id JOIN image ON bread.bread_id = image.bread_id");
                rs = ps.executeQuery();
            }

            while (rs.next()) {
                int breadId = rs.getInt("bread_id");
                int breadTypeId = rs.getInt("bread_type_id");
                String breadTypeName = rs.getString("bread_type_name");
                String breadName = rs.getString("bread_name");
                double price = rs.getDouble("price");
                String description = rs.getString("description");
                String imageUrl = rs.getString("image_url");
                int quantity = rs.getInt("quantity");

                BreadTypeDTO breadType = new BreadTypeDTO();
                breadType.setBreadTypeId(breadTypeId);
                breadType.setBreadTypeName(breadTypeName);

                BreadDTO bread = new BreadDTO();
                bread.setBreadId(breadId);
                bread.setBreadType(breadType);
                bread.setBreadName(breadName);
                bread.setPrice(price);
                bread.setDescription(description);
                bread.setImageUrl(imageUrl);
                bread.setQuantity(quantity);

                breadList.add(bread);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return breadList;
    }

    public boolean updateBreadByAdmin(int breadId, String breadName, int breadTypeId, int quantity, double price) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement("UPDATE bread SET bread_type_id = ?, quantity = ?, price = ?, bread_name = ? WHERE bread_id = ?");
                ps.setInt(1, breadTypeId);
                ps.setInt(2, quantity);
                ps.setDouble(3, price);
                ps.setString(4, breadName);
                ps.setInt(5, breadId);
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

    public boolean deleteBreadByAdmin(int breadId) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;
        

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(DELETE_PRODUCT);
                cs.setInt(1, breadId);
                cs.registerOutParameter(2, Types.BIT);
                cs.execute();
                
                check = cs.getBoolean(2);

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cs != null) {
                cs.close();
            }
            if (c != null) {
                c.close();
            }
        }

        return check;
    }

    public boolean createBread(String breadName, int breadTypeId, int quantity, double price, String breadImageUrl) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement("INSERT INTO bread (bread_name, bread_type_id, quantity, price) OUTPUT inserted.bread_id VALUES (?, ?, ?, ?)");
                ps.setString(1, breadName);
                ps.setInt(2, breadTypeId);
                ps.setInt(3, quantity);
                ps.setDouble(4, price);
                rs = ps.executeQuery();

                while (rs.next()) {
                    int breadId = rs.getInt("bread_id");
                    ps = c.prepareStatement("INSERT INTO image (bread_id, image_url) VALUES (?, ?)");
                    ps.setInt(1, breadId);
                    ps.setString(2, breadImageUrl);
                    check = ps.executeUpdate() > 0;
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

        return check;
    }
}
