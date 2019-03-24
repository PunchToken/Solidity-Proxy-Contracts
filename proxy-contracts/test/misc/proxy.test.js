const KeyValueStorage = artifacts.require("KeyValueStorage");
const CalculatorV5 = artifacts.require('./CalculatorV5.sol');
const CalculatorV6 = artifacts.require('./CalculatorV6.sol');
const ProxyV2 = artifacts.require("ProxyV2")


contract('Basic Proxy calls', (accounts) => {
    let keyValueStorage;
    let calcInstance;
    let proxyInstance;
    let calc2Instance;
    let calcProxy;

    beforeEach(async () => {
        keyValueStorage = await KeyValueStorage.new();        
        proxyInstance = await ProxyV2.new(keyValueStorage.address,accounts[3]);
        calc5Instance = await CalculatorV5.new();        
        calc6Instance = await CalculatorV6.new();    
        await proxyInstance.upgradeTo(calc5Instance.address);       
        proxyInstance = _.extend(proxyInstance, await CalculatorV5.at(proxyInstance.address));
        await proxyInstance.setCount(5);    
    });

    it('should get proxy instance and return 5', async () => {        
        const result = await proxyInstance.getCount();
        console.log(result.toNumber())
        assert.equal(result,5);
    });

    it('should get proxy instance and increment by 5 to 10', async () => {        
        await proxyInstance.increment(5);    
        const result = await proxyInstance.getCount();
        console.log(result.toNumber())
        assert.equal(result,10);
    });

    it('should get proxy instance and upgrade the contract and return 10', async () => {   
        await proxyInstance.increment(5);     
        const result0 = await proxyInstance.getCount();
        console.log(result0.toNumber())    
        await proxyInstance.upgradeTo(calc6Instance.address);  
        proxyInstance = _.extend(proxyInstance, await CalculatorV6.at(proxyInstance.address));     
        const result = await proxyInstance.getCount();
        console.log(result.toNumber())
        assert.equal(result,10);
    });

    it('should get proxy instance decrement by 3', async () => {
        await proxyInstance.increment(5);     
        const result0 = await proxyInstance.getCount();
        console.log(result0.toNumber())           
        await proxyInstance.upgradeTo(calc6Instance.address);  
        proxyInstance = _.extend(proxyInstance, await CalculatorV6.at(proxyInstance.address));     
        await proxyInstance.decrement(3);           
        const result = await proxyInstance.getCount();
        console.log(result.toNumber())
        assert.equal(result,7);
    });


});