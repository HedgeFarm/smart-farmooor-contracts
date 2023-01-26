# CTokenInterface
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/compoundV2/CTokenInterface.sol)


## Functions
### transfer


```solidity
function transfer(address dst, uint256 amount) external returns (bool);
```

### transferFrom


```solidity
function transferFrom(address src, address dst, uint256 amount) external returns (bool);
```

### approve


```solidity
function approve(address spender, uint256 amount) external returns (bool);
```

### allowance


```solidity
function allowance(address owner, address spender) external view returns (uint256);
```

### balanceOf


```solidity
function balanceOf(address owner) external view returns (uint256);
```

### balanceOfUnderlying


```solidity
function balanceOfUnderlying(address owner) external returns (uint256);
```

### getAccountSnapshot


```solidity
function getAccountSnapshot(address account) external view returns (uint256, uint256, uint256, uint256);
```

### totalBorrowsCurrent


```solidity
function totalBorrowsCurrent() external returns (uint256);
```

### borrowBalanceCurrent


```solidity
function borrowBalanceCurrent(address account) external returns (uint256);
```

### borrowBalanceStored


```solidity
function borrowBalanceStored(address account) external view returns (uint256);
```

### exchangeRateCurrent


```solidity
function exchangeRateCurrent() external returns (uint256);
```

### exchangeRateStored


```solidity
function exchangeRateStored() external view returns (uint256);
```

### getCash


```solidity
function getCash() external view returns (uint256);
```

### totalBorrows


```solidity
function totalBorrows() external view returns (uint256);
```

### accrueInterest


```solidity
function accrueInterest() external returns (uint256);
```

### seize


```solidity
function seize(address liquidator, address borrower, uint256 seizeTokens) external returns (uint256);
```

### totalSupply


```solidity
function totalSupply() external view returns (uint256);
```

