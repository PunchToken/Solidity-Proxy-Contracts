pragma solidity ^0.4.23;

import "./proxied.sol";

contract UpgradeableProxy is Proxied{

    constructor(address _target) public {
        upgradeTo(_target);
    }

    function upgradeTo(address _target) public {
        assert(target != _target);

        address oldTarget = target;
        target = _target;

        emit EventUpgrade(_target, oldTarget, msg.sender);
    }

    function upgradeTo(address _target, bytes _data) public {
        upgradeTo(_target);
        assert(target.delegatecall(_data));
    }

    function () public payable {
        bytes memory data = msg.data;
        address impl = target;

        assembly {
            let result := delegatecall(gas, impl, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize

            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)

            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }



}