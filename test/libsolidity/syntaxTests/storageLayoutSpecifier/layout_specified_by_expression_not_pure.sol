function f(uint x) returns (uint) { return x + 1; }
contract A layout at f(2) {}
// ----
// Warning 2018: (0-51): Function state mutability can be restricted to pure
// UnimplementedFeatureError 1834: (52-80): Code generation is not supported for contracts with specified storage layout base.
