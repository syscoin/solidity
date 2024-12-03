function f() pure returns (uint256) {
    return 128;
}
contract C layout at f() { }
// ----
// UnimplementedFeatureError 1834: (56-84): Code generation is not supported for contracts with specified storage layout base.
