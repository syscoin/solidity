bytes32 constant b = "bytes";
contract A layout at b[1] {}
// ----
// UnimplementedFeatureError 1834: (30-58): Code generation is not supported for contracts with specified storage layout base.
