# TraderJoeDexModule
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/dex/TraderJoeDexModule.sol)

**Inherits:**
[IDex](/contracts/dex/interface/IDex.sol/contract.IDex.md), Ownable, [Rescuable](/contracts/common/Rescuable.sol/contract.Rescuable.md)


## State Variables
### router

```solidity
IJoeRouter02 public immutable router;
```


### DEADLINE_DELTA

```solidity
uint256 public constant DEADLINE_DELTA = 10;
```


### AMOUNT_OUT_MIN

```solidity
uint256 public constant AMOUNT_OUT_MIN = 0;
```


### routes

```solidity
mapping(address => mapping(address => address[])) public routes;
```


## Functions
### constructor


```solidity
constructor(address _router, address[][] memory _routes);
```

### swapPreview

Get a quote for a Swap

*Can be used for both ERC20 and native token. Use the wrapped native token to get a preview of a native token swap.*


```solidity
function swapPreview(uint256 _amountIn, address _in, address _out) public view returns (uint256 amountOut);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amountIn`|`uint256`| Token amount in|
|`_in`|`address`| Token address In|
|`_out`|`address`| Token address Out|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`amountOut`|`uint256`| Amount of tokens out|


### swap

Swap between two ERC20 tokens


```solidity
function swap(uint256 _amountIn, address _in, address _out, address _to) external returns (uint256[] memory amounts);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amountIn`|`uint256`| Token amount in|
|`_in`|`address`| Token address In|
|`_out`|`address`| Token address Out|
|`_to`|`address`| Address of the receiver of amounts|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`amounts`|`uint256[]`| Amounts of token out|


### swapSlippageMin

Swap between two ERC20 tokens with slippage tolerance


```solidity
function swapSlippageMin(uint256 _amountIn, uint256 _amountOutMin, address _in, address _out, address _to)
    external
    returns (uint256[] memory amounts);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amountIn`|`uint256`| Token amount in|
|`_amountOutMin`|`uint256`| Minimum amount out - slippage tolerance|
|`_in`|`address`| Token address In|
|`_out`|`address`| Token address Out|
|`_to`|`address`| Address of the receiver of amounts|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`amounts`|`uint256[]`| Amounts of token out|


### setRoutes

Add new route or update existing route


```solidity
function setRoutes(address[][] memory _routes) public onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_routes`|`address[][]`| Routes to add or to update|


### deleteRoutes

Delete routes


```solidity
function deleteRoutes(address[][] memory _routes) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_routes`|`address[][]`| Routes to delete|


### getRoute

Get swap route for a given pair


```solidity
function getRoute(address _in, address _out) external view returns (address[] memory route);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_in`|`address`| Token address In|
|`_out`|`address`| Token address Out|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`route`|`address[]`| Swap route for a given pair|


### rescueToken

Rescue a stuck ERC20 token


```solidity
function rescueToken(address token) external onlyOwner;
```

### rescueNative

Rescue native tokens


```solidity
function rescueNative() external onlyOwner;
```

