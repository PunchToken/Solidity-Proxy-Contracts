pragma solidity ^0.4.23;


library StorageLibrary {
    event FilledStorage(uint amountAdded, uint newFillAmount);
    event DrankStorage(uint amountDrank, uint newFillAmount);

    struct StorageInstance {
        uint fillAmount;
        uint capacity;
        string flavor;
    }

    function init(
        StorageInstance storage self,
        string _flavor, uint _fillAmount, uint _capacity
    ) public {
        require(_fillAmount <= _capacity && _capacity > 0,"not enough capacity for fill amount");
        self.flavor = _flavor;
        self.fillAmount = _fillAmount;
        self.capacity = _capacity;
    }
    function fill(StorageInstance storage self, uint amountToAdd) public {
        uint newAmount = self.fillAmount + amountToAdd;
        require(newAmount > self.fillAmount && newAmount <= self.capacity,"not enough capacity");
        self.fillAmount = newAmount;
        emit FilledStorage(amountToAdd, newAmount);
    }

    function drink(StorageInstance storage self, uint amountToDrink) public returns (bytes32) {
        uint newAmount = self.fillAmount - amountToDrink;
        require(newAmount < self.fillAmount,"not enough to drink");
        self.fillAmount = newAmount;
        emit DrankStorage(amountToDrink, newAmount);
        // this mess of hashes just here to pad out the bytecode
        return keccak256(amountToDrink);
    }

    function fillAmount(StorageInstance storage self) public view returns (uint) {
        return self.fillAmount;
    }

    
   
}