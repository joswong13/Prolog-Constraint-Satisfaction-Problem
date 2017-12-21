digits(1).
digits(2).
digits(3).
digits(4).

subt(X,Y,Z):- Z is X - Y.
subt(X,Y,Z):- Z is Y - X.

divs(X,Y,Z):- Z is Y//X.
divs(X,Y,Z):- Z is X//Y.

add(X,Y,Z):- Z is X + Y.

multi(X,Y,Z):- Z is X * Y.

memberIn(X, [X|Tail]).
memberIn(X, [Head|Tail]):- member(X,Tail).

all_diff([]).
all_diff([Head|List]):- not memberIn(Head, List), all_diff(List).

print_solution([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]):- solve([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]), 
	nl, write('Output of grid: '), nl,
	write('|'),write(A1), write(' | '),write(B1), write(' | '),write(C1), write(' | '),write(D1),write('|'),nl,
	write(' -   -   -   -'),nl,
	write('|'),write(A2), write(' | '),write(B2), write(' | '),write(C2), write(' | '),write(D2),write('|'),nl,
	write(' -   -   -   -'),nl,
	write('|'),write(A3), write(' | '),write(B3), write(' | '),write(C3), write(' | '),write(D3),write('|'),nl,
	write(' -   -   -   -'),nl,
	write('|'),write(A4), write(' | '),write(B4), write(' | '),write(C4), write(' | '),write(D4),write('|'),nl.



solve([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]):- 
	digits(A1), digits(A2), subt(A1,A2,1),
	digits(A3), digits(A4), subt(A3,A4,3), all_diff([A1,A2,A3,A4]), /*checks first column*/
	digits(B1), digits(C1), multi(B1,C1,12), 
	digits(D1), digits(D2), subt(D1,D2,3), all_diff([A1,B1,C1,D1]), /*checks first row*/
	digits(B4), digits(C4), add(B4,C4,3),
	digits(D3), digits(D4), subt(D3,D4,1), all_diff([D1,D2,D3,D4]), all_diff([A4,B4,C4,D4]), /*checks last column and last row*/
	digits(B2), digits(B3), divs(B2,B3,2), all_diff([B1,B2,B3,B4]), /*checks middle left column*/
	digits(C2), digits(C3), subt(C2,C3,2), all_diff([C1,C2,C3,C4]), /*checks middle right column*/
	all_diff([A2,B2,C2,D2]), all_diff([A3,B3,C3,D3]). /*checks middle top row and middle bottom row*/
	
	%?- Start is cputime, print_solution([A1,A2,A3,A4,B1,B2,B3,B4,C1,C2,C3,C4,D1,D2,D3,D4]), End is cputime, Time is End - Start.
	%Start = 143.171
	%A1 = 2
	%A2 = 3
	%A3 = 1
	%A4 = 4
	%B1 = 3
	%B2 = 2
	%B3 = 4
	%B4 = 1
	%C1 = 4
	%C2 = 1
	%C3 = 3
	%C4 = 2
	%D1 = 1
	%D2 = 4
	%D3 = 2
	%D4 = 3
	%End = 143.171
	%Time = 0.0
	%Yes (0.00s cpu, solution 1, maybe more)
	%
	%Output of grid: 
	%|2 | 3 | 4 | 1|
	% -   -   -   -
    %|3 | 2 | 1 | 4|
	% -   -   -   -
	%|1 | 4 | 3 | 2|
	% -   -   -   -
	%|4 | 1 | 2 | 3|
	
	
	%?- Start is cputime, print_solution(List), End is cputime, Time is End - Start.
	%Start = 142.828
	%List = [2, 3, 1, 4, 3, 2, 4, 1, 4, 1, 3, 2, 1, 4, 2, 3]
	%End = 142.828
	%Time = 0.0
	%
	%Output of grid: 
	%|2 | 3 | 4 | 1|
	% -   -   -   -
	%|3 | 2 | 1 | 4|
	% -   -   -   -
	%|1 | 4 | 3 | 2|
	% -   -   -   -
	%|4 | 1 | 2 | 3|
