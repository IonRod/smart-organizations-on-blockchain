pragma solidity ^0.4.18;

contract Foo{
   string public foo;
   
   function setFoo(string _foo) public{
       foo = _foo;
   }
    
    function getFoo() public returns  (string){
        return foo;
    }
}