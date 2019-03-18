pragma solidity ^0.4.23;

import "./calcuator.sol";

contract CalculatorV2 is Calculator {

    constructor(uint256 value) Calculator(value) public {}

    function decrement(uint256 amount)
        external
        returns (bool)
    {
        require(_count >= amount, "Amount is greater then count");
        _count = _count - amount;
        return true;
    }
}