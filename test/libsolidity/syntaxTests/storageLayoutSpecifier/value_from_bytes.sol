bytes32 constant b = "Solidity";
contract C layout at uint8(b[1]) {}
// ----
// UnimplementedFeatureError 1834: (33-68): Code generation is not supported for contracts with specified storage layout base.
