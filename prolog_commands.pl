%% Enabling the shell:
swipl

%% Disabling the shell:
halt.

%% Each line must end with a dot!

%% Loading a file
[file].
%% If file name consists of more than one word or contains white characters it should be placed in 'file_name'
['file_name'].

%% Using a semicolon causes jumping to the next found solution/answer

%% _ - this symbol is marked by the anonymous search

%% The 'write' predicate writes a term to the output, eg write('Ala has a cat') will write 'Ala ma kota' on the console.

%% The 'nl' predicate goes to a new line.

%% The 'assert/a/z /1', 'retract/a/z /1' predicates allow to add/remove facts to/from the knowledge base, at its beginning or to its end.

%% The 'abolish/1' predicate allows to remove predicate from the knowledge base, eq abolish(woman/1).

%% The 'retractall/1' predicate allows to remove the clauses of a given predicate from the knowledge base, eq retractall(woman(K)).

%% The 'see/n', 'tell/told' predicates allot to load/save knowledge base from/to file.

%% Starting the program from the indicated file (file.pl) from the operating system level can be implemented using:
swipl -s file.pl -g go -t halt

%% Correct way of writing equations arithmetic:
X is 2 + 2.
%% If there is need to use predefined variable this is the correct method:
A is 3, B is A + 4.
