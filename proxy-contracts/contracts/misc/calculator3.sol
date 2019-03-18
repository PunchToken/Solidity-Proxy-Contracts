pragma solidity ^0.4.23;

import "./CalcLib.sol";
import "../proxy/proxy.data.sol";

contract CalculatorV3 is ProxyData {

    using CalcLib for CalcLib.CalculatorStorage;

    CalcLib.CalculatorStorage internal self;    

    constructor(uint256 count) public {
        self.init(count);
    }

    function increment(uint256 amount)
        public
        returns (bool)
    {
        return self.increment(amount);        
    }

    function getCount()
        external
        view
        returns(uint256)
    {
        return self.getCount();
    }  
}