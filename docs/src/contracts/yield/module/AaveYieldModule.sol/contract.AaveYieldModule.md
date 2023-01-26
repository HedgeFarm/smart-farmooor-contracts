# AaveYieldModule
[Git Source](https://github.com-hedgefarm/HedgeFarm/smart-farmer/blob/c90db012f9c5fe4b328d8988c68447eed814b014/contracts/yield/module/AaveYieldModule.sol)

**Inherits:**
[BaseModule](/contracts/yield/module/BaseModule.sol/contract.BaseModule.md)

**Author:**
HedgeFarm team

Upgradability is needed because Aave protocol is built with Proxy - it's implementation could be updated

*The Aave module is reponsible for interacting with the Aave lending protocol*


## State Variables
### REFERRAL_CODE
*A constant specific to Aave*


```solidity
uint16 private constant REFERRAL_CODE = 0;
```


### IOU_DECIMALS_EXP
*A constant used for calculating shares*


```solidity
uint256 private constant IOU_DECIMALS_EXP = 1e18;
```


### pool
The Aave pool contract


```solidity
address public pool;
```


### poolDataProvider
The Aave pool data provider contract


```solidity
address public poolDataProvider;
```


### rewardsController
The Aave rewards controller


```solidity
address public rewardsController;
```


### aToken
The aave aToken contract used by the module


```solidity
address public aToken;
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
    AaveParams memory _params,
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
|`_params`|`AaveParams`|Aave configuration parameters|
|`_name`|`string`| Name of the Module|
|`_wrappedNative`|`address`| Address of the Wrapped Native token|


### deposit

manager *

Deposit Base token into Aave - provide liquidity


```solidity
function deposit(uint256 amount) external onlySmartFarmooor;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`amount`|`uint256`| Amount of Base token to be deposited|


### withdraw

Withdraw Base token from Aave

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

Harvest the rewards from Aave


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

Get current balance on Aave

*Returns an amount in Base token*


```solidity
function getBalance() public view returns (uint256);
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

Get execution fee needed to withdraw from Aave

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

### _lpToken

Aave lp token

*overridden for aToken address which is aave lp token*


```solidity
function _lpToken() internal view override returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|aToken address|


## Structs
### AaveParams
*The list of params needed to initialise the module*


```solidity
struct AaveParams {
    address _pool;
    address _poolDataProvider;
    address _rewardsController;
    address _aToken;
}
```

