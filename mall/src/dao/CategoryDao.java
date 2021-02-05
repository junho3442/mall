package dao;
import java.util.ArrayList;
import commons.*;
import vo.Category;
import java.sql.*;
public class CategoryDao {
	public ArrayList<Category> selectCategoryList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		
		String dbaddr = "jdbc:mariadb://3.36.19.131/mall";
		String dbid = "root";
		String dbpw = "java1004";
		String sql = "select category_id, category_name from category";
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs= stmt.executeQuery();
		                                                                                                                           
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		
		return list;
	}
	public ArrayList<Category> selectCategoryCkList() throws Exception {
		ArrayList<Category> list = new ArrayList<Category>();
		
		String dbaddr = "jdbc:mariadb://3.36.19.131/mall";
		String dbid = "root";
		String dbpw = "java1004";
		String sql = "select category_id, category_pic from category where category_ck='Y' limit 0,4";
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs= stmt.executeQuery();
		                                                                                                                           
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id")); //  rs= �������̺� 
			category.setCategoryPic(rs.getString("category_pic")); // �÷���x
			list.add(category);
		}
		conn.close();
		
		return list;
	}
	
	public Category categoryName(int categoryId) throws Exception{
		Category c = null;
		
		String dbaddr = "jdbc:mariadb://3.36.19.131/mall";
		String dbid = "root";
		String dbpw = "java1004";
		String sql = "select category_name from category where category_id=?";
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection(dbaddr,dbid,dbpw);
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setInt(1, categoryId);
		ResultSet rs= stmt.executeQuery();
		if(rs.next()) {
			c = new Category();
			c.setCategoryName(rs.getString("category_name"));
		}
		return c;
	}
}
