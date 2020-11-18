package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	public ArrayList<EvaluationDTO> getList(String genre, String searchType, String search, int pageNumber) {
		if (genre.contentEquals("전체")) {
			genre = "";
		}
		ArrayList<EvaluationDTO> evaluationList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if (searchType.contentEquals("최신순")) {
				SQL = "SELECT * FROM EVALUATION WHERE genre LIKE ? AND CONCAT(movieTitle, directorName, evaluationTitle, evaluationContent) Like" +
						"? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.contentEquals("추천순")) {
				SQL = "SELECT * FROM EVALUATION WHERE genre LIKE ? AND CONCAT(movieTitle, directorName, evaluationTitle, evaluationContent) Like" +
						"? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + genre + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
					rs.getInt(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getInt(8),
					rs.getInt(9),
					rs.getInt(10),
					rs.getInt(11),
					rs.getInt(12)
				);
				evaluationList.add(evaluation);
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
		return evaluationList;
	}
}
