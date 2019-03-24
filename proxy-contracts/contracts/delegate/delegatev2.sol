pragma solidity ^0.4.23;

import "./delegatev1.sol";
import "../storage/keyvalue.storage.data.sol";
import "../ownable/ownablev2.sol";

contract DelegateV2 is StorageState {

  modifier onlyOwner() {
        require(msg.sender == _storage.getAddress("owner"));
        _;
    }

    function setNumberOfOwners(uint num) public   onlyOwner {
        _storage.setUint("total", num);    
    }
    function getNumberOfOwners() view public  returns (uint) {
        return _storage.getUint("total");    
    }
}