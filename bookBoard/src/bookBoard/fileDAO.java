package bookBoard;
import java.sql.*;
public class fileDAO {
private Connection conn;

	

	// 생성자를 통해 db연결 해줌

	public fileDAO() {

		try {

			String dbURL = "jdbc:mysql://localhost:3306/bookDB";

			String dbID = "root";

			String dbPW = "1234";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPW);

		} catch(Exception e) {

			e.printStackTrace();

		}

	}

	

	public int upload(String fileName, String fileRealName, String tradeNum) {

		String SQL = "INSERT INTO FILE(fileName, fileRealName) VALUES (?, ?) WHERE tradenum = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1,  fileName);

			pstmt.setString(2,  fileRealName);
			
			pstmt.setString(3,  tradeNum);

			return pstmt.executeUpdate();

		} catch(Exception e) {

			e.printStackTrace();

		}

		return -1;

	}
}
