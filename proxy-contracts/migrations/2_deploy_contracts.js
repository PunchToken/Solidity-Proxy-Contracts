var Calculator		= artifacts.require("Calculator");
var CalculatorV2	= artifacts.require("CalculatorV2");
var CalcLib			= artifacts.require("CalcLib");
var CalculatorV3    = artifacts.require("CalculatorV3");
let Proxy			= artifacts.require("Proxy");

var Upgradeable    = artifacts.require("Upgradeable");


async function doDeploy(deployer, network) {
	const calcResult = await deployer.deploy(Calculator, 100);
	await deployer.deploy(Proxy, calcResult.address);
	await deployer.deploy(CalculatorV2, 50);
	await deployer.deploy(CalcLib);
	await deployer.link(CalcLib, CalculatorV3);
	await deployer.deploy(CalculatorV3, 500);	
}

module.exports = (deployer, network) => { 
	deployer.then(async () => {
		await doDeploy(deployer, network);
	});
}


/*
function(deployer) {
	deployer.deploy(Calculator,100).then((result) => {
		console.log(result);
		return deployer.deploy(Proxy,result.address).then((result) =>{
			return deployer.deploy(CalculatorV2,50).then((result) => {
				return deployer.deploy(CalcLib).then((result) => {
					return deployer.deploy(CalculatorV3, 500);
				});				
			});
		});
	});	
};
*/