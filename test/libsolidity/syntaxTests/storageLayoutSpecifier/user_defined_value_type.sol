type MyUint is uint128;
MyUint constant x = MyUint.wrap(42);
contract C layout at x {}
// ----
// UnimplementedFeatureError 1834: (61-86): Code generation is not supported for contracts with specified storage layout base.
