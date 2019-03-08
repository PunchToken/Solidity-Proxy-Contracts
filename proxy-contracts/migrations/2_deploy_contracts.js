var Storage		= artifacts.require("../contracts/storage.sol");
var proxy		= artifacts.require("../contracts/proxy.sol");
var proxyData  	= artifacts.require("../contracts/proxyData");
var StorageLib	= artifacts.require("../contracts/storage.library.sol");

module.exports = function(deployer) {
	deployer.deploy(Storage,"chocolate",35,100);
};