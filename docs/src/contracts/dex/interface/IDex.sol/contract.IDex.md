# IDex
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/dex/interface/IDex.sol)

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

