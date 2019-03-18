pragma solidity ^0.4.23;

import "../proxy/proxy.data.sol";

contract Calculator is ProxyData {
    uint256 internal _count;

    constructor(uint256 count)public {
        _count = count;
    }

    function increment(uint256 amount)
        public
        returns (bool)
    {
        require(amount > 0, "amount must be positive");
        _count = _count + amount;
        return true;
    }

    function getCount()
        external
        view
        returns(uint256)
    {
        return _count;
    }
}