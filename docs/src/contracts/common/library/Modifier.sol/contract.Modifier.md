# Modifier
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/common/library/Modifier.sol)


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


