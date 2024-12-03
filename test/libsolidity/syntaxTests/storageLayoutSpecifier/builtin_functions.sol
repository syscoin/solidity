contract A layout at block.basefee { }
contract B layout at block.chainid { }
contract C layout at block.number { }
contract D layout at uint160(address(block.coinbase)) { }
contract E layout at block.prevrandao { }
contract F layout at uint(blockhash(0)) { }
contract G layout at msg.value { }
contract H layout at msg.sender { }
contract I layout at msg.data { }
contract J layout at tx.gasprice { }
contract K layout at uint160(tx.origin) { }
contract L layout at address(this).balance { }
contract M layout at uint(address(this).codehash) { }

// ====
// EVMVersion: >=paris
// ----
// UnimplementedFeatureError 1834: (0-38): Code generation is not supported for contracts with specified storage layout base.
