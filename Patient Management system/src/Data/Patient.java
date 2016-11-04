package Data;

import java.util.List;

public class Patient {

	/**
	 * 
	 */
	public String PatientID;
	/**
	 * 
	 */
	public String FirstName;
	/**
	 * 
	 */
	public String LastName;
	/**
	 * 
	 */
	public String Email;
	/**
	 * 
	 */
	public String Password;
	/**
	 * 
	 */
	public String Address;
	/**
	 * 
	 */
	public String DateOfBirth;
	/**
	 * 
	 */
	public String Ans1;
	/**
	 * 
	 */
	public String Ans2;
	/**
	 * 
	 */
	public String Gender;
	/**
	 * 
	 */
	public String Phone;
	/**
	 * 
	 */
	public List<SuggestedTest> suggestedTest;
	/**
	 * 
	 */
	public List<TestReport> testReport;
	/**
	 * 
	 */
	public List<Prescription> prescription;
	/**
	 * Getter of PatientID
	 */
	public String getPatientID() {
	 	 return PatientID; 
	}
	/**
	 * Setter of PatientID
	 */
	public void setPatientID(String PatientID) { 
		 this.PatientID = PatientID; 
	}
	/**
	 * Getter of FirstName
	 */
	public String getFirstName() {
	 	 return FirstName; 
	}
	/**
	 * Setter of FirstName
	 */
	public void setFirstName(String FirstName) { 
		 this.FirstName = FirstName; 
	}
	/**
	 * Getter of LastName
	 */
	public String getLastName() {
	 	 return LastName; 
	}
	/**
	 * Setter of LastName
	 */
	public void setLastName(String LastName) { 
		 this.LastName = LastName; 
	}
	/**
	 * Getter of Email
	 */
	public String getEmail() {
	 	 return Email; 
	}
	/**
	 * Setter of Email
	 */
	public void setEmail(String Email) { 
		 this.Email = Email; 
	}
	/**
	 * Getter of Password
	 */
	public String getPassword() {
	 	 return Password; 
	}
	/**
	 * Setter of Password
	 */
	public void setPassword(String Password) { 
		 this.Password = Password; 
	}
	/**
	 * Getter of Address
	 */
	public String getAddress() {
	 	 return Address; 
	}
	/**
	 * Setter of Address
	 */
	public void setAddress(String Address) { 
		 this.Address = Address; 
	}
	/**
	 * Getter of DateOfBirth
	 */
	public String getDateOfBirth() {
	 	 return DateOfBirth; 
	}
	/**
	 * Setter of DateOfBirth
	 */
	public void setDateOfBirth(String DateOfBirth) { 
		 this.DateOfBirth = DateOfBirth; 
	}
	/**
	 * Getter of SecurityA1
	 */
	public String getAns1() {
	 	 return Ans1; 
	}
	/**
	 * Setter of SecurityA1
	 */
	public void setAns1(String SecurityA1) { 
		 this.Ans1 = SecurityA1; 
	}
	/**
	 * Getter of SecurityA2
	 */
	public String getAns2() {
	 	 return Ans2; 
	}
	/**
	 * Setter of SecurityA2
	 */
	public void setAns2(String Ans2) { 
		 this.Ans2 = Ans2; 
	}
	/**
	 * Getter of Gender
	 */
	public String getGender() {
	 	 return Gender; 
	}
	/**
	 * Setter of Gender
	 */
	public void setGender(String Gender) { 
		 this.Gender = Gender; 
	}
	/**
	 * Getter of Phone
	 */
	public String getPhone() {
	 	 return Phone; 
	}
	/**
	 * Setter of Phone
	 */
	public void setPhone(String Phone) { 
		 this.Phone = Phone; 
	}
	/**
	 * Getter of suggestedTest
	 */
	public List<SuggestedTest> getSuggestedTest() {
	 	 return suggestedTest; 
	}
	/**
	 * Setter of suggestedTest
	 */
	public void setSuggestedTest(List<SuggestedTest> suggestedTest) { 
		 this.suggestedTest = suggestedTest; 
	}
	/**
	 * Getter of testReport
	 */
	public List<TestReport> getTestReport() {
	 	 return testReport; 
	}
	/**
	 * Setter of testReport
	 */
	public void setTestReport(List<TestReport> testReport) { 
		 this.testReport = testReport; 
	}
	/**
	 * Getter of prescription
	 */
	public List<Prescription> getPrescription() {
	 	 return prescription; 
	}
	/**
	 * Setter of prescription
	 */
	public void setPrescription(List<Prescription> prescription) { 
		 this.prescription = prescription; 
	}
	/**
	 * 
	 * @param FirstName 
	 * @param LastName 
	 * @param Password 
	 * @return 
	 */
	public boolean UpdateProfile(String FirstName, String LastName, String Password) { 
		// TODO Auto-generated method
		return false;
	 }
	/**
	 * 
	 * @param Ans1 
	 * @param Ans2 
	 */
	public void RetrieveSecurityAns(String SecurityA1, String SecurityA2) { 
		// TODO Auto-generated method
	 }
	/**
	 * 
	 * @return 
	 */
	public String RetrievePassword() { 
		// TODO Auto-generated method
		return null;
	 }
	/**
	 * 
	 * @param PatientID 
	 * @return 
	 */
	public String RetrievePatientProfile(String PatientID) { 
		// TODO Auto-generated method
		return null;
	 }
	/**
	 * 
	 * @param FirstName 
	 * @param LastName 
	 * @param Email 
	 * @param Password 
	 */
	public void addNewPatient(String FirstName, String LastName, String Email, String Password) { 
		// TODO Auto-generated method
	 } 

}
