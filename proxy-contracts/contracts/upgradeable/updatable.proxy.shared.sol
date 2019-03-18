pragma solidity ^0.4.23;

import "../proxy/proxy.data.sol";
import "../ownable/ownable.sol";

contract UpdatableProxyShared is ProxyData, Ownable {
    function updateProxied(address newProxied)
        public
        onlyOwner
    {
        proxied = newProxied;
    }
}