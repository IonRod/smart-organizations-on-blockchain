pragma solidity ^0.4.18;

contract TaskVoting {
/********************ПЕРЕМЕННЫЕ********************/
    uint public taskQuantity = 0;
    mapping(uint => Task) arrayOfTasks;
    mapping(address =>  mapping(uint => bool)) arrayOfVotingStates;
    struct Task{
        uint32 condition;/*0 - предложена, 1 - одобрена, 2 - в работе, 3 - готова*/
        uint positiveVotesNumber;
        string Description;
    }
    address[] memberAddresses = [
         0x108d3d2ac5926977c69da2e6342bdc99de38e3f1, 0x38f491cb707daf3d9bfdcc60f18ad139fe87eabb
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

