/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.dao;

import bakery.dto.AccountDTO;
import bakery.dto.BreadDTO;
import bakery.dto.BreadTypeDTO;
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
    private static final String LOGIN = "SELECT a.account_id, a.username, a.password, a.email, r.role_id, r.role_name"
            + " FROM account a"
            + " INNER JOIN roles r ON a.role_id = r.role_id"
            + " WHERE a.username = ? AND a.password = ?";
    private static final String LOGIN_WITH_GOOGLE = "{call SaveGoogleData(?, ?, ?, ?, ?, ?, ?)}";
    private static final String GET_PRODUCT = "{call GetDefaultBreads(?, ?)}";
    private static final String GET_TOTAL_PRODUCT = "{call GetTotalProducts}";

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
        AccountDTO account = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, username);
                ptm.setString(2, password);
                rs = ptm.executeQuery();

                if (rs.next()) {
                    int accountId = rs.getInt("account_id");
                    String email = rs.getString("email");

                    // Tạo đối tượng RoleDTO từ roleId
                    RoleDTO role = new RoleDTO(rs.getString("role_id"), rs.getString("role_name"));

                    // Tạo đối tượng AccountDTO từ thông tin đã lấy từ cơ sở dữ liệu
                    account = new AccountDTO();
                    account.setAccountId(accountId);
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
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
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

    public List<BreadDTO> getListProduct(int pageNumber, int pageSize) throws SQLException, ClassNotFoundException {
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

                rs = cs.executeQuery();

                while (rs.next()) {
                    int breadId = rs.getInt("bread_id");
                    int breadTypeId = rs.getInt("bread_type_id");
                    String breadTypeName = rs.getString("bread_type_name");
                    String breadName = rs.getString("bread_name");
                    int unitsInStock = rs.getInt("units_in_stock");
                    String description = rs.getString("description");
                    String imageUrl = rs.getString("image_url");

                    BreadTypeDTO breadType = new BreadTypeDTO();
                    breadType.setBreadTypeId(breadTypeId);
                    breadType.setBreadTypeName(breadTypeName);

                    BreadDTO bread = new BreadDTO();
                    bread.setBreadId(breadId);
                    bread.setBreadType(breadType);
                    bread.setBreadName(breadName);
                    bread.setUnitsInStock(unitsInStock);
                    bread.setDescription(description);
                    bread.setImageUrl(imageUrl);

                    productList.add(bread);
                }
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

    public int getTotalProducts() throws SQLException, ClassNotFoundException {
        Connection conn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        int totalProducts = 0;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                cs = conn.prepareCall(GET_TOTAL_PRODUCT);

                rs = cs.executeQuery();

                if (rs.next()) {
                    totalProducts = rs.getInt("TotalProducts");
                }
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

        return totalProducts;
    }
}
