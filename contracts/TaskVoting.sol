pragma solidity ^0.4.18;

contract TaskVoting {
/********************ПЕРЕМЕННЫЕ********************/
    uint public taskQuantity = 0;
    mapping(uint => Task) arrayOfTasks;
    mapping(address =>  mapping(uint => bool)) arrayOfVotingStates;
    struct Task {
        uint32 condition;/*0 - предложена, 1 - одобрена, 2 - в работе, 3 - готова*/
        uint positiveVotesNumber;
        string Description;
    }
    mapping(address => bool) memberAddresses;
    uint numToWin;
    
    
    modifier onlyMember() {
      require(memberAddresses[msg.sender] == true);
      _;
    }
    
/********************ФУНКЦИИ************************/
    function TaskVoting(address[] members) {
      numToWin = members.length/2;
      for(uint i = 0; i < members.length; ++i) {
        memberAddresses[members[i]] = true;
      }
    }
    
    function createTask(string _description) onlyMember public {
      arrayOfTasks[taskQuantity] = Task({
              condition: 0,
              positiveVotesNumber: 0,
              Description: _description
          });
      
      taskQuantity++;
    }
    
    function taskInformation(uint _taskNumber) public view returns(uint, uint, string) {
        return(arrayOfTasks[_taskNumber].condition, arrayOfTasks[_taskNumber].positiveVotesNumber, arrayOfTasks[_taskNumber].Description);
    }
    
    function Vote(uint _taskNumber, bool _decision) onlyMember public {
        
        if (_decision == true && arrayOfVotingStates[msg.sender][_taskNumber] == false) {
          arrayOfTasks[_taskNumber].positiveVotesNumber++;
        }
        arrayOfVotingStates[msg.sender][_taskNumber] = true;
        
        if (arrayOfTasks[_taskNumber].positiveVotesNumber > numToWin) {
            arrayOfTasks[_taskNumber].condition = 1 ;
        }
    }
    
    function checkIfMember(address member) public view returns (bool) {
      return memberAddresses[member];
    }

    
}

