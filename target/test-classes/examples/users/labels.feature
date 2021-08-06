Feature: sample karate test script    
If you are using Eclipse, install the free Cucumber-Eclipse plugin from
https://cucumber.io/cucumber-eclipse/
    Then you will see syntax-coloring for this file. But best of all,
    you will be able to right-click within this file and [Run As -> Cucumber Feature].
    If you see warnings like "does not have a matching glue code",
    go to the Eclipse preferences, find the 'Cucumber User Settings'
    and enter the following Root Package Name: com.intuit.karate    
    Refer to the Cucumber-Eclipse wiki for more: http://bit.ly/2mDaXeV

Background:
    * url 'https://api.todoist.com/rest/v1/'
    * def headerData = { 'Content-Type' : 'application/json', 'Authorization': 'Bearer 676f2c4e5c1eca97a5559e55b8233b37427fc913'}
    * headers headerData

Scenario: Create a label, update it and delete it
    Given path 'labels'
    When request { name : "Regular" }
    When method post
    Then status 200
        And match response contains {id: '#number'}

* def newLabelId = response.id

    Given path 'labels',response.id
    And headers headerData
    When request { name : 'Special' }
    When method post
    Then status 204
    
    Given path 'labels', newLabelId
    And headers headerData
    When method delete
    Then status 204
