# WadRayMath
[Git Source](https://github.com/HedgeFarm/smart-farmer/blob/992c3b4a8bc708d23c14656e504528c18f790128/contracts/yield/interface/aave/WadRayMath.sol)

**Author:**
Aave

Provides functions to perform calculations with Wad and Ray units

*Provides mul and div function for wads (decimal numbers with 18 digits of precision) and rays (decimal numbers
with 27 digits of precision)*

*Operations are rounded. If a value is >=.5, will be rounded up, otherwise rounded down.*


## State Variables
### WAD

```solidity
uint256 internal constant WAD = 1e18;
```


### HALF_WAD

```solidity
uint256 internal constant HALF_WAD = 0.5e18;
```


### RAY

```solidity
uint256 internal constant RAY = 1e27;
```


### HALF_RAY

```solidity
uint256 internal constant HALF_RAY = 0.5e27;
```


### WAD_RAY_RATIO

```solidity
uint256 internal constant WAD_RAY_RATIO = 1e9;
```


## Functions
### wadMul

*Multiplies two wad, rounding half up to the nearest wad*

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function wadMul(uint256 a, uint256 b) internal pure returns (uint256 c);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Wad|
|`b`|`uint256`|Wad|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`c`|`uint256`|= a*b, in wad|


### wadDiv

*Divides two wad, rounding half up to the nearest wad*

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function wadDiv(uint256 a, uint256 b) internal pure returns (uint256 c);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Wad|
|`b`|`uint256`|Wad|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`c`|`uint256`|= a/b, in wad|


### rayMul

Multiplies two ray, rounding half up to the nearest ray

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function rayMul(uint256 a, uint256 b) internal pure returns (uint256 c);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Ray|
|`b`|`uint256`|Ray|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`c`|`uint256`|= a raymul b|


### rayDiv

Divides two ray, rounding half up to the nearest ray

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function rayDiv(uint256 a, uint256 b) internal pure returns (uint256 c);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Ray|
|`b`|`uint256`|Ray|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`c`|`uint256`|= a raydiv b|


### rayToWad

*Casts ray down to wad*

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function rayToWad(uint256 a) internal pure returns (uint256 b);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Ray|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`b`|`uint256`|= a converted to wad, rounded half up to the nearest wad|


### wadToRay

*Converts wad up to ray*

*assembly optimized for improved gas savings, see https://twitter.com/transmissions11/status/1451131036377571328*


```solidity
function wadToRay(uint256 a) internal pure returns (uint256 b);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`a`|`uint256`|Wad|

**Returns**

|Name|Type|Description|
|----|----|-----------|
|`b`|`uint256`|= a converted in ray|


