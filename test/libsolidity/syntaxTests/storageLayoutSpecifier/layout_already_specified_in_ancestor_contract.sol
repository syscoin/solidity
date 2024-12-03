contract A layout at 0x1234 {}

contract B is A {}

contract C is B layout at 0xABCD {}
// ----
// UnimplementedFeatureError 1834: (0-30): Code generation is not supported for contracts with specified storage layout base.
