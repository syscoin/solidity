contract A {
    function f() public pure {}
}

contract C is A layout at this.f.address {}
// ----
// UnimplementedFeatureError 1834: (48-91): Code generation is not supported for contracts with specified storage layout base.
