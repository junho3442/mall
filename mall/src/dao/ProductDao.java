package dao;
import java.sql.*;

import commons.*;
import java.util.*;
import vo.*;
public class ProductDao{
	public ArrayList<Product> selectProductList() throws Exception{
			ArrayList<Product> list = new ArrayList<Product>();
			
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
			String sql = "select product_id, product_pic, product_name, product_price from product order by product_price desc limit 0,6";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) { // set = 값을 집어넣을떄   get = 값을 불러올때
				Product p = new Product(); // 객체 리스트 생성
				p.setProductId(rs.getInt("product_id")); // p.(vo변수명) = rs.getInt(""); 
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
		Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/mall","root","java1004");
		String sql = "select * from product where product_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, productId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			p = new Product(); // 객체 리스트 생성
			p.setProductId(rs.getInt("product_id"));// p.(vo변수명) = rs.getInt(""); 
			p.setCategoryId(rs.getInt("category_id"));
			p.setProductContent(rs.getString("product_content"));
			p.setProductPic(rs.getString("product_pic"));
			p.setProductSoldout(rs.getString("product_soldout"));
			p.setProductName(rs.getString("product_name"));
			p.setProductPrice(rs.getInt("product_price"));
		}
		return p;
	}
	}
