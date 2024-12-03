contract A layout at [1, 2, 3][0] {}
contract B layout at 255 + [1, 2, 3][0] {}
// ----
// UnimplementedFeatureError 1834: (0-36): Code generation is not supported for contracts with specified storage layout base.
