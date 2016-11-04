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
@WebServlet("/AddPrescription")
public class AddPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPrescription() {
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
		
		Prescription tota = new Prescription();
        tota.PatientID =request.getParameter("PatientID");
        tota.DoctorID =request.getParameter("DoctorID");
        tota.TestReportID =Integer.parseInt(request.getParameter("TestReportID"));
        tota.Prescription = request.getParameter("Prescription");
        
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			String Satatement = "INSERT INTO PMS.Prescription(PatientID, DoctorID, TestReportID, Prescription) VALUES('"+ tota.PatientID + "','" + tota.DoctorID + "','"+ tota.TestReportID + "','"+ tota.Prescription + "')";
	        PreparedStatement ps = con.prepareStatement(Satatement);                   
	        ps.executeUpdate();
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("AddPrescriptionSuccess.jsp");
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
