const Calculator = artifacts.require('./Calculator.sol');
const CalculatorV2 = artifacts.require('./CalculatorV2.sol');
const CalculatorV3  = artifacts.require('./CalculatorV3.sol');
const Proxy        = artifacts.require('./Proxy.sol');
const CalculatorProxy  = artifacts.require('./CalculatorProxy');
const assert      = require('assert');

const UpgradeableProxy = artifacts.require('./upgradeable.sol')
const CalculatorV5 = artifacts.require('./CalculatorV5.sol');
const CalculatorV6 = artifacts.require('./CalculatorV6.sol')


let calcInstance;
let proxyInstance;
let calc1Instance;
let calcProxyInstance;
let calc2Instance;
let calc3Instance;
let calcV5, calcV6, uproxy, calcV5Proxy;

contract('Calculator', (accounts) => {
    beforeEach(async () => {
        
        calcInstance = await Calculator.deployed();
        //proxyInstance = await Proxy.deployed();
        calc2Instance = await CalculatorV2.deployed();
        calc3Instance = await CalculatorV3.deployed();

      
        calcV5 = await CalculatorV5.new(100);
        calcV6 = await CalculatorV6.new(100);
        uproxy = await UpgradeableProxy.new(calcV5.address);
        calcV5Proxy =  CalculatorV5.at(uproxy.address);
        await calcV5Proxy.initialize();
    });

    it('should update increment', async () => {
        
        await calcInstance.increment(100);

        const value = await calcInstance.getCount();
        assert.equal(value, 200);
    });

    it('should increment to 400', async () => {
        await calcInstance.increment(100);
        await calcInstance.increment(100);
        const value = await calcInstance.getCount();
        assert.equal(value, 400);
    });

    it('calc v2 should equal 50',async () => {
        const value = await calc2Instance.getCount();
        assert.equal(value,50);
    });

    it('calc v2 should equal 150',async () => {
        await calc2Instance.increment(100);
        const value = await calc2Instance.getCount();
        assert.equal(value,150);
    });

    it('calc v2 should equal 100', async () => {
        await calc2Instance.decrement(50);
        const value = await calc2Instance.getCount();
        assert.equal(value, 100);
    });

    it('calc v3 should equal 500', async () => {
        const value = await calc3Instance.getCount();
        assert.equal(value, 500);
    }); 

    it('calc v3 should equal 600', async () => {
        await calc3Instance.increment(100);
        const value = await calc3Instance.getCount();
        assert.equal(value, 600);        
    });

    it('calc v5 should equal 100',async () => {
        let value = await calcV5Proxy.getCount.call();
        assert.equal(value, 100);
    });
});