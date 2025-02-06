contract A layout at 0x1234 {}

contract B is A {}

contract C is B layout at 0xABCD {}
// ----
// TypeError 8894: (32-50): Storage layout can only be specified in the most derived contract.
// TypeError 8894: (52-87): Storage layout can only be specified in the most derived contract.
