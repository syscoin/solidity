contract A {
    function f() public {}
}
contract C is A layout at uint32(this.f.selector) {}
// ----
// UnimplementedFeatureError 1834: (42-94): Code generation is not supported for contracts with specified storage layout base.
