set -e

# USDC
echo "\n USDC tests \n"
export BASE_TOKEN_NAME="USDC"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Timelock|SmartFarmooor|TraderJoeDex|BaseModule|Stargate|CompoundV2|Aave" -v

# USDT
echo "\n USDT tests \n"
export BASE_TOKEN_NAME="USDT"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Timelock|SmartFarmooor|TraderJoeDex|BaseModule|Stargate|CompoundV2|Aave" -v

# SAVAX
echo "\n SAVAX tests \n"
export BASE_TOKEN_NAME="SAVAX"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Timelock|SmartFarmooor|TraderJoeDex|BaseModule|CompoundV2|Aave" -vv

# BTCB
echo "\n BTCB tests \n"
export BASE_TOKEN_NAME="BTCB"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Timelock|SmartFarmooor|TraderJoeDex|BaseModule|CompoundV2|Aave" -vv

# WAVAX
echo "\n WAVAX tests \n"
export BASE_TOKEN_NAME="WAVAX"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Timelock|SmartFarmooor|NativeGateway|TraderJoeDex|BaseModule|CompoundV2|Aave" -v

# Generic
echo "\n Generic tests \n"
forge test --fork-url https://api.avax.network/ext/bc/C/rpc --fork-block-number 25397500 --etherscan-api-key=$SNOWTRACE_API_KEY --match-contract "Rescuable" -v
