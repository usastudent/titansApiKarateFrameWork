@Smoke @Regression
Feature: Security test. Token Generation test

 	@security
  Scenario: generate token with valid username and password.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  #2) Test API Endpoint "/api/token" with Invalid Username and valid password.
  # Status code should be 404 not found. and print the reponse.
  # and response errorMessage is "USER_NOT_FOUND"
  @negative 
  Scenario: generate token with invalid username and valid password.
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "invalid_user","password": "tek_supervisor"}
    When method post
    Then status 404
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "USER_NOT_FOUND"

  #3) Test API Endpoint "/api/token" with valid Username and invalid password.
  # Status code should be 400.
  # Response with "errorMessage": "Password Not Matched".
  @negative
  Scenario: generate Token with valid username and invalid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor","password": "tek-supervisor"}
    When method post
    Then status 400
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "Password Not Matched"
