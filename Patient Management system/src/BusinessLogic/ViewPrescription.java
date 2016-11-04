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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class Registration
 */
@WebServlet("/ViewPrescription")
public class ViewPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPrescription() {
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
			HttpSession session = request.getSession();
			String delo = (String) session.getAttribute("UserID");
			
			String Satatement10 = "SELECT * FROM PMS.Prescription WHERE PatientID = '" + delo + "'" ;
	        PreparedStatement ps10 = con.prepareStatement(Satatement10);                   
	        ResultSet lassani = ps10.executeQuery();

	        
	        ArrayList<Prescription> baloli = new ArrayList<Prescription>();

	        lassani.last();
	        
	        	Prescription tolo = new Prescription();
					tolo.PatientID = lassani.getString(2);
					tolo.DoctorID = lassani.getString(3);
					tolo.TestReportID = lassani.getInt(4);
					tolo.Prescription = lassani.getString(5);
	        	baloli.add(tolo);

	 
	        
	        request.setAttribute("resultj", baloli);


	        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewPrescription.jsp");
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
