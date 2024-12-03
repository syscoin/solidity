contract A {}
contract B is A {}
contract C is B layout at 42 {}
contract D is C {}
// ----
// UnimplementedFeatureError 1834: (33-64): Code generation is not supported for contracts with specified storage layout base.
