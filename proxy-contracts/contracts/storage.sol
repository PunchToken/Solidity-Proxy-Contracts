pragma solidity ^0.4.23;

import "./storage.library.sol";
import "./proxy.data.sol";


contract Storage is ProxyData {
    using StorageLibrary for StorageLibrary.StorageInstance;

    event FilledStorage(uint amountAdded, uint newFillAmount);
    event DrankStorage(uint amountDrank, uint newFillAmount);

    StorageLibrary.StorageInstance private self;    

    constructor(string _flavor, uint _fillAmount, uint _capacity)
        public
    {
        self.init(_flavor, _fillAmount, _capacity);
    }
    function fill(uint amountToAdd) public {
        return self.fill(amountToAdd);
    }

    function drink(uint amountToDrink) public returns (bytes32) {
        return self.drink(amountToDrink);
    }
}
