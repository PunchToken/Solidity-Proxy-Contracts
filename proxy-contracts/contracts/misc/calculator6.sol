pragma solidity ^0.4.23;

import "../upgradeable/upgradeable.sol";
import "./calculator5.sol";

contract CalculatorV6 is CalculatorV5 {
    constructor(uint256 value) CalculatorV5(value) public {}

    function decrement(uint256 amount)
        external
        returns (bool)
    {
        require(_count >= amount, "Amount is greater then count");
        _count = _count - amount;
        return true;
    }
    
}