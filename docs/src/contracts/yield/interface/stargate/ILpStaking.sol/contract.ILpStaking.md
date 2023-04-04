# ILpStaking
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/stargate/ILpStaking.sol)


## Functions
### pendingStargate

returns amount of claimable STG tokens


```solidity
function pendingStargate(uint256 pid, address user) external view returns (uint256);
```

### deposit

deposit Lp tokens to earn STG
if called with amount == 0 is effectively acts as claim for STG


```solidity
function deposit(uint256 pid, uint256 amount) external;
```

### withdraw

withdraw Lp tokens and claim STG


```solidity
function withdraw(uint256 pid, uint256 amount) external;
```

### userInfo

return: amount uint256, rewardDebt uint256


```solidity
function userInfo(uint256 pid, address user) external view returns (uint256, uint256);
```

### poolInfo

return: lpToken address, allocPoint uint256, lastRewardBlock uint256, accStargatePerShare uint256


```solidity
function poolInfo(uint256 poolId) external view returns (address, uint256, uint256, uint256);
```

