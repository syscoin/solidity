contract A layout at true ? 42 : 94 {}
contract B layout at 255 + (true ? 1 : 0) {}
// ----
// UnimplementedFeatureError 1834: (0-38): Code generation is not supported for contracts with specified storage layout base.
