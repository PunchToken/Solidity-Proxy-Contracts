pragma solidity ^0.4.23;

import "../proxy/proxy.sol";
import "../proxy/proxy.data.sol";

contract CalculatorHeader {
    event Incremented(uint256 indexed value, uint256 indexed amount);
}

contract CalculatorData is ProxyData, CalculatorHeader {    
    uint256 internal value;   
}

contract CalculatorProxy is Proxy, CalculatorData {
    constructor(address proxied, uint56 _value) 
        public
        Proxy(proxied)
    {
        value = _value;
    }
}