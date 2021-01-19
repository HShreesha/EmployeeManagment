import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

import User.Department;
import User.Emp;
import User.Project;

public class DB {
	public static Connection connection = setConnection();
	public static Connection setConnection() {
		// TODO Auto-generated method stub
		Connection con = null;
		try{  
			Class.forName("com.mysql.jdbc.Driver");  
			con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/amitha?useSSL=false","root","root");
		}
		catch(Exception e){
			System.out.println(e);
		}
		return con;
	}
	
	public static List<Emp> getUsersList(){
		List<Emp> list = new ArrayList<Emp>();
		Connection con = DB.connection;
		Statement stmt;
		try {
			if(con != null){
				String query = "select * from Emp";
				System.out.println(query);
				stmt=con.createStatement();  
				ResultSet rs=stmt.executeQuery(query);
				if(rs != null){
					System.out.println("ResultSet");
					while(rs.next()){
						Emp u = new Emp();
						u.setName(rs.getString(1));
						u.setPassword(rs.getString(2));
						u.setGender(rs.getString(3));
						u.setPhone(rs.getString(4));
						u.setAge(rs.getString(5));
						u.setDepartment(rs.getString(6));
						u.setProject(rs.getString(7));
						query = "select * from Address where id = \""+u.getName()+"\"";
						System.out.println(query);
						stmt=con.createStatement();  
						ResultSet AdressRs=stmt.executeQuery(query);
						if(AdressRs != null){
							System.out.println("ResultSet Address");
							while(AdressRs.next()){
								u.setAddress(rs.getString(2));
								u.setCity(rs.getString(3));
								u.setState(rs.getString(4));
							}
						}
						list.add(u);						
					}
				}
				stmt.close();
				//con.commit();
				//con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Department> getDepList(){
		List<Department> list = new ArrayList<Department>();
		Connection con = DB.connection;
		Statement stmt;
		try {
			if(con != null){
				String query = "select * from Department";
				System.out.println(query);
				stmt=con.createStatement();  
				ResultSet rs=stmt.executeQuery(query);
				if(rs != null){
					System.out.println("ResultSet");
					while(rs.next()){
						Department dept = new Department();
						dept.setId(rs.getString(1));
						dept.setdName(rs.getString(2));
						dept.setdLoc(rs.getString(3));
						list.add(dept);						
					}
				}
				stmt.close();
				//con.commit();
				//con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static List<Project> getProjList(){
		List<Project> list = new ArrayList<Project>();
		Connection con = DB.connection;
		Statement stmt;
		try {
			if(con != null){
				String query = "select * from Project";
				System.out.println(query);
				stmt=con.createStatement();  
				ResultSet rs=stmt.executeQuery(query);
				if(rs != null){
					System.out.println("ResultSet");
					while(rs.next()){
						Project proj = new Project();
						proj.setId(rs.getString(1));
						proj.setpName(rs.getString(2));
						proj.setpDetails(rs.getString(3));
						list.add(proj);						
					}
				}
				stmt.close();
				//con.commit();
				//con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static void setListToSession(HttpServletRequest request) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		List<Emp> list = DB.getUsersList();
		System.out.println(list.size());
		System.out.println(mapper.writeValueAsString(list));
		(request.getSession()).setAttribute("list",mapper.writeValueAsString(list));
		List<Department> depList = DB.getDepList();
		System.out.println(depList.size());
		System.out.println(mapper.writeValueAsString(depList));
		(request.getSession()).setAttribute("depList",mapper.writeValueAsString(depList));
		List<Project> projList = DB.getProjList();
		System.out.println(projList.size());
		System.out.println(mapper.writeValueAsString(projList));
		(request.getSession()).setAttribute("projList",mapper.writeValueAsString(projList));
	}
}
