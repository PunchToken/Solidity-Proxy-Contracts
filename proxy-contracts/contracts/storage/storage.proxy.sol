pragma solidity ^0.4.23;

import "../proxy/proxy.data.sol";
import "../proxy/proxy.sol";
import "./storage.data.sol";

contract StorageProxy is Proxy, StorageData {

    constructor (address proxied, string _flavor, uint _fillAmount, uint _capacity)
        public
        Proxy(proxied)
    {
        // the body is identical to our original constructor
        require(_fillAmount <= _capacity && _capacity > 0, "Capacity is insufficent");
        flavor = _flavor;
        fillAmount = _fillAmount;
        capacity = _capacity;
    }
}