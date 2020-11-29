package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class MovieDAO {
	
	public ArrayList<MovieDTO> getMoiveList(String genre, String searchType) {
		if (genre.contentEquals("전체")) {
			genre = "";
		}
		ArrayList<MovieDTO> movieList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if (searchType.contentEquals("최신순")) {
				SQL = "SELECT * FROM MOVIE WHERE genre LIKE ? AND CONCAT(movieTitle, fileName) Like" +
						"? ORDER BY movieID DESC ;";
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + genre + "%");
			rs = pstmt.executeQuery();
			movieList = new ArrayList<MovieDTO>();
			
			while(rs.next()) {
				MovieDTO movie = new MovieDTO(
					rs.getInt(1), 
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5)
				);
				movieList.add(movie);
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
		return movieList;
	}
	
	public int write(MovieDTO movieDTO) {
		String SQL = "INSERT INTO EVALUATION VALUES (NULL, ?, ?, ?, ?);";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, movieDTO.getMovieTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(2, movieDTO.getDirectorName().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(3, movieDTO.getGenre().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(4, movieDTO.getImageLink().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
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
	
	public int delete(String movieID) {
		String SQL = "DELETE FROM EVALUATION WHERE movieID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(movieID));
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

