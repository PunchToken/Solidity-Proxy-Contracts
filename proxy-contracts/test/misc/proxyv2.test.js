const KeyValueStorage = artifacts.require("KeyValueStorage")
const DelegateV1 = artifacts.require("DelegateV1")
const DelegateV2 = artifacts.require("DelegateV2")
const ProxyV2 = artifacts.require("ProxyV2")


contract("Proxy v2 contract tests", async (accounts) => {
    let proxy, keyValueStorage, delegateV1, delegateV2;
    beforeEach(async () => {
        keyValueStorage = await KeyValueStorage.new()
        proxy = await ProxyV2.new(keyValueStorage.address,accounts[2])
        delegateV1 = await DelegateV1.new()
        delegateV2 = await DelegateV2.new()
    })

    it("should call through proxy", async () => {
        await proxy.upgradeTo(delegateV1.address)
        proxy = _.extend(proxy, await DelegateV1.at(proxy.address));

        await proxy.setNumberOfOwners(10);
        let numOwnerV1 = await proxy.getNumberOfOwners();
        console.log(numOwnerV1.toNumber())

        await proxy.upgradeTo(delegateV2.address);
  
        proxy = await DelegateV2.at(proxy.address);
        let previousOwnersState = await proxy.getNumberOfOwners();
        console.log(previousOwnersState.toNumber());
        await proxy.setNumberOfOwners(20,{from:accounts[2]});
       
        let numOfownersV2 = await proxy.getNumberOfOwners();
        console.log(numOfownersV2.toNumber());
    })
})