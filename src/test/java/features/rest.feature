Feature: sample karate test script

    Background:

  Background:

    Given url 'https://login.salesforce.com/services/Soap/c/41.0'
    And def loginCredentials = { userName: 'ven21@qaw.com', passWord: halifax3Bv9csbUQgHt6OcSBvH37th9SS}
    And request
  """
  <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:enterprise.soap.sforce.com">
      <soapenv:Body>
            <urn:login>
               <urn:username>#(loginCredentials.userName)</urn:username>
               <urn:password>#(loginCredentials.passWord)</urn:password>
            </urn:login>
      </soapenv:Body>
  </soapenv:Envelope>
  """
    When soap action 'login'

    Then status 200

    And print karate.prettyXml(response)

    And def result = karate.prettyXml(response)

    And def sessionId = //sessionId
    And print sessionId


#  Scenario: get customer account
#    Given header Authorization = 'Bearer' + ' ' + sessionId
#    And url 'https://eu8.my.salesforce.com/services/data/v41.0/sobjects/Account/0010N000048656y'
#    When method get
#    Then status 200
#    And print karate.pretty(response)

  Scenario: create customer account
    Given header Authorization = 'Bearer' + ' ' + sessionId
    And url 'https://eu8.my.salesforce.com/services/data/v41.0/sobjects/account'
    And request { Name: 'Investments' }
    When method post
    Then status 201
    And print karate.pretty(response)
    And match header Content-Type == 'application/json;charset=UTF-8'
    And match response == "#notnull"
    And match response.id == "#notnull"
    And match response.success == "true"
    And match response == { id: '#string', success: 'true', errors: '#notnull', warnings: "#notnull"}







