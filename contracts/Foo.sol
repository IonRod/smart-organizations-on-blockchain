pragma solidity ^0.4.18;

contract Foo{
   bytes32 foo;
   
   function setFoo(bytes32 _foo) public{
       foo = _foo;
   }
    
    function getFoo() public returns  (bytes32){
        return (foo);
    }
}