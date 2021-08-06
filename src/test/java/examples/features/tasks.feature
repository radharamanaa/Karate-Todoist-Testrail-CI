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
    * def headerData = { 'Content-Type' : 'application/json', 'Authorization': 'Bearer token'}
    * headers headerData

Scenario: get all projects of a user

Given path 'projects'
When method get
Then status 200
    And match response[0] contains { id: '#number'}

Scenario: Add a new Project and add a new task to it and delete

    Given path 'projects'
    When request { "name": 'Groceries List'}
    When method post
    Then status 200
        And match response contains { "id": '#number', "name" : '#string'}

    Given path 'tasks'
    And headers headerData
    When request { "content": "Buy Potatoes", "project_id" : #(response.id) }
    When method post
    Then status 200
        And match response contains { "id" : '#number', "content" : '#string'}

    Given path 'tasks',response.id
    And headers headerData
    When method delete
    Then status 204

Scenario: Add a project, add a task and Change task due date,delete project
    Given path 'projects'
    When request { "name": 'Shopping List'}
    When method post
    Then status 200
        And match response contains { "id": '#number', "name" : '#string'}
* def newProjectId = response.id

    Given path 'tasks'
    And headers headerData
    When request { "content": "Buy Bread", "project_id" : #(newProjectId) }
    When method post
    Then status 200
        And match response contains { "id" : '#number', "content" : '#string'}

    Given path 'tasks', response.id
    And headers headerData
    When request { "due_string" : 'tomorrow' }
    When method post
    Then status 204

    Given path 'projects',newProjectId
    And headers headerData
    When method delete
    Then status 204
    
Scenario: Add a project, add a task and close it, reopen it
    Given path 'projects'
    When request { "name": 'Videos Ideas list'}
    When method post
    Then status 200
        And match response contains { "id": '#number', "name" : '#string'}

* def newProjectId = response.id

    Given path 'tasks'
    And headers headerData
    When request { "content": "How to excel chess!", "project_id" : #(newProjectId) }
    When method post
    Then status 200
        And match response contains { "id" : '#number', "content" : '#string'}

* def newTaskId = response.id

    Given path 'tasks',newTaskId,'close'
    And headers headerData
    # added below line since karate was asking to do so
    When request {}
    When method post
    Then status 204

    Given path 'tasks',newTaskId, 'reopen'
    And headers headerData
    # added below line since karate was asking to do so
    When request {}
    When method post
    Then status 204


