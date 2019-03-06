var Storage = artifacts.require("../contracts/storage.sol");

module.exports = function(deployer) {
	deployer.deploy(Storage,"chocolate",35,100);
};