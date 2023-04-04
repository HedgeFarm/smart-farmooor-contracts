# IPool
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/aave/IPool.sol)


## Functions
### supply

Supplies an `amount` of underlying asset into the reserve, receiving in return overlying aTokens.
- E.g. User supplies 100 USDC and gets in return 100 aUSDC


```solidity
function supply(address asset, uint256 amount, address onBehalfOf, uint16 referralCode) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`asset`|`address`|The address of the underlying asset to supply|
|`amount`|`uint256`|The amount to be supplied|
|`onBehalfOf`|`address`|The address that will receive the aTokens, same as msg.sender if the user wants to receive them on his own wallet, or a different address if the beneficiary of aTokens is a different wallet|
|`referralCode`|`uint16`|Code used to register the integrator originating the operation, for potential rewards. 0 if the action is executed directly by the user, without any middle-man|


### withdraw

Withdraws an `amount` of underlying asset from the reserve, burning the equivalent aTokens owned
E.g. User has 100 aUSDC, calls withdraw() and receives 100 USDC, burning the 100 aUSDC


```solidity
function withdraw(address asset, uint256 amount, address to) external returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`asset`|`address`|The address of the underlying asset to withdraw|
|`amount`|`uint256`|The underlying amount to be withdrawn - Send the value type(uint256).max in order to withdraw the whole aToken balance|
|`to`|`address`|The address that will receive the underlying, same as msg.sender if the user wants to receive it on his own wallet, or a different address if the beneficiary is a different wallet|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The final amount withdrawn|


### getReserveNormalizedIncome

Returns the normalized income normalized income of the reserve


```solidity
function getReserveNormalizedIncome(address asset) external view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`asset`|`address`|The address of the underlying asset of the reserve|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The reserve's normalized income|


