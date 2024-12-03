contract A layout at this {}
contract B layout at super {}
contract C layout at msg {}
contract D layout at tx {}
contract E layout at block {}
// ----
// UnimplementedFeatureError 1834: (0-28): Code generation is not supported for contracts with specified storage layout base.
