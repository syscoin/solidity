function f() pure returns (uint256) {
    return 128;
}
contract C layout at f() { }
// ====
// stopAfter: parsing
// ----
