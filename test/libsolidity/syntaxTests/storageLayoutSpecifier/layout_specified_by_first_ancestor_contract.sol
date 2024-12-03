contract A layout at 42 {}
contract B is A {}
contract C is B {}
contract D is C {}
// ----
// UnimplementedFeatureError 1834: (0-26): Code generation is not supported for contracts with specified storage layout base.
