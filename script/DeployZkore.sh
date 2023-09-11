#!/bin/bash

# Below should be set before running Bash script

export CHAIN_ID=80001
export RPC_URL="https://polygon-mumbai-bor.publicnode.com"
export VERIFIER_URL="https://api-testnet.polygonscan.com/api"
export ETHERSCAN_API_KEY=
export PRIVATE_KEY=

forge script script/DeployZkore.s.sol:DeployScript \
  --chain-id "$CHAIN_ID" \
  --rpc-url "$RPC_URL" \
  --etherscan-api-key "$ETHERSCAN_API_KEY" \
  --verifier-url "$VERIFIER_URL" \
  --broadcast \
  --verify \
  --private-key "$PRIVATE_KEY"

#   --constructor-args $(cast abi-encode "constructor(address,address,address,address,address)" \
#   0x025805e096E8d18670b784bD7e0C89567b0C9965 0x1DE82c6F836ab8f0e34e4632c04f9f9A075891cb \
#   0x508A6f64a692046D41c23Da376dC3daff8c856B3 0xaAC3bEF2AB4DeD75aa7eAB6C3E860A311e14eDc6 \
#   0xf19B762e1bFD8a03db6E26017d3eDB98aC8eF6D8) \
