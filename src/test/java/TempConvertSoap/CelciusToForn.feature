Feature: Convert temperature

Background:
* url 'https://www.w3schools.com/xml/tempconvert.asmx'

Scenario: CelsiusToFahrenheit conversion
Given request 
"""
<?xml version="1.0" encoding="utf-8"?>
<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
  <soap:Body>
    <CelsiusToFahrenheit xmlns="https://www.w3schools.com/xml/">
      <Celsius>39</Celsius>
    </CelsiusToFahrenheit>
  </soap:Body>
</soap:Envelope>
"""
When soap action 'https://www.w3schools.com/xml/CelsiusToFahrenheit'
Then status 200
And match /Envelope/Body/CelsiusToFahrenheitResponse/CelsiusToFahrenheitResult == 102.2
And print 'response: ', response


Scenario: CelsiusToFahrenheit conversion from xml file
Given request read('Request.xml')
When soap action 'https://www.w3schools.com/xml/CelsiusToFahrenheit'
Then status 200
And match /Envelope/Body/CelsiusToFahrenheitResponse/CelsiusToFahrenheitResult == 102.2
And print 'response: ', response