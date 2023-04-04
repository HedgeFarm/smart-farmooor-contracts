# StargateYieldModule
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/module/StargateYieldModule.sol)

**Inherits:**
[BaseModule](/contracts/yield/module/BaseModule.sol/contract.BaseModule.md)

**Author:**
HedgeFarm team

Upgradability is needed because Stargate protocol is built with Proxy - it's implementation could be updated

*The Stargate Yield module is responsible for interacting with the Stargate protocol and manage liquidity on it*


## State Variables
### IOU_DECIMALS_EXP
*A constant used for calculating shares*


```solidity
uint256 private constant IOU_DECIMALS_EXP = 1e18;
```


### lpStaking
The Stargate staking contract


```solidity
address public lpStaking;
```


### stargateRouter
The Stargate router contract


```solidity
address public stargateRouter;
```


### pool
The Stargate pool contract


```solidity
address public pool;
```


### routerPoolId
The Stargate router pool id


```solidity
uint16 public routerPoolId;
```


### redeemFromChainId
The id of the chain used for async redeem


```solidity
uint16 public redeemFromChainId;
```


### lpStakingPoolId
The Stargate staking pool id


```solidity
uint256 public lpStakingPoolId;
```


### lpProfitWithdrawalThreshold
The threshold in base token to harvest lp profit


```solidity
uint256 public lpProfitWithdrawalThreshold;
```


### lastPricePerShare
The last price per share used by the harvest


```solidity
uint256 public lastPricePerShare;
```


## Functions
### constructor

Disable initializing on implementation contract


```solidity
constructor();
```

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
    StargateParams memory params,
    string memory _name,
    address _wrappedNative
) external initializer;
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
|`params`|`StargateParams`| Stargate configuration parameters|
|`_name`|`string`| Name of the Module|
|`_wrappedNative`|`address`| Address of the Wrapped Native token|


### setRouterPoolId

admin *

Sets the Stargate PoolId

*Often subject to changes*


```solidity
function setRouterPoolId(uint16 _routerPoolId) external onlyOwnerOrManager;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_routerPoolId`|`uint16`| New Id of the pool|


### setRedeemFromChainId

Sets the Stargate redeem Chain ID

*Id of the chain where the funds could be withdrawn to*


```solidity
function setRedeemFromChainId(uint16 _redeemFromChainId) external onlyOwnerOrManager;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_redeemFromChainId`|`uint16`| New Chain Id for remote redeems|


### setLpStakingPoolId

Sets the Stargate stacking pool Id


```solidity
function setLpStakingPoolId(uint256 _lpStakingPoolId) external onlyOwnerOrManager;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_lpStakingPoolId`|`uint256`| New Stacking pool Id|


### setLpProfitWithdrawalThreshold

Sets the minimum LP profit threshold


```solidity
function setLpProfitWithdrawalThreshold(uint256 _lpProfitWithdrawalThreshold) external onlyOwnerOrManager;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_lpProfitWithdrawalThreshold`|`uint256`| Threshold amount in Base token|


### deposit

manager *

Deposit Base token into Stargate - provide liquidity and stake the LP


```solidity
function deposit(uint256 amount) external onlySmartFarmooor;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`| Amount of Base token to be deposited|


### withdraw

Withdraw Base token from Stargate

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

Harvest the rewards from Stargate


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

Get current balance on Stargate

*Returns an amount in Base token*


```solidity
function getBalance() public view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of base token|


### getLastUpdatedBalance

Get last updated balance on Stargate pool

*Returns an amount in Base token*


```solidity
function getLastUpdatedBalance() public view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of base token|


### getExecutionFee

Get execution fee needed to withdraw

*Returns an amount in native token*


```solidity
function getExecutionFee(uint256 shareFraction) external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of native token|


### _setLpStaking

admin helper *

Set Stargate lpStaking contract


```solidity
function _setLpStaking(address _lpStaking) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_lpStaking`|`address`| Address of lpStaking contract|


### _setStargateRouter

Set Stargate Router contract


```solidity
function _setStargateRouter(address _stargateRouter) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_stargateRouter`|`address`| Address of Router contract|


### _setPool

Set Stargate Pool


```solidity
function _setPool(address _pool) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_pool`|`address`| Address of Pool contract|


### _setRouterPoolId

Set Stargate PoolId


```solidity
function _setRouterPoolId(uint16 _routerPoolId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_routerPoolId`|`uint16`| Pool Id|


### _setRedeemFromChainId

Set Stargate Redeem chain Id


```solidity
function _setRedeemFromChainId(uint16 _redeemFromChainId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_redeemFromChainId`|`uint16`| Redeem Chain Id|


### _setLpStakingPoolId

Set Stargate Staking pool Id


```solidity
function _setLpStakingPoolId(uint256 _lpStakingPoolId) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_lpStakingPoolId`|`uint256`| Redeem Chain Id|


### _setLpProfitWithdrawalThreshold

Set the minimum LP profit threshold


```solidity
function _setLpProfitWithdrawalThreshold(uint256 _lpProfitWithdrawalThreshold) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_lpProfitWithdrawalThreshold`|`uint256`| Threshold amount in Base token|


### _lpProfit

manager helper *

Calculates the profit - the extra Base token earned on top of aum


```solidity
function _lpProfit() private;
```

### _rewardsProfit

Collects the rewards tokens earned on Stargate

*Reward tokens are swapped for Base token*


```solidity
function _rewardsProfit() private;
```

### _withdraw

Withdraw Base token from Stargate

*Amount gets converted to LP shares for withdrawal*


```solidity
function _withdraw(uint256 amount, address receiver, function (uint256, address) internal redeem)
    private
    returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`| Amount of Base token to withdraw|
|`receiver`|`address`| Receiver of the funds|
|`redeem`|`function (uint256, address) internal`||

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|Amount of Base token received|


### _syncRedeem

Synchronous and instant withdraw from Stargate pool

*When Stargate has enough delta credits, Withdrawals should be instant*


```solidity
function _syncRedeem(uint256 lpAmount, address receiver) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`lpAmount`|`uint256`| amount of Stargate LP to withdraw|
|`receiver`|`address`| Receiver of the Base token|


### _asyncRedeem

Asynchronous and delayed withdraw from Stargate pool

*When Stargate does not have enough delta credits, Withdrawals are asynchronous*


```solidity
function _asyncRedeem(uint256 lpAmount, address receiver) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`lpAmount`|`uint256`| amount of Stargate LP to withdraw|
|`receiver`|`address`| Receiver of the Base token|


### _totalLpTokens

Get total Stargate Lp tokens staked


```solidity
function _totalLpTokens() private view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of Stargate Lp tokens|


### _poolDeltaCredit

Amount of Delta credits available on Stargate Pool


```solidity
function _poolDeltaCredit() internal view virtual returns (uint256);
```

### _fixoor

Stargate balance fixer - needed for 100% withdrawals

*Stargate is not accurate enough to rely on Base token amount during withdrawals*


```solidity
function _fixoor(uint256 amount) private view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`| Amount of Base token|


### _amountFromShareFraction

Calculate amount of base tokens from given share fraction

*share fraction that represents 1 (100%) is equal to IOU_DECIMALS so if fraction is bigger we just return the maximum value ( getBalance())*


```solidity
function _amountFromShareFraction(uint256 shareFraction) private view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`shareFraction`|`uint256`| fraction of user iou share|


### _baseTokenDecimalsExp

Exponentiation. 10 is base and decimals() is the exponent


```solidity
function _baseTokenDecimalsExp() private view returns (uint256);
```

### _lpToken

Stargate lp token

*Pool is ERC20 contract which emits lp tokens*


```solidity
function _lpToken() internal view override returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|pool ERC20 address|


## Structs
### StargateParams
*The list of params needed to initialise the module*


```solidity
struct StargateParams {
    address lpStaking;
    address stargateRouter;
    address pool;
    uint16 routerPoolId;
    uint16 redeemFromChainId;
    uint256 lpStakingPoolId;
    uint256 lpProfitWithdrawalThreshold;
}
```

