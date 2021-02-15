package dao;
import vo.*;
import java.sql.*;
import java.util.*;
import commons.*;
public class OrdersDao {
	public ArrayList<Orders> selectOrdersListByEmail(String memberEmail) throws Exception{
		ArrayList<Orders> list = new ArrayList<Orders>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "select*from orders where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1,memberEmail);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()){
			Orders o = new Orders();
			o.setOrdersId(rs.getInt("orders_id"));
			o.setProductId(rs.getInt("product_id"));
			o.setOrdersAmount(rs.getInt("orders_amount"));
			o.setMemberEmail(rs.getString("member_email"));
			o.setOrdersAddr(rs.getString("orders_addr"));
			o.setOrdersState(rs.getString("orders_state"));
			o.setOrdersDate(rs.getString("orders_date"));
			list.add(o);
		}
		
		return list;
	}
	
	public void insertOrders(Orders orders) throws Exception{
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			String sql = "insert into orders(product_id, orders_price, orders_amount, member_email, orders_addr, orders_state, orders_date) values(?,?,?,?,?,'주문완료',NOW())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1,orders.getProductId());
			stmt.setInt(2, orders.getOrdersPrice());
			stmt.setInt(3, orders.getOrdersAmount());
			stmt.setNString(4, orders.getMemberEmail());
			stmt.setNString(5, orders.getOrdersAddr());
			stmt.executeUpdate();
			conn.close();
			
			
	}
}
