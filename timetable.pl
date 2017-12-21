art([mon10, wed10,fri10]).
art([mon11,wed11,fri11]).
dance([fri1,fri2,fri3]).
math([mon11,wed3,fri3]).
math([mon2,wed2,fri11]).
comp([mon11, wed11, fri12]).
comp([mon12, wed12, wed3]).
lunchMon([mon12]).
lunchMon([mon1]).
lunchWed([wed12]).
lunchWed([wed1]).
lunchFri([fri12]).
lunchFri([fri1]).


sectionArt([mon10, wed10,fri10]):- write('Section 1 of art.'). 
sectionArt([mon11,wed11,fri11]):- write('Section 2 of art.').

sectionMath([mon11,wed3,fri3]):- write('Section 1 of math.'). 
sectionMath([mon2,wed2,fri11]):- write('Section 2 of math.').

sectionComp([mon11, wed11, fri12]):- write('Section 1 of computer science.'). 
sectionComp([mon12, wed12, wed3]):- write('Section 2 of computer science.').

checkLunchMon([mon12]):- write('Lunch is at Monday 12pm.').
checkLunchMon([mon1]):- write('Lunch is at Monday 1pm.').

checkLunchWed([wed12]):- write('Lunch is at Wednesday 12pm.').
checkLunchWed([wed1]):- write('Lunch is at Wednesday 1pm.').

checkLunchFri([fri12]):- write('Lunch is at Friday 12pm.').
checkLunchFri([fri1]):- write('Lunch is at Friday 1pm.').

memberIn(X, [X|Tail]).
memberIn(X, [Head|Tail]):- memberIn(X,Tail).

iterateThru([],List2).
iterateThru([Head|List1], List2):- not memberIn(Head, List2), iterateThru(List1, List2).

print_solution([Art,Math,Comp,Dance,Lunch1,Lunch2,Lunch3]):- solve([Art,Math,Comp,Dance,Lunch1,Lunch2,Lunch3]), nl,
	sectionArt(Art), nl, sectionMath(Math), nl, sectionComp(Comp), nl, write('Only one section for dance from Friday 1pm to 4pm.'), 
	nl, checkLunchMon(Lunch1), nl, checkLunchWed(Lunch2), nl, checkLunchFri(Lunch3).

solve([Art,Math,Comp,Dance,Lunch1,Lunch2,Lunch3]):-
	art(Art), math(Math), comp(Comp), dance(Dance), lunchMon(Lunch1), lunchWed(Lunch2), lunchFri(Lunch3),
	iterateThru(Art,Math), iterateThru(Art,Comp), iterateThru(Art,Dance), iterateThru(Art,Lunch1), iterateThru(Art,Lunch2), iterateThru(Art,Lunch3),
	iterateThru(Math,Comp), iterateThru(Math,Dance), iterateThru(Math,Lunch1), iterateThru(Math,Lunch2),iterateThru(Math,Lunch3),
	iterateThru(Comp,Dance), iterateThru(Comp,Lunch1), iterateThru(Comp,Lunch2),iterateThru(Comp,Lunch3),
	iterateThru(Dance,Lunch1), iterateThru(Dance,Lunch2),iterateThru(Dance,Lunch3).