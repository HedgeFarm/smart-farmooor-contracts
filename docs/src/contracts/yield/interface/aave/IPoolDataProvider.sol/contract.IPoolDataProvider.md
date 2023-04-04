# IPoolDataProvider
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/aave/IPoolDataProvider.sol)


## Functions
### getATokenTotalSupply

Returns the total supply of aTokens for a given asset


```solidity
function getATokenTotalSupply(address asset) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`asset`|`address`|The address of the underlying asset of the reserve|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The total supply of the aToken|


### getTotalDebt

Returns the total debt for a given asset


```solidity
function getTotalDebt(address asset) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`asset`|`address`|The address of the underlying asset of the reserve|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The total debt for asset|


