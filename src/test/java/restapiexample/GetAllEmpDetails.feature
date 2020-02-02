Feature: Test All employee functionality




@regression @sanity
Scenario: Get all emp details
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
|name|salary|age|name1|salary1|age1|
|asds|234443|344|aaaaa|1111111|0001|
|asdw|234543|324|bbbbb|2222222|0002|
|ards|234243|354|aaaaa|3333333|0003|