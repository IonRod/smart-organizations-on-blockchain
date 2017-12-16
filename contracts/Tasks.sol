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
    uint taskQuantity = 0;
    mapping(uint => Task) arrayOfTasks;
    mapping(address =>  mapping(uint => bool)) arrayOfVotingStates;
    
    struct Task{
        uint32 condition;/*0 - предложена, 1 - одобрена, 2 - в процессе голосования, 3 - в работе, 4 - готова*/
        string Description;
    }

    address[] memberAddresses = [
         0x6355acb5eea159a8fd3831be4ce00b58688490b9,
         0x6b181fc2d5725bd2e13c2b2084e79d6b5b9b0323
        ];
    
/********************ФУНКЦИИ************************/
    
    function createTask(string _description) public{
    arrayOfTasks[taskQuantity] = Task({
            condition: 0,
            Description: _description
        });
    taskQuantity++;
    }
    
    function taskInformation(uint _taskNumber) public view returns(uint, string){
        return(arrayOfTasks[_taskNumber].condition, arrayOfTasks[_taskNumber].Description);
    }
    
    function Vote(uint _taskNumber,bool _decision) public {
        arrayOfVotingStates[msg.sender][_taskNumber] = _decision;
    }
    
}