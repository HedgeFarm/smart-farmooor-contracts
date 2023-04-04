# IPool
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/stargate/IPool.sol)


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

