type MyUint is uint128;
contract C layout at MyUint.wrap(42) {}
// ----
// UnimplementedFeatureError 1834: (24-63): Code generation is not supported for contracts with specified storage layout base.
