Feature: This feature file is used for communication with TestRail

  Background:Some background
  * def foo = 'hello'

    * configure afterScenario =
    """
    () => {
    var info = karate.info;
    var runId = 27;
    console.log("function afterscenario running happily");
    var auth = 'colouredpages@gmail.com' + ':' + 'Ckj8g29LcmmzSrZbE5Dh';
    var baseUrl = 'https://abhijeetpersonal.testrail.io/index.php?/';
    var header = {
            'Authorization': 'Basic '+auth,
            'Content-Type': 'application/json;charset=utf-8'
          };
     if(Karate.scenarioName === 'Create a label, update it and delete it'){
        var caseId = 'T115';
        var statusId = 1;
        if(!(Karate.errorMessage === null)) {
          statusId = 5;
        }

        fetch(`${baseUrl}api/v2/add_result_for_case/${runId}/${caseId}`,
        {
          headers: header,
          method: 'POST',
          status_id : statusId,
          comment: 'using karate',
        }).then((res) => {
          console.log(res);
        });
     }
     if(Karate.scenarioName === 'get all projects of a user'){
        var caseId = 'T116';
        var statusId = 1;
        if(!(Karate.errorMessage === null)) {
          statusId = 5;
        }
        fetch(`${baseUrl}api/v2/add_result_for_case/${runId}/${caseId}`,
        {
          headers: header,
          method: 'POST',
          status_id : statusId,
          comment: 'using karate',
        }).then((res) => {
          console.log(res);
        });
     }
     if(Karate.scenarioName === 'Add a new Project and add a new task to it and delete'){
        var caseId = 'T117';
        var statusId = 1;
        if(!(Karate.errorMessage === null)) {
          statusId = 5;
        }
        fetch(`${baseUrl}api/v2/add_result_for_case/${runId}/${caseId}`,
        {
          headers: header,
          method: 'POST',
          status_id : statusId,
          comment: 'using karate',
        }).then((res) => {
          console.log(res);
        });
     }
     if(Karate.scenarioName === 'Add a project, add a task and Change task due date, delete project'){
        var caseId = 'T118';
        var statusId = 1;
        if(!(Karate.errorMessage === null)) {
          statusId = 5;
        }
        fetch(`${baseUrl}api/v2/add_result_for_case/${runId}/${caseId}`,
        {
          headers: header,
          method: 'POST',
          status_id : statusId,
          comment: 'using karate',
        }).then((res) => {
          console.log(res);
        });
     }
     if(Karate.scenarioName === 'Add a project, add a task and close it, reopen it'){
        var caseId = 'T119';
        var statusId = 1;
        if(!(Karate.errorMessage === null)) {
          statusId = 5;
        }
        fetch(`${baseUrl}api/v2/add_result_for_case/${runId}/${caseId}`,
        {
          headers: header,
          method: 'POST',
          status_id : statusId,
          comment: 'using karate',
        }).then((res) => {
          console.log(res);
        });
     }
     }
    """
Scenario: testing
  * print 'foofoofoofoofoofoofoofoo'