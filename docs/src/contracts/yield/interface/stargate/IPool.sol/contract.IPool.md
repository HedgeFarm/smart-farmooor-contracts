# IPool
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/stargate/IPool.sol)


## Functions
### amountLPtoLD

Calculates amount of base token (LD in Stargate naming; token which was deposited) from user Lp tokens


```solidity
function amountLPtoLD(uint256 _amountLP) external view returns (uint256);
```

### totalLiquidity

total tokens deposited to pool


```solidity
function totalLiquidity() external view returns (uint256);
```

### totalSupply

total LP tokens issued


```solidity
function totalSupply() external view returns (uint256);
```

### deltaCredit

return amount that can be instantly (synchronously) withdrawn from pool


```solidity
function deltaCredit() external view returns (uint256);
```

