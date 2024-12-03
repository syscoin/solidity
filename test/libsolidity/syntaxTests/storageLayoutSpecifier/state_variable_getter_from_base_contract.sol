contract A {
    uint public x = 10;
}

contract C is A layout at this.x() {}
// ----
// UnimplementedFeatureError 1834: (40-77): Code generation is not supported for contracts with specified storage layout base.
