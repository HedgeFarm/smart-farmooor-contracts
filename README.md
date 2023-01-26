# Smart Farmooor

The Smart Farmooor is a vault that helps you earn a higher return on your cryptocurrency by analyzing and allocating your assets across multiple yield markets.

![alt text](https://github.com/HedgeFarm/smart-farmooor-contracts/blob/master/docs/smartFarmooor-design.jpg?raw=true)

## Application

You can access the Smart Farmooor at : https://hedgefarm.finance/smart-farmooor

The Documentation : https://docs.hedgefarm.finance/

## Dependencies

Install foundry deps :

`forge install`

## Tests

To run all tests against each token : `./forge_test.sh`

To run specific tests against a specific token :
1. Set the base token you want to run the tests against in `./forge_testbench.sh`.
2. Run `./forge_testbench.sh`

## Coverage

To generate coverage summary and lcov.info file: 
1. Set the token you want to use to run the tests in `./forge_coverage.sh`
2. Run: `./forge_coverage.sh`
3. Coverage summary is outputted in the terminal
4. To visualize coverage:
   1. Install the vscode "Coverage gutters" extension
   2. cmd+shft+p > "Display Coverage Gutters"

Note0: We use generic tests so that we can test components with all supported tokens. Coverage may vary slightly depending on the token used to run the tests. In particular, the coverage of a module is zero if it does not support the selected token. The native gateway will have coverage greater than zero only if the native token is selected.    
Therefore, you **should at least run the coverage with USDC and WAVAX in order to have a full coverage** report.

Note1: Forge outputs coverage for all .sol file that are not considered as a test. Therefore the coverage summary has unecessary rows. You must only consider coverage for the contract in the `contracts/` folder, except for `WadRayMath.sol` and `ExponentialNoError.sol` that are respectively Aave and Compound libraries.

## Deployment 

Currently we are deployed on Avalanche C-Chain.

HedgeFarm uses Timelock to delay critical changes (48h). Only Owner multisig can dispatch function calls to Timelock. Actions protected by Timelock are the fundamental to for the protocol (like upgrades or add/removing modules)
therefore we ensure maximal protection using multisig + Timelock.     
Manager multisig is used for daily operations that cannot have any impact on users funds and do not require such high security measures.       
Also worth mentioning that all our contracts are deployed from single address (EOA) to maintain strict ownership.

All addresses are provided in the [docs](https://docs.hedgefarm.finance/developers/deployed-contracts/alpha-2-the-smart-farmooor-btc.b)

Details about access control(timelock, manager, owner) are specified [Access Control paragraph](#access-control)

By default, contracts are ``paused`` after deployment. The deployment script can be found [here](script/Deployer.s.sol). There is also an update script that allows to deploy only a subset of the component of the protocol [here](script/Updatoor.s.sol) 

### **Environment variables**

Please create directory `environment/variables/` in which you will add evi

Required env vars for deployments:

```
RPC_URL=
SNOWTRACE_API_KEY=
TIMELOCK_ADDRESS=
OWNER_ADDRESS=
MANAGER_ADDRESS=
DEPLOYER_ADDRESS=
DEPLOYER_PRIVATE_KEY=
```

In order to deploy locally with anvil, you can use this dummy configuration (relative file path: `environment/variables/public/env_localhost.sh`): 
```
export RPC_URL=http://localhost:8545
#prod addresses
export TIMELOCK_ADDRESS=0x5A4AF6ABcDbe2FB00Bb6D125407dFd09D936c393
export OWNER_ADDRESS=0x9b915390Aec8E18BE119c038F1e33E57a5ba53E5
export MANAGER_ADDRESS=0x4804b95bD24B1bb8CcAbBaE055D713b501511270
export DEX_ADDRESS=0x0b5e0Ab0650556827E1EbbD16C9Ee837DaAb12Ef
export BTCB_SMART_FARMOOOR=0x3C390b91Fc2f248E75Cd271e2dAbF7DcC955B1A3

export SNOWTRACE_API_KEY=

# anvil default test account #1
export DEPLOYER_ADDRESS=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
export DEPLOYER_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

**NOTICE:** please use your own SNOWTRACE_API_KEY (Avalanche C-Chain block explorer)

Note that the EnvData.s.sol script file reads environment variables if they exist. When run locally, the .env file is sourced before the execution of any script so they are always present. On the other hand, the github action does not source the .env before running the tests because it does not have access to it.   
So the environment variables are used if they exist otherwise default values are used (this is how regular tests are run). In test environment `makeAddr(OWNER)` and `makeAddr(MANAGER)` are used to pull the configuration.




### **Deployment types**

There are two deployment types **public** and **private**

1. Public deployment is open for everyone to deposit/withdraw. Config files .env are located in `./environment/variables/public`
2. Private deployment has a restricted list of accounts who can deploy/withdraw. Config files .env are located in `./environment/variables/private`

### **Deployment/Update script**

To deploy/update smart contract use `./forge_infra.sh` script.

usage of `./forge_infra.sh` (more examples in the script file):
```
./forge_infra.sh [action] [asset] [dest_env] [optinal_resume]
example:   
./forge_infra.sh deploy btcb localhost 
```

### **Check for storage conflicts**

The storage must be checked before merging any commit that modify a contract to ensure that the modification will not break the storage. This check is also automatically done by a github action.

Run : `./forge_inspect.sh check`

In case of conflict:
1. Fix the problem
2. Run `./forge_inspect.sh generate` to generate a new `environment/storage/.storage-layout` file
3. Run `./forge_inspect.sh check` to verify everything is fine

In case you want to check a new contract:
1. Run `./forge_inspect.sh check` to verify the storage is fine for the old contracts
2. In case of conflict, follow the above procedure then continue with the next step
3. Add the new contract in `./forge_inspect.sh`
4. Run `./forge_inspect.sh generate`
5. Run `./forge_inspect.sh check` to verify everything is fine

**Do never remove or untrack the file `environment/storage/.storage-layout` !**

### **Local testnet deployment** 

Anvil is used as local testnet. To run it type:

```
anvil --fork-url https://api.avax.network/ext/bc/C/rpc
```
To run test deployment :

1. First set up your local `environment/variables/<deployment_type>/env_localhost.sh` file with the appropriate data.
2. Use script `./forge_infra.sh`

### **Mainnet deployment** 

To run deployment (public) :

1. First set up your local `environment/variables/<deployment_type>/env_prod.sh` (or `environment/variables/<deployment_type>/env_stage.sh`) file with the appropriate data.
2. Use script `./forge_infra.sh`

## Upgrades

Prior to a upgrade, the current strategy should be ``panic()``
This will properly withdraw funds from modules. The upgrade can then be performed on a clean state.

Note that you must manually set the addresses of the components that won't be updated in `script/Updatoor.sol`

### **Local testnet update** 

Anvil is used as local test-net. To run it type:

```
anvil --fork-url https://api.avax.network/ext/bc/C/rpc
```
To run test deployment :

1. First set up your local `environment/variables/<deployment_type>/.env_localhost` file with the appropriate data.
2. Use script `./forge_infra.sh`

### **Mainnet update** 

To run deployment :

1. First set up your local `environment/variables/<deployment_type>/.env_prod` (or `environment/variables/<deployment_type>/.env_stage`) file with the appropriate data.
2. Use script `./forge_infra.sh`

## Access Control

There are 4 roles defined : 
- `ADMIN_ROLE`
- `MANAGER_ROLE`
- `PANICOOOR_ROLE`
- `PRIVATE_ACCESS_ROLE`

The `ADMIN_ROLE` is held by 48h Timelock smart contract.

The `MANAGER_ROLE` is held by team Multisig and TimeLock. MANAGER_ROLE allows the team to operate the protocol and adjust certain parameters such as the module allocation.

The `PANICOOOR_ROLE` is held by team Multisig and TimeLock. It will be also given to off-chain app monitoring the health of the protocol and potential attacks. This role gives ability pause the contract (all interactions including withdrawals), contract can be resumed by MANAGER_ROLE accounts. 

The `PRIVATE_ACCESS_ROLE` is held by restricted set of accounts who can interact with the smart contract (IMPORTANT: this role is set only for private deployment)

## Technical Documentation

To generate and build the tech doc:
1. Run: `forge doc --build`
2. Doc is stored in the [docs](/docs/) folder

To serve the documentation:
1. Run: `forge doc --serve --port 4000`

Documentation can also be read as a mdbook:
1. Open [SUMMARY.md](/docs/src/SUMMARY.md) with a md reader

### **Call graph and inheritance graph**

To generate call graph and inheritance graph:
1. Install the vscode "Solidity Metrics" extension
2. Right click on a contract in the explorer -> Solidity: Metrics
