# SmartFarmooor
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/SmartFarmooor.sol)

**Inherits:**
[ISmartFarmooor](/contracts/yield/interface/ISmartFarmooor.sol/contract.ISmartFarmooor.md), UUPSUpgradeable, PausableUpgradeable, ReentrancyGuardUpgradeable, ERC20Upgradeable, [Rescuable](/contracts/common/Rescuable.sol/contract.Rescuable.md), [Modifier](/contracts/common/library/Modifier.sol/contract.Modifier.md), [RoleManagement](/contracts/common/RoleManagement.sol/contract.RoleManagement.md)

**Author:**
HedgeFarm Team

Upgradability is needed because the Smart Farmooor is built on top of protocols that have Upgradable Smart contracts

*The Smart Farmooor is composable and integrable into other Yielding strategy*


## State Variables
### HARVEST_PROFIT
*Constant used by the keeper bot*


```solidity
bytes32 public constant HARVEST_PROFIT = keccak256(bytes("HARVEST_PROFIT"));
```


### MAX_BPS
*Constant used for percentage calculation*


```solidity
uint16 public constant MAX_BPS = 10000;
```


### MIN_ALLOCATION
*Constant used to bound the minimum allocation*


```solidity
uint16 public constant MIN_ALLOCATION = 100;
```


### FINISH_PANIC_TOLERANCE
*Tolerance used to take into account small rounding issue when checking if finish panic is ready*


```solidity
uint16 public constant FINISH_PANIC_TOLERANCE = 10;
```


### UINT_MAX
*Constant for the max value of uint256*


```solidity
uint256 public constant UINT_MAX = type(uint256).max;
```


### feeManager
The address receiving the performance fee


```solidity
address public feeManager;
```


### baseToken
The asset used by the Smart Farmooor


```solidity
address public baseToken;
```


### minHarvestThreshold
The minimum profit needed to harvest


```solidity
uint256 public minHarvestThreshold;
```


### numberOfModules
The number of active modules


```solidity
uint256 public numberOfModules;
```


### balanceSnapshot
The snapshot of the base token balance before panicking


```solidity
uint256 public balanceSnapshot;
```


### performanceFee
The current performance fee.


```solidity
uint16 public performanceFee;
```


### cap
The maximum total balance cap for the strategy.


```solidity
uint256 public cap;
```


### minAmount
The minimum amount that can be deposited in the strategy.


```solidity
uint256 public minAmount;
```


### yieldOptions
The list of active modules


```solidity
mapping(uint256 => YieldModuleDetails) public yieldOptions;
```


## Functions
### onlyIfEmptyModule

Make sure Modules are empty before certain Admin operations


```solidity
modifier onlyIfEmptyModule();
```

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
    string memory _name,
    string memory _symbol,
    address _feeManager,
    address _baseToken,
    uint256 _minHarvestThreshold,
    uint16 _performanceFee,
    uint256 _cap,
    address _manager,
    address _admin,
    uint256 _minAmount,
    address[] memory _privateAccess
) external initializer;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_name`|`string`| Name of the Strategy|
|`_symbol`|`string`| Symbol of the Strategy|
|`_feeManager`|`address`| Address of the Fee Manager|
|`_baseToken`|`address`| Asset of the Strategy|
|`_minHarvestThreshold`|`uint256`| Minimum amount of baseToken needed to harvest|
|`_performanceFee`|`uint16`| Performance fee on profits, capped at 20%|
|`_cap`|`uint256`| Strategy max Deposit cap|
|`_manager`|`address`| Strategy manager role|
|`_admin`|`address`| Strategy Admin role|
|`_minAmount`|`uint256`| Strategy min deposit amount|
|`_privateAccess`|`address[]`|list of addresses that will have private access to the protocol|


### _authorizeUpgrade

Makes sure only the owner can upgrade, called from upgradeTo(..)


```solidity
function _authorizeUpgrade(address newImplementation) internal override onlyRole(DEFAULT_ADMIN_ROLE);
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


### addModule

admin *

Add a new Module to the list

*Only when current modules are empty*


```solidity
function addModule(IYieldModule _module)
    external
    onlyRole(DEFAULT_ADMIN_ROLE)
    onlyNotZeroAddress(address(_module))
    onlyIfEmptyModule
    whenPaused;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_module`|`IYieldModule`| New Module to be added|


### removeModule

Remove a Module from the list

*Module should be in the list*


```solidity
function removeModule(uint256 _moduleId) external onlyRole(MANAGER_ROLE) whenPaused onlyIfEmptyModule;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_moduleId`|`uint256`| Mapping index of the Module to be removed|


### setModuleAllocation

Set new allocation to all the Modules

*Total allocation should be 100%, should be set after a addModule*


```solidity
function setModuleAllocation(uint256[] memory _allocation)
    external
    onlyRole(MANAGER_ROLE)
    whenPaused
    onlyIfEmptyModule;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_allocation`|`uint256[]`| List of the new allocations|


### panic

Removes funds from Modules, stores them on this contract

*Pauses the Strategy to avoid Deposit / Withdraw in case of emergency*


```solidity
function panic() external payable onlyRole(PANICOOOR_ROLE);
```

### finishPanic

Pushes funds into Modules

*Unpauses the contracts*


```solidity
function finishPanic() external onlyRole(MANAGER_ROLE) whenPaused;
```

### setFeeManager

Set a new Fee Manager


```solidity
function setFeeManager(address newFeeManager) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newFeeManager`|`address`| Address of the new Fee Manager|


### setMinHarvestThreshold

Set a new Minimum harvest threshold

*Should be set according to TVL and gas costs, should prevent Keepers to harvest too often*


```solidity
function setMinHarvestThreshold(uint256 newMinHarvestThreshold) external onlyRole(MANAGER_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newMinHarvestThreshold`|`uint256`| New minimum harvest threshold|


### setPerformanceFee

Set the new Performance fee

*Maximum 20%*


```solidity
function setPerformanceFee(uint16 newPerformanceFee) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newPerformanceFee`|`uint16`| New performance fee amount|


### setCap

Set the new Cap


```solidity
function setCap(uint256 newCap) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newCap`|`uint256`| New cap amount for Deposits|


### setMinAmount

Set the new min amount


```solidity
function setMinAmount(uint256 newMinAmount) external onlyRole(DEFAULT_ADMIN_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newMinAmount`|`uint256`| New min amount for Deposits|


### pause

Pause the Strategy


```solidity
function pause() external onlyRole(DEFAULT_ADMIN_ROLE);
```

### unpause

Unpause the Strategy


```solidity
function unpause() external onlyRole(DEFAULT_ADMIN_ROLE);
```

### rescueToken

Rescue a stuck ERC20 token


```solidity
function rescueToken(address token) external onlyRole(DEFAULT_ADMIN_ROLE);
```

### rescueNative

Rescue native tokens


```solidity
function rescueNative() external onlyRole(DEFAULT_ADMIN_ROLE);
```

### pricePerShare

public *

Returns the current price per share


```solidity
function pricePerShare() external returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint  The current price per share|


### lastUpdatedPricePerShare

Returns the last updated price per share


```solidity
function lastUpdatedPricePerShare() external view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint  The last updated price per share|


### deposit

Deposit Base token to the Strategy and get an IOU in exchange

*Amount in base token decimals, this contract should be approved as spender before calling Deposit*


```solidity
function deposit(uint256 _amount) external nonReentrant whenNotPaused onlyRoleOrOpen(PRIVATE_ACCESS_ROLE);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amount`|`uint256`| Amount of base token to transfer to the Strategy|


### withdraw

Withdraw from the Strategy, get Base token in exchange of IOU

*Shares are in Strategy Decimals*


```solidity
function withdraw(uint256 _shares)
    external
    payable
    whenNotPaused
    nonReentrant
    onlyRoleOrOpen(PRIVATE_ACCESS_ROLE)
    returns (uint256, uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_shares`|`uint256`| Amount of shares to be burned in exchange for Base token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Base token amount that is transferred directly to caller|
|`<none>`|`uint256`|uint256  Base token amount that is transferred asynchronously to caller|


### harvest

Harvest the Strategy : collect profit and compound them by depositing back into Modules

*Compounds Base token, increases LP holdings on Modules*


```solidity
function harvest() external whenNotPaused nonReentrant returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Profits harvested|


### getExecutionFee

Get the withdrawal execution fee for a given amount

*Currently necessary for Modules that implement asynchronous protocols. Fee is in AVAX*


```solidity
function getExecutionFee(uint256 _shares) public view returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_shares`|`uint256`| Amount of shares wished to be withdrawn|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Returns the execution fee, in AVAX|


### getModulesBalance

helper *

Get current balance across all Modules

*Amount is in Base token*


```solidity
function getModulesBalance() public returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Returns total amount in Base token|


### getLastUpdatedModulesBalance

Get last updated balance across all Modules

*Amount is in Base token*


```solidity
function getLastUpdatedModulesBalance() public view returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Returns total amount in Base token|


### _getUsersShare

Get users share in proportion to the amount they provide


```solidity
function _getUsersShare(uint256 _amount) private returns (uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amount`|`uint256`| Amount of base token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Amount of shares|


### _deposit

Pushes the funds across all the modules according to the allocation

*Amount is in base token*


```solidity
function _deposit(uint256 _amount) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_amount`|`uint256`| Amount to be deposited|


### _withdraw

Pulls the funds from the all the modules according to users share fraction

*Receivers needs to be specified in case of Async withdrawal*


```solidity
function _withdraw(uint256 _shareFraction, address _receiver) private returns (uint256, uint256);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_shareFraction`|`uint256`| Amount of Users Shares to be withdrawn|
|`_receiver`|`address`| Address of the receiver for the Base token|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint  Instant amount withdrawn|
|`<none>`|`uint256`|uint  Async amount withdrawn|


### _harvest

Collects the profits from all the Modules and compounds them


```solidity
function _harvest() private returns (uint256);
```
**Returns**

|Name|Type|Description|
|----|----|-----------|
|`<none>`|`uint256`|uint256  Profits harvested|


### _setFeeManager

Set a new Fee Manager implementation


```solidity
function _setFeeManager(address newFeeManager) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newFeeManager`|`address`| Address of the new Manager|


### _setCap

Set a new Cap implementation


```solidity
function _setCap(uint256 newCap) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newCap`|`uint256`| Amount of the new Cap|


### _setMinAmount

Set a new min amount implementation


```solidity
function _setMinAmount(uint256 newMinAmount) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newMinAmount`|`uint256`| Min amount to deposit|


### _setBaseToken

Sets Base token asset


```solidity
function _setBaseToken(address newBaseToken) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newBaseToken`|`address`| Address of the Base token contract|


### _setMinHarvestThreshold

Set new Minimum harvest threshold implementation


```solidity
function _setMinHarvestThreshold(uint256 newMinHarvestThreshold) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newMinHarvestThreshold`|`uint256`| New minimum harvest threshold|


### _setPerformanceFee

Set new Performance fee implementation


```solidity
function _setPerformanceFee(uint16 newPerformanceFee) private;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`newPerformanceFee`|`uint16`| New Performance fee|


### _allocationIsCorrect


```solidity
function _allocationIsCorrect() private view;
```

### checkUpkeep

keeper *

Keeper check interface. If Harvesting is possible, returns true

*Harvesting threshold sould not be too low*


```solidity
function checkUpkeep(bytes calldata checkData) external pure returns (bool upkeepNeeded, bytes memory performData);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`checkData`|`bytes`| Harvesting check|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`upkeepNeeded`|`bool`| Not used - Chainlink compliant|
|`performData`|`bytes`| Not used - Chainlink compliant|


### performUpkeep

Perform the Keeper operation

*Profit must be bigger than minimum harvest threshold*


```solidity
function performUpkeep(bytes calldata performData) external;
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`performData`|`bytes`| Harvesting operation|


### receive

fallback *


```solidity
receive() external payable;
```

## Events
### Deposit

```solidity
event Deposit(address indexed user, uint256 amount);
```

### Withdraw

```solidity
event Withdraw(address indexed user, uint256 shares, uint256 amount);
```

### Harvest

```solidity
event Harvest(uint256 netProfit);
```

### AllocationChange

```solidity
event AllocationChange();
```

