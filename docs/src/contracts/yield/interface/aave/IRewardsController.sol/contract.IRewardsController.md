# IRewardsController
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/aave/IRewardsController.sol)


## Functions
### claimAllRewardsToSelf

*Claims all reward for msg.sender, on all the assets of the pool, accumulating the pending rewards*


```solidity
function claimAllRewardsToSelf(address[] calldata assets)
    external
    returns (address[] memory rewardsList, uint256[] memory claimedAmounts);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`assets`|`address[]`|The list of assets to check eligible distributions before claiming rewards|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`rewardsList`|`address[]`|List of addresses of the reward tokens|
|`claimedAmounts`|`uint256[]`|List that contains the claimed amount per reward, following same order as "rewardsList"|


