/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.utils;

import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



/**
 *
 * @author namdh
 */
public class Email {
    // Email: namdhse172173@fpt.edu.vn
    // Password: kqjxoixgtcdvywld

    private static final String EMAIL = "bkhang160303@gmail.com";
    private static final String PASSWORD = "jsoycervjdtgsljs";

    public static boolean sendEmail(String to, String title, String content) {
        String from = EMAIL;
        String password = PASSWORD;
        // Properties : khai báo các thuộc tính
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                // TODO Auto-generated method stub
                return new PasswordAuthentication(from, password);
            }
        };

        // Phiên làm việc
        Session session = Session.getInstance(props, auth);

        // Tạo một tin nhắn
        MimeMessage msg = new MimeMessage(session);

        try {
            // Kiểu nội dung
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");

            // Người gửi
            msg.setFrom(from);

            // Người nhận
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

            // Tiêu đề email
            msg.setSubject(title);

            // Quy đinh ngày gửi
            msg.setSentDate(new Date());

            // Quy định email nhận phản hồi
            // msg.setReplyTo(InternetAddress.parse(from, false))
            // Nội dung
            msg.setContent(content, "text/HTML; charset=UTF-8");

            // Gửi email
            Transport.send(msg);
            System.out.println("Gửi email thành công");
            return true;
        } catch (Exception e) {
            System.out.println("Gặp lỗi trong quá trình gửi email");
            e.printStackTrace();
            return false;
        }
    }

    public static String templateEmail(String rootPath, String username, String code) {
        return "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "    <head>\n"
                + "        <meta charset=\"UTF-8\" />\n"
                + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n"
                + "        <title>Pursuit</title>\n"
                + "    </head>\n"
                + "    <body>\n"
                + "        <a href=" + rootPath + "/MainController?action=Verify&username=" + username + "&code=" + code + ">\n"
                + "            Click here to verify your account!\n"
                + "        </a>\n"
                + "    </body>\n"
                + "</html>";
    }
    
    public static String createEmailContent(String username, String email) {
    String content = "<!DOCTYPE html>\n" +
        "<html>\n" +
        "<head>\n" +
        "<title>Chào mừng bạn đến với Bakery</title>\n" +
        "<style>\n" +
        "/* Thiết lập kiểu cho các phần tử */\n" +
        "body {\n" +
        "    margin: 0;\n" +
        "    padding: 0;\n" +
        "    font-family: Arial, sans-serif;\n" +
        "    background-color: #f7f7f7;\n" +
        "}\n" +
        ".container {\n" +
        "    width: 600px;\n" +
        "    margin: 0 auto;\n" +
        "    padding: 20px;\n" +
        "    background-color: #ffffff;\n" +
        "    border-radius: 5px;\n" +
        "    box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);\n" +
        "}\n" +
        ".header {\n" +
        "    text-align: center;\n" +
        "    background-color: #ff9800;\n" + // Màu nền đầu tiên (#ff9800)
        "    padding: 20px;\n" +
        "}\n" +
        ".header h1 {\n" +
        "    color: #ffffff;\n" + // Màu chữ đầu tiên (#ffffff)
        "    font-size: 36px;\n" +
        "    margin-bottom: 10px;\n" +
        "}\n" +
        ".content {\n" +
        "    padding: 20px;\n" +
        "    background-color: #ffffff;\n" +
        "}\n" +
        ".content p {\n" +
        "    color: #333333;\n" +
        "    font-size: 16px;\n" +
        "    margin-bottom: 10px;\n" +
        "}\n" +
        ".footer {\n" +
        "    text-align: center;\n" +
        "    background-color: #f2f2f2;\n" +
        "    padding: 20px;\n" +
        "}\n" +
        ".footer p {\n" +
        "    color: #666666;\n" +
        "    font-size: 14px;\n" +
        "    margin-bottom: 10px;\n" +
        "}\n" +
        "/* Thiết lập kiểu cho liên kết */\n" +
        ".button {\n" +
        "    display: inline-block;\n" +
        "    padding: 10px 20px;\n" +
        "    background-color: #ff9800;\n" + // Màu nút (#ff9800)
        "    color: #ffffff;\n" +
        "    text-decoration: none;\n" +
        "    border-radius: 5px;\n" +
        "}\n" +
        ".button:hover {\n" +
        "    background-color: #ffac33;\n" + // Màu khi di chuột vào nút (#ffac33)
        "}\n" +
        "</style>\n" +
        "</head>\n" +
        "<body>\n" +
        "<div class=\"container\">\n" +
        "<div class=\"header\">\n" +
        "<h1>Chào mừng bạn đến với Bakery</h1>\n" +
        "</div>\n" +
        "<div class=\"content\">\n" +
        "<p>Xin chào " + username + ",</p>\n" +
        "<p>Cám ơn bạn đã đăng ký tài khoản với email: " + email + ".</p>\n" +
        "<p>Chúng tôi rất hân hạnh được đón tiếp bạn và mong muốn mang đến cho bạn những trải nghiệm tuyệt vời khi sử dụng dịch vụ của chúng tôi.</p>\n" +
        "<p>Bakery là nơi bạn có thể tìm thấy những sản phẩm bánh mì tươi ngon và đa dạng. Chúng tôi cam kết sử dụng những nguyên liệu chất lượng nhất và quy trình nướng bánh độc đáo để đảm bảo bạn nhận được những chiếc bánh mì tuyệt hảo.</p>\n" +
        "<p>Hãy khám phá cửa hàng của chúng tôi và tận hưởng những loại bánh mì tuyệt vời mà chúng tôi đã sẵn sàng phục vụ bạn.</p>\n" +
        "<p>Cảm ơn bạn một lần nữa vì đã tin tưởng và lựa chọn Bakery.</p>\n" +
        "<p>Trân trọng,</p>\n" +
        "<p>Đội ngũ Bakery</p>\n" +
        "<p>\n" +
        "<a href=\"#!\" class=\"button\">Khám phá ngay</a>\n" +
        "</p>\n" +
        "</div>\n" +
        "<div class=\"footer\">\n" +
        "<p>Email này được gửi tự động, vui lòng không trả lời.</p>\n" +
        "</div>\n" +
        "</div>\n" +
        "</body>\n" +
        "</html>";

    return content;
}


}
