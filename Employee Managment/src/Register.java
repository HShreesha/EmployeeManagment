

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setAttribute("error","");
		String method = (String)request.getParameter("method");
		System.out.println(method);
		if(method != null && method.equalsIgnoreCase("addDep")){
			String depId = (String)request.getParameter("depId");
			String dName = (String)request.getParameter("dName");
			String dLoc = (String)request.getParameter("dLoc");
			System.out.println(depId + " :: " +dName + " :: " +dLoc);
			request.setAttribute("error","");
			String error = "";
			if(!(depId != null && !depId.trim().equals(""))){
				error += "Invalid Id  ";
			}
			if(!(dName != null && !dName.trim().equals(""))){
				error += "Invalid Department Name  ";
			}
			if(!(error.length() > 0)){
				Connection con = DB.connection;
				PreparedStatement stmt;
				try {
					if(con != null){
						String query = "insert into Department (id,Dname,Dloc) values (\""+depId+"\",\""+dName+"\",\""+dLoc+"\")";
						System.out.println(query);
						stmt = con.prepareStatement(query);				
						stmt.executeUpdate();
						stmt.close();
						//con.commit();
						//con.close();
						request.setAttribute("error","Department Added!!");
						request.getRequestDispatcher("department.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					error += "Department exists or failed to update  ";
					e.printStackTrace();
					request.setAttribute("error",error);
					request.getRequestDispatcher("department.jsp").include(request, response);
				}
			}else{
				request.setAttribute("error",error);
				request.getRequestDispatcher("department.jsp").include(request, response);
			}
		}
		else if(method != null && method.equalsIgnoreCase("addProj")){
			String projId = (String)request.getParameter("projId");
			String projName = (String)request.getParameter("projName");
			String projLoc = (String)request.getParameter("projLoc");
			System.out.println(projId + " :: " +projName + " :: " +projLoc);
			request.setAttribute("error","");
			String error = "";
			if(!(projId != null && !projId.trim().equals(""))){
				error += "Invalid Id  ";
			}
			if(!(projName != null && !projName.trim().equals(""))){
				error += "Invalid Name  ";
			}
			if(!(error.length() > 0)){
				Connection con = DB.connection;
				PreparedStatement stmt;
				try {
					if(con != null){
						String query = "insert into Project (id,Pname,Pdetails) values (\""+projId+"\",\""+projName+"\",\""+projLoc+"\")";
						System.out.println(query);
						stmt = con.prepareStatement(query);				
						stmt.executeUpdate();
						stmt.close();
						//con.commit();
						//con.close();
						request.setAttribute("error","Project Added!!");
						request.getRequestDispatcher("project.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					error += "Project exists or failed to update  ";
					e.printStackTrace();
					request.setAttribute("error",error);
					request.getRequestDispatcher("project.jsp").include(request, response);
				}
			}else{
				request.setAttribute("error",error);
				request.getRequestDispatcher("project.jsp").include(request, response);
			}
		}else if(method != null && method.equalsIgnoreCase("addEmp")){
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
			System.out.println(method);
			request.setAttribute("error","");
			String error = "";
			if(!(name != null && !name.trim().equals(""))){
				error += "Invalid Name  ";
			}
			if(!(password != null && !password.trim().equals(""))){
				error += "Invalid password  ";
			}
			if(!(error.length() > 0)){
				Connection con = DB.connection;
				PreparedStatement stmt;
				try {
					if(con != null){
						String query = "insert into Emp (name,password,gender,phone,age,department,project) values (\""+name+"\",\""+password+"\",\""+gender+"\",\""+phone+"\",\""+age+"\","+department+","+project+")";
						System.out.println(query);
						stmt = con.prepareStatement(query);				
						stmt.executeUpdate();
						query = "insert into Address (id,address,city,state) values (\""+name+"\",\""+address+"\",\""+city+"\",\""+state+"\")";
						System.out.println(query);
						stmt = con.prepareStatement(query);				
						stmt.executeUpdate();
						stmt.close();
						//con.commit();
						//con.close();
						request.setAttribute("error","Emp Added!!");
						request.getRequestDispatcher("register.jsp").forward(request, response);
					}
				} catch (SQLException e) {
					error += "Emp exists or failed to update  ";
					e.printStackTrace();
					request.setAttribute("error",error);
					request.getRequestDispatcher("register.jsp").include(request, response);
				}
			}else{
				request.setAttribute("error",error);
				request.getRequestDispatcher("register.jsp").include(request, response);
			}
		}
		try {
			DB.setListToSession(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("register.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
