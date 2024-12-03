contract A {
    struct SA {
        uint x;
        uint y;
        bytes32 b;
    }
}

contract C is A layout at A.SA { }
// ----
// UnimplementedFeatureError 1834: (89-123): Code generation is not supported for contracts with specified storage layout base.
