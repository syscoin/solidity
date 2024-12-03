==== Source: A ====
function f() pure {}

==== Source: B ====
import "A" as MyModule;

contract C layout at MyModule {}
// ----
// UnimplementedFeatureError 1834: (B:25-57): Code generation is not supported for contracts with specified storage layout base.
