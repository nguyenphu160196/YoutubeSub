package getsubyoutube.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import getsubyoutube.beans.UserAccount;

public class DBUtils {
	public static UserAccount findUser(Connection conn, String Email) throws SQLException {
		 
        String sql = "Select * from user"//
                + " where user.email = ? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, Email);
 
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
            UserAccount user = new UserAccount();
            user.setEmail(Email);
            return user;
        }
        return null;
    }
	
	public static void insertUser(Connection conn, UserAccount user) throws SQLException {
        String sql = "Insert into user(email) values (?)";
 
        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, user.getEmail());
 
        pstm.executeUpdate();
    }
}
