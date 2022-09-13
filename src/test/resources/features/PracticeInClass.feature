
@tag regression
Feature: we are going to create an account 
  

	# we are going to create account a name and info provided by us
	# 1- generate a token
	# 2- create an account and pass the token that we just created
	# 3- make another call and make sure that account is in the database
	# 4- assert that account is created - print along the way
  Scenario: create account
    Given url "https://tek-insurance-api.azurewebsites.net"
     And path "/api/token"
      And request {"username": "supervisor","password": "tek-supervisor"}
      And method post
      Then status 200
      * def genToken = response.token
      * print response
      * print genToken
      
      
       Given path "/api/accounts/add-primary-account"
       And request
      """   
      {
      "email": "#(sacsac.inclass321@gmail.com)",
      "title": "Mr.",
      "firstName": "#(Jack)",
      "lastName": "#(Ma)",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "CEO",
      "dateOfBirth": "#(1990-01-01)"
      }
      """
    And header Authorization = "Bearer " + genToken 
    When method post
    Then status 201
    * def pPersonID = response.id
    * print pPersonID
    * print response 
   
   Then path "/api/accounts/get-primary-account"
   And header Authorization = "Bearer " + genToken
   And param primaryPersonId = pPersonID
   And method get
   Then status 200
   * print response
   * print response.email
   Then assert response.email == "sacsac.inclass321@gmail.com"
      
    
   