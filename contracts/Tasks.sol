pragma solidity ^0.4.18;

contract TaskVoting {
/********************ПЕРЕМЕННЫЕ********************/
    uint taskQuantity = 0;
    mapping(uint => Task) arrayOfTasks;
    mapping(address =>  mapping(uint => bool)) arrayOfVotingStates;
    struct Task{
        uint32 condition;/*0 - предложена, 1 - одобрена, 2 - в работе, 3 - готова*/
        uint positiveVotesNumber;
        string Description;
    }
    address[] memberAddresses = [
         0xB1e131814EB84c33957f4214e9E13196C9BD7e08
        ];
    
/********************ФУНКЦИИ************************/
    
    function createTask(string _description) public{
    arrayOfTasks[taskQuantity] = Task({
            condition: 0,
            positiveVotesNumber: 0,
            Description: _description
        });
    
    taskQuantity++;
    }
    
    function taskInformation(uint _taskNumber) public view returns(uint, uint, string){
        return(arrayOfTasks[_taskNumber].condition, arrayOfTasks[_taskNumber].positiveVotesNumber, arrayOfTasks[_taskNumber].Description);
    }
    
    function Vote(uint _taskNumber,bool _decision) public {
        
        if (_decision == true && arrayOfVotingStates[msg.sender][_taskNumber] == false){
        arrayOfTasks[_taskNumber].positiveVotesNumber ++;
        }
        arrayOfVotingStates[msg.sender][_taskNumber] = true;
        
        if (arrayOfTasks[_taskNumber].positiveVotesNumber>memberAddresses.length/2){
            arrayOfTasks[_taskNumber].condition = 1 ;
        }
    }
    

    
}

