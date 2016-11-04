package BusinessLogic;


import Data.*;

import java.sql.* ;
import java.util.ArrayList;
import java.io.IOException ;

import static Data.Provider.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/ViewDoctor")
public class ViewDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		Connection con =null;
		try 
        {
    		Class.forName(DRIVER);
			con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			request.getSession();
			
			String Satatement10 = "SELECT * FROM PMS.Doctor";
	        PreparedStatement ps10 = con.prepareStatement(Satatement10);                   
	        ResultSet lasso = ps10.executeQuery();

	        
	        ArrayList<Doctor> bala = new ArrayList<Doctor>();

	        while (lasso.next())
	        {
	        	Doctor tol = new Doctor();
	        	tol.FirstName = lasso.getString(2);
	        	tol.LastName = lasso.getString(3);
	        	tol.DateOfBirth = lasso.getString(4);
	        	tol.Gender = lasso.getString(5);
	        	tol.Email = lasso.getString(6);
	        	tol.Phone = lasso.getString(7);
	        	tol.Address = lasso.getString(8);
	        	tol.Specialization = lasso.getString(9);
	        	tol.YearsOfExperience = lasso.getInt(10);
	        	tol.Schedule = lasso.getString(11);
	        	bala.add(tol);

	        }
	        
	        request.setAttribute("resultd", bala);


	        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewDoctor.jsp");
            dispatcher.forward(request, response);

        
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayError.jsp");
            dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayError.jsp");
            dispatcher.forward(request, response);
		} finally {
			if(con != null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
  
	}

}
