contract A {}
contract C layout at A(address(0x1234)) {}
// ----
// UnimplementedFeatureError 1834: (14-56): Code generation is not supported for contracts with specified storage layout base.
