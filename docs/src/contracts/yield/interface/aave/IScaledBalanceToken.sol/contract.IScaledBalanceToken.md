# IScaledBalanceToken
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/aave/IScaledBalanceToken.sol)


## Functions
### balanceOf

Returns the scaled balance of the user.

*The scaled balance is the sum of all the updated stored balance divided by the reserve's liquidity index
at the moment of the update*


```solidity
function balanceOf(address user) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user`|`address`|The user whose balance is calculated|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The scaled balance of the user|


### scaledBalanceOf

Returns the scaled balance of the user.

*The scaled balance is the sum of all the updated stored balance divided by the reserve's liquidity index
at the moment of the update*


```solidity
function scaledBalanceOf(address user) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`user`|`address`|The user whose balance is calculated|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The scaled balance of the user|


