package dao;
import java.sql.*;

import commons.*;
import java.util.*;
import vo.*;
public class ProductDao{
	public ArrayList<Product> selectProductList() throws Exception{
			ArrayList<Product> list = new ArrayList<Product>();
			
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mariadb://3.36.19.131/mall","root","java1004");
			String sql = "select product_id, product_pic, product_name, product_price from product order by product_price desc limit 0,6";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) { // set = ���� ���������   get = ���� �ҷ��ö�
				Product p = new Product(); // ��ü ����Ʈ ����
				p.setProductId(rs.getInt("product_id")); // p.(vo������) = rs.getInt(""); 
				p.setProductPic(rs.getString("product_pic"));
				p.setProductName(rs.getString("product_name"));
				p.setProductPrice(rs.getInt("product_price"));
				
				list.add(p);
			}
			conn.close();
			return list;
		}
	public Product selectProductOne(int productId) throws Exception{
		Product p = null;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://3.36.19.131/mall","root","java1004");
		String sql = "select * from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			p = new Product(); // ��ü ����Ʈ ����
			p.setProductId(rs.getInt("product_id"));// p.(vo������) = rs.getInt(""); 
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductSoldout(rs.getString("product_soldout"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
		}
		conn.close();
		return p;
	}
	public ArrayList<Product> selectCategoryProductList(int categoryId,int limit1,int limit2) throws Exception{
		ArrayList<Product> list = new ArrayList<Product>();
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://3.36.19.131/mall","root","java1004");
		String sql = "select * from product where category_id=? limit ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		stmt.setInt(2, limit1);
		stmt.setInt(3, limit2);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) { // set = ���� ���������   get = ���� �ҷ��ö�
			Product p = new Product(); // ��ü ����Ʈ ����
			p.setProductId(rs.getInt("product_id")); // p.(vo������) = rs.getInt(""); 
			p.setProductPic(rs.getString("product_pic"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
			
			list.add(p);
		}
		conn.close();
		return list;
	}
	public int productCount(int categoryId) throws Exception{
		int totalCount = 0;
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://3.36.19.131/mall","root","java1004");
		String sql = "select count(*) from product where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryId);
		
		ResultSet rs = stmt.executeQuery(); // 쿼리 실행
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		conn.close();
		return totalCount;
	}
	}
