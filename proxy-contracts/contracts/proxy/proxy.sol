pragma solidity ^0.4.23;

import "./proxy.data.sol";

contract Proxy is ProxyData {
    constructor(address _proxied) public {
        proxied = _proxied;
    }

    function () external payable {
        address addr = proxied;
        assembly {
            let freememstart := mload(0x40)
            calldatacopy(freememstart, 0, calldatasize())
            let success := delegatecall(not(0), addr, freememstart, calldatasize(), freememstart, returndatasize())
            switch success
            case 0 { revert(freememstart, returndatasize()) }
            default { return(freememstart, returndatasize()) }
        }
    }
}