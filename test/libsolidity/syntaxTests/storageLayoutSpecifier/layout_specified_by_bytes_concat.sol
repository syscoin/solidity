contract C layout at uint64(bytes8(bytes.concat("ABCD", "EFGH"))) {}
// ----
// UnimplementedFeatureError 1834: (0-68): Code generation is not supported for contracts with specified storage layout base.
