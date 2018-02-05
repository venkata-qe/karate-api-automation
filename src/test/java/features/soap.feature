Feature: test soap end point

  Background:

    * def signIn = call read('signin.feature') { username: 'ven21@qaw.com', password: 'halifax3Bv9csbUQgHt6OcSBvH37th9SS' }
    * def serverUrl = signIn.serverUrl
    * def sessionId = signIn.sessionId

  Scenario: Create an account
    Given url serverUrl
    And request read('create-account-request.xml')
    When soap action 'create'
    Then status 200
    And print karate.prettyXml(response)
    And def result = karate.prettyXml(response)
    And print responseTime
    And assert responseTime < 10000
    And match //createResponse/result/id == '#string'
    And match //createResponse/result/success == 'true'