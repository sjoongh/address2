package com.example.address.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.address.vo.AddressVo;

public class AddressBookDaoImpl implements AddressBookDao {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
					"C##BITUSER", "BITUSER");
		} catch (ClassNotFoundException e) {
			System.err.println("드라이버 로드 실패");
			e.printStackTrace();
		}
		return conn;
	}

	@Override
	public List<AddressVo> getList() {
		List<AddressVo> list = new ArrayList<>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery("SELECT no, name, hp, tel FROM address_book ORDER BY no DESC");
			
			while (rs.next()) {
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String hp = rs.getString(3);
				String tel = rs.getString(4);
				
				AddressVo vo = new AddressVo();
				vo.setNo(no);
				vo.setHp(hp);
				vo.setName(name);
				vo.setTel(tel);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int insert(AddressVo vo) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
	try {
		conn = getConnection();
		
		pstmt = conn.prepareStatement("INSERT INTO address_book (no, name, hp, tel) "
				+ " VALUES(seq_address_book_pk.NEXTVAL, ?, ?, ?)");
		
		pstmt.setString(1, vo.getName());
		pstmt.setString(2, vo.getHp());
		pstmt.setString(3, vo.getTel());
		
		count = pstmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	return count;
}

	@Override
	public List<AddressVo> find(String keyword) {
		List<AddressVo> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("SELECT no, name, hp, tel FROM phone_book WHERE name LIKE ?");
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Long no = rs.getLong(1);
				String name = rs.getString(2);
				String hp = rs.getString(3);
				String tel = rs.getString(4);
				
				AddressVo vo = new AddressVo();
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
			}
		return list;
		}
	
	@Override
	public int delete(Long pk) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deletedCount = 0;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("DELETE FROM address_book WHERE no = ?");
			pstmt.setLong(1, deletedCount);
			pstmt.setLong(1, pk);
			
			deletedCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return deletedCount;
	}
}