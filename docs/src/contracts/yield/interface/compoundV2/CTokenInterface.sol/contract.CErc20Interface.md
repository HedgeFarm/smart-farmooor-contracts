# CErc20Interface
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/compoundV2/CTokenInterface.sol)


## Functions
### mint


```solidity
function mint(uint256 mintAmount) external returns (uint256);
```

### mint


```solidity
function mint() external payable;
```

### redeem


```solidity
function redeem(uint256 redeemTokens) external returns (uint256);
```

### redeemUnderlying


```solidity
function redeemUnderlying(uint256 redeemAmount) external returns (uint256);
```

### borrow


```solidity
function borrow(uint256 borrowAmount) external returns (uint256);
```

### repayBorrow


```solidity
function repayBorrow(uint256 repayAmount) external returns (uint256);
```

### repayBorrowBehalf


```solidity
function repayBorrowBehalf(address borrower, uint256 repayAmount) external returns (uint256);
```

### liquidateBorrow


```solidity
function liquidateBorrow(address borrower, uint256 repayAmount, CTokenInterface cTokenCollateral)
    external
    returns (uint256);
```

