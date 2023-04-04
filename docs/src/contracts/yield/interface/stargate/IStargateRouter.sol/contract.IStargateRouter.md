# IStargateRouter
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/stargate/IStargateRouter.sol)


## Functions
### addLiquidity

adds liquidity to router pool and get LP tokens in return


```solidity
function addLiquidity(uint256 poolId, uint256 amount, address to) external;
```

### instantRedeemLocal

exit pool by using your LP tokens to withdraw yur liquidity


```solidity
function instantRedeemLocal(uint16 poolId, uint256 amountLp, address to) external returns (uint256);
```

### redeemLocal


```solidity
function redeemLocal(
    uint16 dstChainId,
    uint256 srcPoolId,
    uint256 dstPoolId,
    address payable refundAddress,
    uint256 amountLP,
    bytes calldata to,
    lzTxObj memory lzTxParams
) external payable;
```

## Structs
### lzTxObj

```solidity
struct lzTxObj {
    uint256 dstGasForCall;
    uint256 dstNativeAmount;
    bytes dstNativeAddr;
}
```

