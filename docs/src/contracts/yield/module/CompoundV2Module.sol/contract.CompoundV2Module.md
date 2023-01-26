# CompoundV2Module
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/module/CompoundV2Module.sol)

**Inherits:**
[BaseModule](/contracts/yield/module/BaseModule.sol/contract.BaseModule.md), [ExponentialNoError](/contracts/yield/interface/compoundV2/ExponentialNoError.sol/contract.ExponentialNoError.md)

**Author:**
HedgeFarm team

Upgradability is needed because most compoundV2 forks are built with Proxy - it's implementation could be updated

*The CompoundV2 abstraction is reponsible to abstract the logic of all forks of CompoundV2*


## State Variables
### IOU_DECIMALS
*A constant used for calculating shares*


```solidity
uint256 private constant IOU_DECIMALS = 1e18;
```


### comptroller
The compoundV2 fork comptroller contract


```solidity
address public comptroller;
```


### cToken
The compoundV2 fork cToken contrat used by the module


```solidity
address public cToken;
```


### lastPricePerShare
The last price per share used by the harvest


```solidity
uint256 public lastPricePerShare;
```


## Functions
### initialize

proxy *

Initializes

*Should always be called on deployment*


```solidity
function initialize(
    address _smartFarmooor,
    address _manager,
    address _baseToken,
    uint256 _executionFee,
    address _dex,
    address[] memory _rewards,
    address _comptroller,
    address _cToken,
    string memory _name,
    address _wrappedNative
) public initializer;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_smartFarmooor`|`address`| Smart Farmooor of the Module|
|`_manager`|`address`| Manager of the Module|
|`_baseToken`|`address`| Asset contract address|
|`_executionFee`|`uint256`| Execution fee for withdrawals|
|`_dex`|`address`| Dex Router contract address|
|`_rewards`|`address[]`| Reward contract addresses|
|`_comptroller`|`address`| Compound comtroller|
|`_cToken`|`address`| Compound cToken|
|`_name`|`string`| Name of the Module|
|`_wrappedNative`|`address`| Address of the Wrapped Native token|


### deposit

manager *

Deposit Base token into CompoundV2 fork - provide liquidity


```solidity
function deposit(uint256 amount) external onlySmartFarmooor;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`| Amount of Base token to be deposited|


### withdraw

Withdraw Base token from CompoundV2 fork

*Amount gets converted to shares for withdrawal*


```solidity
function withdraw(uint256 shareFraction, address receiver)
    external
    payable
    onlySmartFarmooor
    returns (uint256 instant, uint256 pending);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`shareFraction`|`uint256`| Fraction representing user share of Base token to withdraw|
|`receiver`|`address`| Receiver of the funds|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`instant`|`uint256`| Instant amount of Base token received|
|`pending`|`uint256`| Pending amount of base token to be received|


### harvest

Harvest the rewards from CompoundV2 fork


```solidity
function harvest(address receiver) external onlySmartFarmooor returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`receiver`|`address`| Receiver of the harvested rewards, in Base token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Total profit harvested|


### getBalance

Get current balance on CompoundV2 fork

*Returns an amount in Base token*


```solidity
function getBalance() public returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of base token|


### getLastUpdatedBalance

Get last updated balance on CompoundV2 fork

*Returns an amount in Base token*


```solidity
function getLastUpdatedBalance() public view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of base token|


### getExecutionFee

Get execution fee needed to withdraw from CompoundV2 fork

*Returns an amount in native token*


```solidity
function getExecutionFee(uint256 shareFraction) external view override returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of native token|


### _lpProfit

helper *

Calculates the profit - the extra Base token earned on top of aum


```solidity
function _lpProfit() private;
```

### _rewardsProfit

Collects the rewards tokens earned on CompoundV2 fork

*Reward tokens are swapped for Base token*


```solidity
function _rewardsProfit() private;
```

### _getUsersShare

Returns the user's share


```solidity
function _getUsersShare(uint256 shareFraction) private returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`shareFraction`|`uint256`|The fraction of the user's share|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|The user's share|


### _wrapNativeForWithdrawals

Wraps native tokens for withdrawals


```solidity
function _wrapNativeForWithdrawals(uint256 balanceNativeBefore) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`balanceNativeBefore`|`uint256`|The balance of native tokens before wrapping|


### _redeem

Redeem base token from CompoundV2


```solidity
function _redeem(uint256 sharesAmount) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`sharesAmount`|`uint256`|Number of shares to burn|


### _wrapNativeTokenProfits

Wraps profits made of native tokens


```solidity
function _wrapNativeTokenProfits() private;
```

### _swapTokenRewardsForBaseToken

Swaps rewards tokens for base tokens


```solidity
function _swapTokenRewardsForBaseToken() private;
```

### _claimAllRewards

Claims all the rewards tokens


```solidity
function _claimAllRewards() private;
```

### _lpToken

CompoundV2 lp token

*overridden for cToken address which is CompoundV2 lp token*


```solidity
function _lpToken() internal view override returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|cToken address|


