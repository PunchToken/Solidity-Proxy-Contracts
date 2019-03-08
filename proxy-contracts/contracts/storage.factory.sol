pragma solidity ^0.4.23;

import "./storage.sol";
import "./storage.proxy.sol";

/*
While proxies may create immense savings in 
terms of code duplication on the chain, 
it loses gas in each call to the proxy
because of the delegatecall indirection. 
*/
contract StorageFactory {

    Storage private masterCopy;

    constructor(Storage masterCopy) public {
        masterCopy = _masterCopy;
    }
    
    function createStorage(string flavor, uint fillAmount, uint capacity)
        public 
        returns (Storage)
    {
        return new Storage(new StorageProxy(masterCopy,flavor, fillAmount, capacity));
    }
}