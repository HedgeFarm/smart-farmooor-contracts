# NativeGateway
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/NativeGateway.sol)

**Inherits:**
[INativeGateway](/contracts/yield/interface/INativeGateway.sol/contract.INativeGateway.md), Ownable, [Rescuable](/contracts/common/Rescuable.sol/contract.Rescuable.md)


## State Variables
### wrappedNativeToken

```solidity
address public immutable wrappedNativeToken;
```


### wrappedNativeSmartFarmooor

```solidity
address public immutable wrappedNativeSmartFarmooor;
```


## Functions
### constructor

*Constructor*


```solidity
constructor(address _wrappedNativeToken, address _wrappedNativeSmartFarmooor);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_wrappedNativeToken`|`address`|The wrapped native token address|
|`_wrappedNativeSmartFarmooor`|`address`|The wrapped native smart farmooor address|


### depositNative

user

*convert $Native to $WrappedNative, deposit into smart farmooor and transfer iou back to the user*


```solidity
function depositNative() external payable;
```

### rescueToken

admin

Rescue ERC20 tokens


```solidity
function rescueToken(address token) external onlyOwner;
```

### rescueNative

Rescue native tokens


```solidity
function rescueNative() external onlyOwner;
```

### receive

fallback

*Only wrapped native token contract is allowed to transfer native token here*


```solidity
receive() external payable;
```

## Events
### DepositNative

```solidity
event DepositNative(address indexed user, uint256 amount);
```

