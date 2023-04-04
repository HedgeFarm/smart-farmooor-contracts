# IDex
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/dex/interface/IDex.sol)

Interface which is a face for Dex handlers implementations. On each chain we might use different
dex to swap tokens so we need to abstract generic interface.


## Functions
### swap


```solidity
function swap(uint256 _amountIn, address _in, address _out, address _to) external returns (uint256[] memory amounts);
```

### swapSlippageMin


```solidity
function swapSlippageMin(uint256 _amountIn, uint256 _amountOutMin, address _in, address _out, address _to)
    external
    returns (uint256[] memory amounts);
```

### setRoutes


```solidity
function setRoutes(address[][] memory _routes) external;
```

### deleteRoutes


```solidity
function deleteRoutes(address[][] memory _routes) external;
```

### getRoute


```solidity
function getRoute(address _in, address _out) external view returns (address[] memory route);
```

### swapPreview


```solidity
function swapPreview(uint256 _amountIn, address _in, address _out) external view returns (uint256 amountOut);
```

