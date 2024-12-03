library L {
    function f(uint x) public pure returns (uint) {
        return x * 2;
    }
}


contract C layout at 2.f() {
    using L for *;
}
// ----
// UnimplementedFeatureError 1834: (96-145): Code generation is not supported for contracts with specified storage layout base.
