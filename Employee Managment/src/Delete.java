

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import User.Emp;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String method = (String)request.getParameter("method");
		System.out.println(method);
		if(method != null && method.equalsIgnoreCase("addDep")){
			String id = (String)request.getParameter("depId");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "delete from Department where id = "+id;
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close(); 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				DB.setListToSession(request);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("viewDept.jsp").include(request, response);
		}else if(method != null && method.equalsIgnoreCase("addProj")){
			String id = (String)request.getParameter("projId");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "delete from Project where name = "+id;
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close(); 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				DB.setListToSession(request);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("viewProj.jsp").include(request, response);
		}else{
			String name = (String)request.getParameter("name");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "delete from Emp where name = "+name;
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close(); 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				DB.setListToSession(request);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getRequestDispatcher("users.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
