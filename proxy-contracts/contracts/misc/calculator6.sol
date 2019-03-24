pragma solidity ^0.4.23;

import "./calculator5.sol";

contract CalculatorV6 is CalculatorV5 {
  

    function decrement(uint256 amount)
        external
        returns (bool)
    {
        uint256 _count = _storage.getUint("count"); 
        require(_count >= amount, "Amount is greater then count");
        _count = _count - amount;
         _storage.setUint("count", _count);
        return true;
    }
    
}