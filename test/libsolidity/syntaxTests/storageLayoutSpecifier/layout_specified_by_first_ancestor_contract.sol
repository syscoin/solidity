contract A layout at 42 {}
contract B is A {}
contract C is B {}
contract D is C {}
// ----
// TypeError 8894: (27-45): Storage layout can only be specified in the most derived contract.
// TypeError 8894: (46-64): Storage layout can only be specified in the most derived contract.
// TypeError 8894: (65-83): Storage layout can only be specified in the most derived contract.
