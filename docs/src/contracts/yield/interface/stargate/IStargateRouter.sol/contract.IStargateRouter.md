# IStargateRouter
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/interface/stargate/IStargateRouter.sol)


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

