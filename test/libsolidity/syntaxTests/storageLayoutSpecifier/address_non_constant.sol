contract A {}

contract C layout at address(new A()) {}
contract D layout at uint160(address(this)) {}
// ----
// UnimplementedFeatureError 1834: (15-55): Code generation is not supported for contracts with specified storage layout base.
