package guidance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class GuidanceDAO {

	public int update(GuidanceDTO guidanceDTO) {
		String SQL = "UPDATE GUIDANCE SET descriptionTitle = ?, descriptionContent = ?"
				+ ", descriptionImage = ? WHERE descriptionID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, guidanceDTO.getDescriptionTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(2, guidanceDTO.getDescriptionContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(3, guidanceDTO.getDescriptionImage().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setInt(4, guidanceDTO.getDescriptionID());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)	conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)	pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)	rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; 
	}
	
	public ArrayList<GuidanceDTO> getList() {
		ArrayList<GuidanceDTO> guidanceList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			SQL = "SELECT * FROM GUIDANCE";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			guidanceList = new ArrayList<GuidanceDTO>();
			while(rs.next()) {
				GuidanceDTO guidance = new GuidanceDTO (
					rs.getInt(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4)
				);
				guidanceList.add(guidance);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)	conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)	pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)	rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return guidanceList;
	}
	
}
