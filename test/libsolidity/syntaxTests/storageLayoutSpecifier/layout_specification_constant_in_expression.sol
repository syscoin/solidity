uint constant X = 42;
contract C layout at 0xffff * (50 - X) { }
// ----
// UnimplementedFeatureError 1834: (22-64): Code generation is not supported for contracts with specified storage layout base.
