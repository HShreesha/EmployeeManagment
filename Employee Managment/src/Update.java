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
 * Servlet implementation class Update
 */
@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
		request.setAttribute("error","");
		if(method != null && method.equalsIgnoreCase("addDep")){
			String deptId = (String)request.getParameter("depId");
			String dName = (String)request.getParameter("dName");
			String dLoc = (String)request.getParameter("dLoc");
			System.out.println(deptId + " :: " +dName + " :: " +dLoc);
			request.setAttribute("error","");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "update Department set id = '"+deptId+"', dname = '"+dName+"', Dloc = '"+dLoc+"' where id = '"+deptId+"'";
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close();
					System.out.println("Updated");
					try {
						DB.setListToSession(request);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					request.setAttribute("error","Department Updated!!");
					request.getRequestDispatcher("viewDept.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.getRequestDispatcher("viewDept.jsp").include(request, response);
			}
		}else if(method != null && method.equalsIgnoreCase("addProj")){
			String deptId = (String)request.getParameter("projId");
			String dName = (String)request.getParameter("pName");
			String dLoc = (String)request.getParameter("pDetails");
			System.out.println(deptId + " :: " +dName + " :: " +dLoc);
			request.setAttribute("error","");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "update Project set id = '"+deptId+"', pname = '"+dName+"', pDetails = '"+dLoc+"' where id = '"+deptId+"'";
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close();
					System.out.println("Updated");
					try {
						DB.setListToSession(request);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					request.setAttribute("error","Project Updated!!");
					request.getRequestDispatcher("viewProj.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.getRequestDispatcher("viewProj.jsp").include(request, response);
			}
		}else{
			String name = (String)request.getParameter("name");
			String password = (String)request.getParameter("password");
			String gender = (String)request.getParameter("gender");
			String phone = (String)request.getParameter("phone");
			String age = (String)request.getParameter("age");
			String address = (String)request.getParameter("address");
			String city = (String)request.getParameter("city");
			String state = (String)request.getParameter("state");
			String department = (String)request.getParameter("department");
			String project = (String)request.getParameter("project");
			System.out.println(name + " :: " +password + " :: " +gender + " :: " +phone + " :: " +age);
			System.out.println(address + " :: " +city + " :: " +state + " :: " +department + " :: " +project);
			request.setAttribute("error","");
			Connection con = DB.connection;
			PreparedStatement stmt;
			try {
				if(con != null){
					String query = "update Emp set name = '"+name+"', password = '"+password+"', gender = '"+gender+"', phone = '"+phone+"', age = '"+age+"', department = '"+department+"', project = '"+project+"' where name = '"+name+"'";
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					query = "update Address set id = '"+name+"', address = '"+address+"', city = '"+city+"', state = '"+state+"' where id = '"+name+"'";
					System.out.println(query);
					stmt = con.prepareStatement(query);				
					stmt.executeUpdate();
					stmt.close();
					//con.commit();
					//con.close();
					System.out.println("Updated");
					try {
						DB.setListToSession(request);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					request.setAttribute("error","Emp Updated!!");
					request.getRequestDispatcher("users.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.getRequestDispatcher("users.jsp").include(request, response);
			}
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
