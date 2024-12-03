contract A {
    uint public x = 10;
}

contract C is A layout at A.x {}
// ----
// UnimplementedFeatureError 1834: (40-72): Code generation is not supported for contracts with specified storage layout base.
