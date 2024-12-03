contract A {
    function f() external pure {}
}

contract C layout at A.f { }
// ----
// UnimplementedFeatureError 1834: (50-78): Code generation is not supported for contracts with specified storage layout base.
