# ComptrollerInterface
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/compoundV2/ComptrollerInterface.sol)


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

