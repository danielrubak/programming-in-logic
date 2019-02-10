/*

*/

rozlaczne(A, B) :- member(X, A), not(member(X, B)).
