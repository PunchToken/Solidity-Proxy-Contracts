pragma solidity ^0.4.23;

import "./proxy.sol";
import "./updatable.proxy.shared.sol";

contract UpdatableProxy is Proxy, UpdatableProxyShared {
    constructor(address proxied, address owner)
        public
        Proxy(proxied)
        OwnableData(owner)
    {}
}

contract UpdatableProxyImplementation is UpdatableProxyShared {
    constructor() public OwnableData(0) {}
}