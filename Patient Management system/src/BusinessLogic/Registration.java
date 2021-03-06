package BusinessLogic;

import static Data.Provider.*;
import Data.*;

import java.sql.* ;
import java.io.IOException ;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		// TODO Auto-generated method stub
		
		Patient toto = new Patient();
        toto.FirstName =request.getParameter("FirstName");
        toto.LastName =request.getParameter("LastName");
        toto.DateOfBirth =request.getParameter("DateOfBirth");
        toto.Gender = request.getParameter("Gender");
        toto.Email = request.getParameter("Email");
        toto.Phone = request.getParameter("Phone");
        toto.Address = request.getParameter("Address");
        toto.Password = request.getParameter("Password");
        toto.Ans1 = request.getParameter("Ans1");
        toto.Ans2 = request.getParameter("Ans2");
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			String Satatement = "INSERT INTO PMS.Patient(FirstName, LastName, DateOfBirth, Gender, Email, Phone, Address, Password, Ans1, Ans2) VALUES('"+ toto.FirstName + "','" + toto.LastName + "','"+ toto.DateOfBirth + "','"+ toto.Gender + "','"+ toto.Email + "','"+ toto.Phone + "','"+ toto.Address + "','"+ toto.Password + "','"+ toto.Ans1 + "','"+ toto.Ans2 + "')";
	        PreparedStatement ps = con.prepareStatement(Satatement);                   
	        ps.executeUpdate();
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("RegisterSuccess.jsp");
            dispatcher.forward(request, response);
	      
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("InsertError.jsp");
            dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("InsertError.jsp");
            dispatcher.forward(request, response);
		}
        
        
        
	}

}
