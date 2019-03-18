pragma solidity ^0.4.23;

import "../proxy/proxied.sol";

contract Upgradeable is Proxied {

    modifier initializeOnceOnly() {
        if(!initialized[target]) {
            initialized[target] = true;
            emit EventInitialized(target);
            _;
        }
    }

    function upgradeTo(address) public {
        assert(false);
    }

    function initialize() initializeOnceOnly public {
        // initialize contract state variables here
    }
}