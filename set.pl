containsSet(N,FULLLIST,SUBLIST):- length(SUBLIST,N),
                                  sublist(SUBLIST,FULLLIST),
                                  allCompatible(SUBLIST).

%Code for determining if list X is a sublist of list L
pre(X,L):- append(X,_,L).
suf(X,L):- append(_,X,L).
sublist(X,L):- suf(S,L), pre(X,S).

%Code for determining if two lists of the same length have
%differing elements in every position
compatible([],[]).
compatible([A],[B]):- not(A==B).
compatible([H1|T1],[H2|T2]):- not(H1==H2),
                              compatible(T1,T2).

%Helper predicate for determining if one element of a list
%is compatible with every proceeding element of the list
restCompatible(_,[]).
restCompatible(A,[B|C]):- compatible(A,B),
                          restCompatible(A,C).

%Predicate for determining if all elements of the list are
%compatible with each other.
allCompatible([]).
allCompatible([_]).
allCompatible([A|B]):- restCompatible(A,B),
                       allCompatible(B).
