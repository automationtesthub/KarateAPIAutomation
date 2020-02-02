Feature: Test All employee functionality




@regression @sanity @smoke
Scenario: Get all emp details from csv
Given url "http://dummy.restapiexample.com/api/v1/employees"
When method get
* print request
Then status 200
* print response

@regression @sanity
Scenario Outline: Create , update and delete emp
Given url "http://dummy.restapiexample.com/api/v1/create"
* def myJson = {"name":"<name>","salary":"<salary>","age":"<age>"}
And request myJson
When method post
* print myJson
Then status 200
* print response
And match response contains {"status": "success"}
And match response contains {"status":"#string","data":{"name":"#string","salary":"#string","age":"#string","id":#number}}
* def idval = get response.data.id
* print idval
##########################update scenario#######################################
Given url "http://dummy.restapiexample.com/api/v1/update/"+idval
* def myJson = 	{"name":"<name1>","salary":"<salary1>","age":"<age1>"}
And request myJson
When method put
* print myJson
Then status 200
* print response
And match response contains {"status": "success"}
And match response contains {"status":"#string","data":{"employee_name":"#string","employee_salary":"#string","employee_age":"#string","id":#number}}
* def idval = get response.data.id
* print idval
##########################Delete scenario#######################################
Given url "http://dummy.restapiexample.com/api/v1/delete/"+idval
When method delete
Then status 200
* print response
And match response contains {"status": "success","message": "successfully! deleted Records"}


Examples:
|read('Data.csv')|
