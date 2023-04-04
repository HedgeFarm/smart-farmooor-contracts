# ISmartFarmooor
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/ISmartFarmooor.sol)


## Functions
### addModule

admin *


```solidity
function addModule(IYieldModule _module) external;
```

### setModuleAllocation


```solidity
function setModuleAllocation(uint256[] memory _allocation) external;
```

### panic


```solidity
function panic() external payable;
```

### finishPanic


```solidity
function finishPanic() external;
```

### deposit

user *


```solidity
function deposit(uint256 amountToken) external;
```

### withdraw


```solidity
function withdraw(uint256 shares) external payable returns (uint256 instant, uint256 async);
```

### harvest


```solidity
function harvest() external returns (uint256);
```

### feeManager

view *


```solidity
function feeManager() external returns (address);
```

### baseToken


```solidity
function baseToken() external returns (address);
```

### minHarvestThreshold


```solidity
function minHarvestThreshold() external returns (uint256);
```

### numberOfModules


```solidity
function numberOfModules() external returns (uint256);
```

### balanceSnapshot


```solidity
function balanceSnapshot() external returns (uint256);
```

### performanceFee


```solidity
function performanceFee() external returns (uint16);
```

### cap


```solidity
function cap() external returns (uint256);
```

### yieldOptions


```solidity
function yieldOptions(uint256 key) external view returns (IYieldModule, uint256);
```

### pricePerShare


```solidity
function pricePerShare() external returns (uint256);
```

### lastUpdatedPricePerShare


```solidity
function lastUpdatedPricePerShare() external view returns (uint256);
```

### getExecutionFee


```solidity
function getExecutionFee(uint256 _amount) external view returns (uint256);
```

### getModulesBalance


```solidity
function getModulesBalance() external returns (uint256);
```

### getLastUpdatedModulesBalance


```solidity
function getLastUpdatedModulesBalance() external view returns (uint256);
```

### getImplementation


```solidity
function getImplementation() external view returns (address);
```

## Structs
### YieldModuleDetails

```solidity
struct YieldModuleDetails {
    IYieldModule module;
    uint256 allocation;
}
```

