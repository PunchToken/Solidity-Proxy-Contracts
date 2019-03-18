pragma solidity ^0.4.23;

library CalcLib {
    event Incremented(uint256 indexed value, uint256 indexed amount);

    struct CalculatorStorage {
        uint256 value;
    }

    function init(CalculatorStorage storage self, uint256 value)
        public 
    {
        require(value > 0, "value must be positive");
        self.value = value;
    }

    function increment(CalculatorStorage storage self, uint256 amount)
        public
        returns (bool)
    {
        require(amount > 0, "amount must be positive");
        self.value = self.value + amount;
        emit Incremented(self.value,amount);
        return true;
    }

    function getCount(CalculatorStorage storage self)
        external
        view
        returns(uint256)
    {
        return self.value;
    }
}