package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class EvaluationDAO {
	
	public int write(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT INTO EVALUATION VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0);";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, evaluationDTO.getUserID());
			pstmt.setString(2, evaluationDTO.getMovieTitle());
			pstmt.setString(3, evaluationDTO.getDirectorName());
			pstmt.setString(4, evaluationDTO.getGenre());
			pstmt.setString(5, evaluationDTO.getEvaluationTitle());
			pstmt.setString(6, evaluationDTO.getEvaluationContent());
			pstmt.setInt(7, evaluationDTO.getTotalScore());
			pstmt.setInt(8, evaluationDTO.getStoryScore());
			pstmt.setInt(9, evaluationDTO.getVideoScore());
			pstmt.setInt(10, evaluationDTO.getCharacterScore());
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
}
