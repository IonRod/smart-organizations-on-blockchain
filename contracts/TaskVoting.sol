pragma solidity ^0.4.18;
/*
contract TaskContract{
    string wordDescription;
    
    function appointProperties(string _wordDescription) public {
        wordDescription = _wordDescription;
    }
    
}*/




contract TaskVoting {
/********************ПЕРЕМЕННЫЕ********************/
    uint public taskQuantity = 0;
    mapping(uint => Task) arrayOfTasks;
    mapping(address =>  mapping(uint => bool)) arrayOfVotingStates;
    
    struct Task {
        uint32 condition;/*0 - предложена, 1 - одобрена, 2 - в процессе голосования, 3 - в работе, 4 - готова*/
        string Description;
    }

    address[] memberAddresses = [0xfd0f031604caf1165b43d9aff21d56e0925b95ad, 0x913bb748596b185c5aafc456a972fd2579475536];
    
/********************ФУНКЦИИ************************/
    
    function createTask(string _description) public {
      arrayOfTasks[taskQuantity] = Task({
              condition: 0,
              Description: _description
          });
      taskQuantity++;
    }
    
    function taskInformation(uint _taskNumber) public view returns(uint, string) {
        return(arrayOfTasks[_taskNumber].condition, arrayOfTasks[_taskNumber].Description);
    }
    
    function Vote(uint _taskNumber,bool _decision) public {
        arrayOfVotingStates[msg.sender][_taskNumber] = _decision;
    }
    
}