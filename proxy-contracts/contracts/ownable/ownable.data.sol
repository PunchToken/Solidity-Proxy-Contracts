pragma solidity ^0.4.23;

contract OwnableData {
    modifier onlyOwner() {
        require(msg.sender == owner, "Owner address for this contract does not match the recorded owner");
        _;
    }

    address internal owner;

    constructor(address _owner)
        public
    {
        owner = _owner;
    }
}