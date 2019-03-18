pragma solidity ^0.4.23;

import "../proxy/proxy.data.sol";

contract StorageData is ProxyData {
    event FilledStorage(uint amountAdded, uint newFillAmount);
    event DrankStorage(uint amountDrank, uint newFillAmount);

    uint public fillAmount;
    uint public capacity;
    string public flavor;

}
