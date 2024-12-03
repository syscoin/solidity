enum Color {Red, Green, Blue}

contract C layout at Color.Red {}
// ----
// UnimplementedFeatureError 1834: (31-64): Code generation is not supported for contracts with specified storage layout base.
