# Modifier
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/common/library/Modifier.sol)


## Functions
### onlyNotZeroAddress

*Used to prevent using the zero address*


```solidity
modifier onlyNotZeroAddress(address _address);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_address`|`address`|Address used|


### onlyStrictlyPositiveAmount

*Used to prevent using a zero amount*


```solidity
modifier onlyStrictlyPositiveAmount(uint256 amount);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`|Amount used|


