pragma solidity ^0.4.23;

import "../util/safemath.sol";
import "../storage/keyvalue.storage.data.sol";

contract CalculatorV5 is StorageState {
   using SafeMath for uint256;

    constructor() public {
        
    }

    function setCount(uint256 count) public returns(bool) {
        _storage.setUint("count",  count); 
        return true;
    }

    function increment(uint256 amount)
        public
        returns (bool)
    {
        require(amount > 0, "amount must be positive");
        uint256 count = _storage.getUint("count");       
        uint256 _count = count + amount;
        _storage.setUint("count", _count);
        return true;
    }

    function getCount()
        external
        view
        returns(uint256)
    {
        return _storage.getUint("count");
    }
}