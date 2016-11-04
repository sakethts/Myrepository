package Data;

import java.util.List;

public class Doctor {

	/**
	 * 
	 */
	public String DoctorID;
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
	public String Specialization;
	/**
	 * 
	 */
	public int YearsOfExperience;
	/**
	 * 
	 */
	public String Schedule;
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
	 * Getter of DoctorID
	 */
	public String getDoctorID() {
	 	 return DoctorID; 
	}
	/**
	 * Setter of DoctorID
	 */
	public void setDoctorID(String DoctorID) { 
		 this.DoctorID = DoctorID; 
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
	public String Ans1() {
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
	public void setAns2(String SecurityA2) { 
		 this.Ans2 = SecurityA2; 
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
	 * Getter of PhoneNumber
	 */
	public String getPhone() {
	 	 return Phone; 
	}
	/**
	 * Setter of PhoneNumber
	 */
	public void setPhone(String Phone) { 
		 this.Phone = Phone; 
	}
	/**
	 * Getter of Specialization
	 */
	public String getSpecialization() {
	 	 return Specialization; 
	}
	/**
	 * Setter of Specialization
	 */
	public void setSpecialization(String Specialization) { 
		 this.Specialization = Specialization; 
	}
	/**
	 * Getter of YearsOfExperience
	 */
	public int getYearsOfExperience() {
	 	 return YearsOfExperience; 
	}
	/**
	 * Setter of YearsOfExperience
	 */
	public void setYearsOfExperience(int YearsOfExperience) { 
		 this.YearsOfExperience = YearsOfExperience; 
	}
	/**
	 * Getter of Schedule
	 */
	public String getSchedule() {
	 	 return Schedule; 
	}
	/**
	 * Setter of Schedule
	 */
	public void setSchedule(String Schedule) { 
		 this.Schedule = Schedule; 
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
	 * @param SecurityA1 
	 * @param SecurityA2 
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
	 * @param DoctorID 
	 * @return 
	 */
	public String RetrieveDoctorProfile(String DoctorID) { 
		// TODO Auto-generated method
		return null;
	 } 

}
