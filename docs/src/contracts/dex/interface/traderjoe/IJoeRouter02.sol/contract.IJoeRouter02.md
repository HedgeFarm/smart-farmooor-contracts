# IJoeRouter02
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/dex/interface/traderjoe/IJoeRouter02.sol)

**Inherits:**
[IJoeRouter01](/contracts/dex/interface/traderjoe/IJoeRouter01.sol/contract.IJoeRouter01.md)


## Functions
### removeLiquidityAVAXSupportingFeeOnTransferTokens


```solidity
function removeLiquidityAVAXSupportingFeeOnTransferTokens(
    address token,
    uint256 liquidity,
    uint256 amountTokenMin,
    uint256 amountAVAXMin,
    address to,
    uint256 deadline
) external returns (uint256 amountAVAX);
```

### removeLiquidityAVAXWithPermitSupportingFeeOnTransferTokens


```solidity
function removeLiquidityAVAXWithPermitSupportingFeeOnTransferTokens(
    address token,
    uint256 liquidity,
    uint256 amountTokenMin,
    uint256 amountAVAXMin,
    address to,
    uint256 deadline,
    bool approveMax,
    uint8 v,
    bytes32 r,
    bytes32 s
) external returns (uint256 amountAVAX);
```

### swapExactTokensForTokensSupportingFeeOnTransferTokens


```solidity
function swapExactTokensForTokensSupportingFeeOnTransferTokens(
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) external;
```

### swapExactAVAXForTokensSupportingFeeOnTransferTokens


```solidity
function swapExactAVAXForTokensSupportingFeeOnTransferTokens(
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) external payable;
```

### swapExactTokensForAVAXSupportingFeeOnTransferTokens


```solidity
function swapExactTokensForAVAXSupportingFeeOnTransferTokens(
    uint256 amountIn,
    uint256 amountOutMin,
    address[] calldata path,
    address to,
    uint256 deadline
) external;
```

