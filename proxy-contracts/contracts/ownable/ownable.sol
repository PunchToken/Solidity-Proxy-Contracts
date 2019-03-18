pragma solidity ^0.4.23;

import "./ownable.data.sol";

contract Ownable is OwnableData {
    function setOwner(address newOwner)
        public
        onlyOwner    
    {
        owner = newOwner;
    }
}