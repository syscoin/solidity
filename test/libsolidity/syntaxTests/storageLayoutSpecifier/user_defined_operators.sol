type MyUint is uint;

using {add as +} for MyUint global;
function add(MyUint a, MyUint b) pure returns (MyUint) {
    return MyUint.wrap(2);
}

contract C layout at MyUint.wrap(1) + MyUint.wrap(2) {}
// ----
// Warning 5667: (71-79): Unused function parameter. Remove or comment out the variable name to silence this warning.
// Warning 5667: (81-89): Unused function parameter. Remove or comment out the variable name to silence this warning.
// UnimplementedFeatureError 1834: (145-200): Code generation is not supported for contracts with specified storage layout base.
