import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import User.Department;
import User.Emp;
import User.Project;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = (String)request.getParameter("name");
		String password = (String)request.getParameter("password");
		request.setAttribute("error","");
		System.out.println(name + " :::: "+ password);
		if(name != null && !name.trim().equals("") && password != null && !password.trim().equals("")){
			System.out.println("Valid Inputs");
			Connection con = DB.connection;
			Statement stmt;
			try {
				if(con != null){
					String query = "select password from Emp where name = '"+name+"'";
					System.out.println(query);
					stmt=con.createStatement();  
					ResultSet rs=stmt.executeQuery(query);
					if(rs != null && rs.next()){
						System.out.println("ResultSet");
						//rs.next();
						String pass = rs.getString(1);
						System.out.println(password +" :: "+pass);
						if(password.equals(pass)){
							System.out.println("Password");
							try {
								DB.setListToSession(request);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							//System.out.println(request.getAttribute("projList"));
							request.getRequestDispatcher("users.jsp").include(request, response);
						}else{
							System.out.println("wrong password");
							request.setAttribute("error","invalid password");
							request.getRequestDispatcher("index.jsp").include(request, response);
						}
					}else{
						request.setAttribute("error","No Emp Found");
						request.getRequestDispatcher("index.jsp").include(request, response);
					}
					stmt.close();
					//con.commit();
					//con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			request.setAttribute("error","Invalid name/password");
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
