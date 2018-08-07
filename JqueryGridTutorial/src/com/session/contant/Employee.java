package com.session.contant;

public class Employee {
	
	
	
	protected String firstName;
	  protected String lastName;
	  protected String username;
	  protected String email;
	  protected String country;
	  

	  public String getFirstName () {
	  return (firstName);
	  }
	  public String getLastName (){
	  return (lastName);
	  }  
	  public String getUsername () {
	  return (username);
	  }  
	  public String getEmail() {
	  return (email);
	  }
	  
	  public String getState () {
	  return (email);
	  } 
	  
	  public String getCountry () {
	  return (country);
	  }  

	  public void setFirstName (String newFirstName)
	 {
	  firstName = newFirstName;
	  }
	  public void setLastName (String newLastName)
	  {
	  lastName = newLastName;
	  }

	 public void setUsername (String newUsername)
	 {
	  username = newUsername;
	  }

	  public void setEmail (String newEmail)
	  {
	  email = newEmail;
	  } 
	  
	  public void setCountry(String newCountry)
	  {
	  country = newCountry;
	  } 


	  }