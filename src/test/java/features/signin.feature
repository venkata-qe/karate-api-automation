Feature: sign in to the account

  Scenario: login and get the server url and session id

    Given url 'https://login.salesforce.com/services/Soap/c/41.0'
    And def loginCredentials = { userName: '#(username)', passWord: '#(password)'}
    And request read('loginrequest.xml')
    When soap action 'login'
    Then status 200
    And print karate.prettyXml(response)
    And def sessionId = //sessionId
    And print sessionId
    And def serverUrl = //serverUrl
    And print serverUrl