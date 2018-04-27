package getsubyoutube.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import getsubyoutube.beans.UserAccount;

public class DBUtils {
	public static UserAccount findUser(Connection conn, String Email) throws SQLException {
		 
        String sql = "Select a.EMAIL from user_account a"//
                + " where a.EMAIL = ? ";
 
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
}
