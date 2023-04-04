# ComptrollerInterface
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/compoundV2/ComptrollerInterface.sol)


## Functions
### enterMarkets


```solidity
function enterMarkets(address[] calldata qiTokens) external returns (uint256[] memory);
```

### exitMarket


```solidity
function exitMarket(address qiToken) external returns (uint256);
```

### checkMembership


```solidity
function checkMembership(address account, CTokenInterface qiToken) external view returns (bool);
```

### claimReward


```solidity
function claimReward(
    uint8 rewardType,
    address payable[] memory holders,
    CTokenInterface[] memory qiTokens,
    bool borrowers,
    bool suppliers
) external payable;
```

