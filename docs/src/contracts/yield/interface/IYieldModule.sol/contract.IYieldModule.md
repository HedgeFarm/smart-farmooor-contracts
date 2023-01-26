# IYieldModule
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/IYieldModule.sol)


## Functions
### setDex

admin *


```solidity
function setDex(address _dex) external;
```

### setExecutionFee


```solidity
function setExecutionFee(uint256 _executionFee) external;
```

### setRewards


```solidity
function setRewards(address[] memory _rewards) external;
```

### approveDex


```solidity
function approveDex() external;
```

### deposit

manager *


```solidity
function deposit(uint256 amount) external;
```

### withdraw


```solidity
function withdraw(uint256 shareFraction, address receiver)
    external
    payable
    returns (uint256 instant, uint256 pending);
```

### harvest


```solidity
function harvest(address receiver) external returns (uint256);
```

### smartFarmooor

view *


```solidity
function smartFarmooor() external returns (address);
```

### dex


```solidity
function dex() external returns (address);
```

### manager


```solidity
function manager() external returns (address);
```

### baseToken


```solidity
function baseToken() external view returns (address);
```

### executionFee


```solidity
function executionFee() external view returns (uint256);
```

### rewards


```solidity
function rewards(uint256 index) external view returns (address);
```

### name


```solidity
function name() external view returns (string memory);
```

### getBalance


```solidity
function getBalance() external returns (uint256);
```

### getLastUpdatedBalance


```solidity
function getLastUpdatedBalance() external view returns (uint256);
```

### getExecutionFee


```solidity
function getExecutionFee(uint256 amount) external view returns (uint256);
```

### getImplementation


```solidity
function getImplementation() external view returns (address);
```

## Events
### Deposit
events *


```solidity
event Deposit(address token, uint256 amount);
```

### Withdraw

```solidity
event Withdraw(address token, uint256 amount);
```

### Harvest

```solidity
event Harvest(address token, uint256 amount);
```

