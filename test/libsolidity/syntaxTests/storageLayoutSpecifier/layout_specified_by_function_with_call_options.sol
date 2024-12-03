contract A {
    function f() external payable returns (uint) {}
}
contract C is A layout at this.f{value:123}() {}
// ----
// UnimplementedFeatureError 1834: (67-115): Code generation is not supported for contracts with specified storage layout base.
