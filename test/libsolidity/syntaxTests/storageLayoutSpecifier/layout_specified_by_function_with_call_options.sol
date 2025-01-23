contract A {
    function f() external pure returns (uint) {}
}
contract C is A layout at this.f{value:123}() {}
// ====
// stopAfter: parsing
// ----
