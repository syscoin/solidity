contract A {}
contract B is A {}
contract C is B layout at 42 {}
contract D is C {}
// ----
// TypeError 8894: (65-83): Storage layout can only be specified in the most derived contract.
