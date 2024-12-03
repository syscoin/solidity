contract A {
    uint constant x = 10;
}

contract C is A layout at A.x { }
// ----
// UnimplementedFeatureError 1834: (42-75): Code generation is not supported for contracts with specified storage layout base.
