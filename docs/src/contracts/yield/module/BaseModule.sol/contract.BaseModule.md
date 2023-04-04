# BaseModule
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/module/BaseModule.sol)

**Inherits:**
[IYieldModule](/contracts/yield/interface/IYieldModule.sol/contract.IYieldModule.md), UUPSUpgradeable, OwnableUpgradeable, [Rescuable](/contracts/common/Rescuable.sol/contract.Rescuable.md)


## State Variables
### smartFarmooor
The smart farmooor of the module


```solidity
address public smartFarmooor;
```


### dex
The dex used to swap the rewards


```solidity
address public dex;
```


### manager
The manager of the module


```solidity
address public manager;
```


### baseToken
The asset used by the module


```solidity
address public baseToken;
```


### executionFee
The fee in native token that has to be paid in case of async withdrawal


```solidity
uint256 public executionFee;
```


### rewards
The list of rewards earned by the module


```solidity
address[] public rewards;
```


### name
Name of the Module


```solidity
string public name;
```


### wrappedNativeToken
Wrapped Native Token address


```solidity
address public wrappedNativeToken;
```


### ______gap
*Reserved storage space to allow for layout changes in the future*


```solidity
uint256[50] private ______gap;
```


## Functions
### onlyOwnerOrManager


```solidity
modifier onlyOwnerOrManager();
```

### onlySmartFarmooor


```solidity
modifier onlySmartFarmooor();
```

### _initializeBase

proxy *

Initializes

*Should always be called on deployment*


```solidity
function _initializeBase(
    address _smartFarmooor,
    address _manager,
    address _baseToken,
    uint256 _executionFee,
    address _dex,
    address[] memory _rewards,
    string memory _name,
    address _wrappedNative
) internal onlyInitializing;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_smartFarmooor`|`address`|Smart Farmooor of the module|
|`_manager`|`address`| Manager of the Module|
|`_baseToken`|`address`| Asset contract address|
|`_executionFee`|`uint256`| Execution fee for withdrawals|
|`_dex`|`address`| Dex Router contract address|
|`_rewards`|`address[]`| Reward contract addresses.|
|`_name`|`string`| Name of the Module|
|`_wrappedNative`|`address`| Address of the Wrapped Native token|


### _authorizeUpgrade

Upgrade to new implementation contract

*Point to new implementation contract*


```solidity
function _authorizeUpgrade(address newImplementation) internal override onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newImplementation`|`address`|Contract address of newImplementation|


### getImplementation

Get current implementation contract


```solidity
function getImplementation() external view returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|address  Returns current implement contract|


### setDex

admin *

Set Dex contract address


```solidity
function setDex(address _dex) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_dex`|`address`| Dex contract address|


### setExecutionFee

Set execution fee contract address

*AVAX Amount*


```solidity
function setExecutionFee(uint256 _executionFee) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_executionFee`|`uint256`| New execution fee|


### setRewards

Set new reward tokens

*Set an old reward token address to address(0) in case it should be disabled. Order of reward tokens matter in the array : reward/incentives token address then Native token*


```solidity
function setRewards(address[] memory _rewards) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_rewards`|`address[]`| Array of new reward token|


### approveDex

Approve dex router contract address as spender


```solidity
function approveDex() external onlyOwner;
```

### rescueToken

Rescue any ERC20 token stuck on the contract


```solidity
function rescueToken(address token) external onlyOwner;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`token`|`address`| Contract address of the token to rescue|


### rescueNative

Rescue Native token stuck on the contract


```solidity
function rescueNative() external onlyOwner;
```

### _setSmartFarmooor

helper *

Set the Smart Farmooor of the Module


```solidity
function _setSmartFarmooor(address _smartFarmooor) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_smartFarmooor`|`address`| Address of the Smart Farmooor|


### _setDex

Set Dex contract address


```solidity
function _setDex(address _dex) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_dex`|`address`| Dex contract address|


### _setManager

Set the Manager of the Module


```solidity
function _setManager(address _manager) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_manager`|`address`| Address of the Manager|


### _setBaseToken

Set the Base token of the Module


```solidity
function _setBaseToken(address _baseToken) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_baseToken`|`address`| Address of the Base token contract|


### _setExecutionFee

Set execution fee contract address

*AVAX Amount*


```solidity
function _setExecutionFee(uint256 _executionFee) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_executionFee`|`uint256`| New execution fee|


### _setRewards

Set new reward tokens

*Set an old reward token address to address(0) in case it should be disabled. Order of reward tokens matter in the array : Native then reward/incentives token address*


```solidity
function _setRewards(address[] memory _rewards) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_rewards`|`address[]`| Array of new reward token|


### _setWrappedNativeToken

Set wrapped native token address


```solidity
function _setWrappedNativeToken(address _wrappedNative) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_wrappedNative`|`address`| Wrapped native token|


### _setName


```solidity
function _setName(string memory _name) private;
```

### _approveDex

Approve dex router contract address as spender


```solidity
function _approveDex() private;
```

### _lpToken

Function to override in each module with it's lp token address

*overridden in each module implementation*


```solidity
function _lpToken() internal virtual returns (address);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`address`|lp token address|


### receive

fallback *


```solidity
receive() external payable;
```

