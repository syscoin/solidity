uint constant N = 100;
contract C layout at N / 0 {}
// ----
// TypeError 1211: (44-49): Division by zero.
