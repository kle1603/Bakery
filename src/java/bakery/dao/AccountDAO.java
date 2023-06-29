/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dao;

import bakery.dto.AccountDTO;
import bakery.dto.BreadDTO;
import bakery.dto.BreadTypeDTO;
import bakery.dto.CartItemDTO;
import bakery.dto.CustomerDTO;
import bakery.dto.GoogleDTO;
import bakery.dto.ImageDTO;
import bakery.dto.RoleDTO;
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
 * @author kle
 */
public class AccountDAO {

    private static final String REGISTER = "{CALL RegisterAccount(?, ?, ?)}";
    private static final String DUPLICATE_USERNAME = "{CALL CheckDuplicateUsername(?, ?)}";
    private static final String DUPLICATE_EMAIL = "{CALL CheckDuplicateEmail(?, ?)}";
    private static final String LOGIN = "{CALL CheckLogin(?, ?)}";
    private static final String LOGIN_WITH_GOOGLE = "{call SaveGoogleData(?, ?, ?, ?, ?, ?, ?)}";
    private static final String GET_PRODUCT = "{call GetProductList(?, ?, ?, ?)}";
    private static final String GET_TOTAL_PRODUCT = "{call GetTotalProducts}";
    private static final String ADD_TO_CART = "{CALL AddToCartItem(?, ?)}";
    public int totalProducts = 0;

    public boolean registerAccount(String username, String email, String password) throws SQLException {
        Connection c = null;
        PreparedStatement ps = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                ps = c.prepareStatement(REGISTER);
                ps.setString(1, email);
                ps.setString(2, username);
                ps.setString(3, password);
                check = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
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

    public boolean checkDuplicate(String parameter, String type) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                switch (type) {
//                    case "EMAIL":
//                        cs = c.prepareCall(DUPLICATE_EMAIL);
//                        break;
                    case "USERNAME":
                        cs = c.prepareCall(DUPLICATE_USERNAME);
                        break;
                    case "EMAIL":
                        cs = c.prepareCall(DUPLICATE_EMAIL);
                        break;
                    default:
                        return check;
                }
                cs.setString(1, parameter);
                cs.registerOutParameter(2, Types.BIT);
                cs.execute();
                check = cs.getBoolean(2);
            }
        } catch (Exception e) {
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

    public AccountDTO checkLogin(String username, String password) throws SQLException {
        AccountDTO account = new AccountDTO();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                cs = c.prepareCall(LOGIN);
                cs.setString(1, username);
                cs.setString(2, password);
                rs = cs.executeQuery();

                if (rs.next()) {
                    int customerId = rs.getInt("customer_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String address = rs.getString("address");
                    String phoneNumber = rs.getString("phone_number");
                    String email = rs.getString("email");
                    String roleName = rs.getString("role_name");
                    String roleId = rs.getString("role_id");

                    // Tạo đối tượng CustomerDTO từ thông tin đã lấy từ cơ sở dữ liệu
                    CustomerDTO customer = new CustomerDTO(customerId, firstName, lastName, address, phoneNumber);

                    // Tạo đối tượng RoleDTO từ roleName
                    RoleDTO role = new RoleDTO(roleId, roleName);

                    // Tạo đối tượng AccountDTO từ thông tin đã lấy từ cơ sở dữ liệu
                    account.setCustomer(customer);
                    account.setUsername(username);
                    account.setPassword(password);
                    account.setEmail(email);
                    account.setRole(role);
                }
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
        return account;
    }

    public boolean loginWithGoogle(GoogleDTO gdto) throws SQLException {
        Connection c = null;
        CallableStatement cs = null;
        boolean check = false;

        try {
            c = DBUtils.getConnection();

            if (c != null) {
                cs = c.prepareCall(LOGIN_WITH_GOOGLE);
                cs.setString(1, gdto.getId());
                cs.setString(2, gdto.getEmail());
                cs.setString(3, gdto.getName());
                cs.setString(4, gdto.getGiven_name());
                cs.setString(5, gdto.getFamily_name());
                cs.setString(6, gdto.getPicture());
                cs.registerOutParameter(7, Types.BIT);
                cs.execute();
                check = cs.getBoolean(7);
            }
        } catch (Exception e) {
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

    public List<BreadDTO> getListProduct(int pageNumber, int pageSize, String search) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        List<BreadDTO> productList = new ArrayList<>();

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                cs = conn.prepareCall(GET_PRODUCT);
                cs.setInt(1, pageNumber); // Số trang yêu cầu
                cs.setInt(2, pageSize); // Số sản phẩm trên mỗi trang
                cs.setString(3, search); // Số sản phẩm trên mỗi trang
                cs.registerOutParameter(4, Types.INTEGER); // Số sản phẩm trên mỗi trang

                rs = cs.executeQuery();

                while (rs.next()) {
                    int breadId = rs.getInt("bread_id");
                    int breadTypeId = rs.getInt("bread_type_id");
                    String breadTypeName = rs.getString("bread_type_name");
                    String breadName = rs.getString("bread_name");
                    double price = rs.getDouble("price");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("image_url");

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

                    productList.add(bread);
                }

                totalProducts = cs.getInt(4);

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (cs != null) {
                cs.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return productList;
    }
    
    public CartItemDTO addItem(String customerId, String breadId) throws SQLException {
        CartItemDTO cart = new CartItemDTO();
        Connection c = null;
        CallableStatement cs = null;
        ResultSet rs = null;

        try {
            c = DBUtils.getConnection();
            if (c != null) {
                cs = c.prepareCall(ADD_TO_CART);
                int cId = Integer.parseInt(customerId);
                int bId = Integer.parseInt(breadId);
                cs.setInt(1, cId);
                cs.setInt(2, bId);
                rs = cs.executeQuery();

                if (rs.next()) {
                    String breadName = rs.getString("bread_name");
                }
            }
            
//            tôi thua!!!
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
        return cart;
    }

}
