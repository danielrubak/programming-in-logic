/*

*/

polacz([], L, L).
polacz([X|L1], L2, [X|L3]) :- polacz(L1, L2, L3).
