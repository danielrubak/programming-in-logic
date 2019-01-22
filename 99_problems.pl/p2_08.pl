% 2.08 (*) Determine whether two positive integer numbers are coprime. 
%     Two numbers are coprime if their greatest common divisor equals 1.

% coprime(X,Y) :- X and Y are coprime.
%    (integer, integer) (+,+)

:- ensure_loaded(p2_07).

coprime(X,Y) :- gcd(X,Y,1).
