package BusinessLogic;

import java.sql.* ;
import Data.*;
import java.io.IOException ;
import static Data.Provider.*;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotPassword() {
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
		Patient bala = new Patient();
    	bala.Email = request.getParameter("UserID");
    	bala.Ans1 = request.getParameter("Ans1");
    	bala.Ans2 = request.getParameter("Ans2");
        
    	try 
        {
    		Class.forName(DRIVER);
			Connection con = DriverManager.getConnection(CONNECTION_URL, USERNAME, PASSWORD);
			System.out.println("Connected database successfully...");
			
			String Satatement1 = "SELECT * FROM PMS.Patient WHERE Email='" + bala.Email + "'AND Ans1='" + bala.Ans1 + "'AND Ans2='" + bala.Ans2 + "'";
	        PreparedStatement ps1 = con.prepareStatement(Satatement1);                   
	        ResultSet rs1 = ps1.executeQuery();
	        
	        String Satatement2 = "SELECT * FROM PMS.Doctor WHERE Email='" + bala.Email + "'AND Ans1='" + bala.Ans1 + "'AND Ans2='" + bala.Ans2 + "'";
	        PreparedStatement ps2 = con.prepareStatement(Satatement2);                   
	        ResultSet rs2 = ps2.executeQuery();
	        
	        if (rs1.next() && !rs2.next() )
	        {	            
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPasswordSuccess.jsp");
	            dispatcher.forward(request, response);
	            
	            final String username = "email_username";
	            final String password = "email_password";

	            Properties props = new Properties();
	            props.put("mail.smtp.auth", "true");
	            props.put("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.host", "smtp.gmail.com");
	            props.put("mail.smtp.port", "587");

	            Session session = Session.getInstance(props,
	              new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() 
	                {
	                    return new PasswordAuthentication(username, password);
	                }
	              });

	            try 
	            {

	                Message message = new MimeMessage(session);
	                message.setFrom(new InternetAddress("pms@gmail.com"));
	                message.setRecipients(Message.RecipientType.TO,
	                    InternetAddress.parse(bala.Email));
	                message.setSubject("PMS Password Recovery !!!");
	                message.setText("Dear Mail Crawler,"
	                    + "\n\n No spam to my email, please!");

	                Transport.send(message);
	            } catch (MessagingException e) {
	                throw new RuntimeException(e);
	            }   
	            
	        }
	        else if (rs2.next() && !rs1.next() )
	        {
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPasswordSuccess.jsp");
	            dispatcher.forward(request, response);
	        }
	        else
	        {
	        	RequestDispatcher dispatcher = request.getRequestDispatcher("ForgotPasswordFailed.jsp");
	            dispatcher.forward(request, response);
	        }
	        
	      
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

