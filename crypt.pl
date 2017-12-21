digits(0).
digits(1).
digits(2).
digits(3).
digits(4).
digits(5).
digits(6).
digits(7).
digits(8).
digits(9).

getCarryMod(Expression, Carry, Modu):- Answer is Expression, Carry is Answer // 10, Modu is Answer mod 10.

print_solution([S,T,R,A,W,O,C,H,I], Type):- solve([S,T,R,A,W,O,C,H,I], Type), nl, write('  '),write(S), write(T), write(R), write(A), write(W), nl,
														write('*    '),write(T),write(O), nl,
														write('---------'), nl,
														write('  '),write(W), write(A),write(R),write(T), write(S), nl,
														write('+'), write(S), write(T), write(R), write(A), write(W), nl,
														write('---------'), nl,
														write(' '), write(C), write(H), write(A), write(I), write(R), write(S), nl.

														
														
														
/*pure generate and test*/
														
solve([S,T,R,A,W,O,C,H,I], genAndTest):- digits(S),digits(T), digits(R), digits(A), digits(W), digits(O),
	digits(C), digits(H),digits(I),
	S > 0, T > 0, W > 0, O > 0, C > 0, /* the starting letters cannot be 0 and neither can TO be 0*/
	getCarryMod(O * W, Carry1, S1), S = S1, /*multiples O and W to get S1, checks to see if S1 = S*/
	getCarryMod(O * A + Carry1, Carry2, T1), T = T1, /* multiply O and A and adds carry1 from the previous carry to get T1, check is T1 = T*/
	getCarryMod(O * R + Carry2, Carry3, R1), R = R1, 
	getCarryMod(O * T + Carry3, Carry4, A1), A = A1,
	getCarryMod(O * S + Carry4, 0, W1), W = W1, /* carry5 has to be 0 because there is no more extra letters after multiplying S, complete STRAW multiply by O*/
	getCarryMod(T * W, Carry5, W2), W = W2, /*T multiply W to get W2 and check is W = W2*/
	getCarryMod(T * A + Carry5, Carry6, A2), A = A2,
	getCarryMod(T * R + Carry6, Carry7, R2), R = R2,
	getCarryMod(T * T + Carry7, Carry8, T2), T = T2,
	getCarryMod(T * S + Carry8, 0, S2), S = S2, /* completes STRAW multiply by T */
	getCarryMod(W + T, Chair1, R3), R = R3, /* adds W to T and gets carry and mod, mod is the value or R*/
	getCarryMod(R + A + Chair1, Chair2, I1), I = I1, 
	getCarryMod(A + R + Chair2, Chair3, A3), A = A3,
	getCarryMod(W + T + Chair3, Chair4, H1), H = H1,
	getCarryMod(S + Chair4, 0, C1), C = C1. /*ends addition of WARTS + STRAWS0 = CHAIRS*/

	
solve([S,T,R,A,W,O,C,H,I], interleave):- 
	digits(W), W > 0, digits(O),  O > 0, digits(S), S > 0, 
	getCarryMod(O * W, Carry1, S1), S = S1,
	digits(A), digits(T), T > 0,
	getCarryMod(O * A + Carry1, Carry2, T1), T = T1,
	digits(R),
	getCarryMod(O * R + Carry2, Carry3, R1), R = R1,
	getCarryMod(O * T + Carry3, Carry4, A1), A = A1,
	getCarryMod(O * S + Carry4, 0, W1), W = W1,
	getCarryMod(T * W, Carry5, W2), W = W2,
	getCarryMod(T * A + Carry5, Carry6, A2), A = A2,
	getCarryMod(T * R + Carry6, Carry7, R2), R = R2,
	getCarryMod(T * T + Carry7, Carry8, T2), T = T2,
	getCarryMod(T * S + Carry8, 0, S2), S = S2,
	getCarryMod(T + W, Chair1, R3), R = R3,	
	digits(I),
	getCarryMod(R + A + Chair1, Chair2, I1), I = I1,	
	getCarryMod(A + R + Chair2, Chair3, A3), A = A3,	
	digits(H),
	getCarryMod(W + T + Chair3, Chair4, H1), H = H1,
	digits(C), C > 0,
	getCarryMod(S + Chair4, 0, C1), C = C1.
	
	