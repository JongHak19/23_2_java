package Board;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private Connection conn;
	
	public BoardDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_project?serverTimezone=UTC", 
					"root", "0000");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시글 생성
	public int create(BoardDTO board) {
		String SQL = "INSERT INTO BOARD (id, subject, content) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, board.getId());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//게시글 불러오기
	public BoardDTO read(int id) {
		String SQL = "SELECT * FROM BOARD WHERE id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
            	BoardDTO board = new BoardDTO();
            	board.setId(rs.getInt(1));
            	board.setSubject(rs.getString(2));
            	board.setContent(rs.getString(3));
            	return board;
            }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//게시글 수정
	public int update(BoardDTO board) {
        String SQL = "UPDATE BOARD SET subject = ?, content = ? WHERE id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, board.getSubject());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getId());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }
	
	// 게시글 삭제
    public int delete(int id) {
        String SQL = "DELETE FROM BOARD WHERE id = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, id);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // DB 오류
    }
    
    // 모든 게시글 불러오기
    public List<BoardDTO> readAll(){
    	String SQL = "SELECT * FROM BOARD";
    	List<BoardDTO> boards = new ArrayList<BoardDTO>();
    	try {
    		PreparedStatement pstmt = conn.prepareStatement(SQL);
    		ResultSet rs = pstmt.executeQuery();
    		while(rs.next()) {
    			BoardDTO board = new BoardDTO();
    			board.setId(rs.getInt(1)); //rs.getInt("id") 로도 가능함
    			board.setSubject(rs.getString(2)); //rs.getInt("subject")
    			board.setContent(rs.getString(3)); //rs.getInt("content")
    			boards.add(board);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return boards;
    }
    
    public int getId() {
		int maxNum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			// IFNULL을 써서 null인 값을 0으로 바꿔준다. 0으로 바꿔줘야 연산이 가능(++)
			sql = "SELECT IFNULL(MAX(id), 0) FROM BOARD;";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				maxNum = rs.getInt(1); // 여긴 컬럼명or숫자를 쓴다.
				// IFNULL(max(id)) 는 파생 컬럼이라서 이름을 쓰기 복잡하고 오류 확률이 증가하므로 getInt(1)을 써준다.
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return maxNum;
	}
}