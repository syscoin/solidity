interface I {}

contract C layout at uint(bytes32(type(I).interfaceId)) { }
// ----
// UnimplementedFeatureError 1834: (16-75): Code generation is not supported for contracts with specified storage layout base.
