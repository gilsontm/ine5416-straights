:- use_module(library(clpfd)).

solve(NumberRows, ColourRows) :-
    length(NumberRows, Length),
    length(ColourRows, Length),
    maplist(same_length(NumberRows), NumberRows),
    maplist(same_length(ColourRows), ColourRows),

    append(NumberRows, FlatNumbers),
    append(ColourRows, FlatColours),

    FlatColours ins 0..1,
    colours(FlatNumbers, FlatColours, Blacks, Whites),
    Blacks ins 0..Length,
    Whites ins 1..Length,

    transpose(NumberRows, NumberCols),
    transpose(ColourRows, ColourCols),

    maplist(no_repeats, NumberRows),
    maplist(no_repeats, NumberCols),

    maplist(regions(Length), NumberRows, ColourRows),
    maplist(regions(Length), NumberCols, ColourCols).

colours([], [], [], []).
colours([N|Ns], [C|Cs], Bs, [N|Ws]) :- C #= 1, colours(Ns, Cs, Bs, Ws).
colours([N|Ns], [C|Cs], [N|Bs], Ws) :- C #= 0, colours(Ns, Cs, Bs, Ws).

no_zeros([], []).
no_zeros([H|T], [H|R]) :- H #\= 0, no_zeros(T, R).
no_zeros([H|T], R)     :- H #=  0, no_zeros(T, R).

no_repeats(Numbers) :- no_zeros(Numbers, NoZeros), all_distinct(NoZeros).

regions(L, Ns, Cs)             :- regions(L, Ns, Cs, []).
regions(L, [], [], Rs)         :- consecutive(Rs, 1, L).
regions(L, [N|Ns], [C|Cs], Rs) :- C #= 1, regions(L, Ns, Cs, [N|Rs]).
regions(L, [_|Ns], [C|Cs], Rs) :- C #= 0, consecutive(Rs, 1, L), regions(L, Ns, Cs, []).

consecutive(Set, LowerBound, Limit) :-
    all_distinct(Set),
    length(Set, Length),
    UpperBound #= LowerBound + Length - 1,
    UpperBound #=< Limit,
    (Set ins LowerBound..UpperBound;
    NextBound #= LowerBound + 1,
    NextBound + Length - 1 #=< Limit,
    consecutive(Set, NextBound, Limit)).

% % Input | Blacks | Whites
% colors(L, Blacks, Whites) :- instantiated(L, NonI, I), positive(I, Blacks, P), append(NonI, P, Whites).

% % Input | Non-Instantiated | Instantiated.
% instantiated([], [], []).
% instantiated([H|T], [H|L], R) :-    var(H), instantiated(T, L, R). % non-instantiated.
% instantiated([H|T], L, [H|R]) :- nonvar(H), instantiated(T, L, R). %     instantiated.

% % Input | Negative | Positive.
% positive([], [], []).
% positive([H|T], [H|L], R) :- H =< 0, positive(T, L, R). % non-positive
% positive([H|T], L, [H|R]) :- H  > 0, positive(T, L, R). %     positive

% whites([], []).
% whites([H|T], [H|R]) :- H # 1, whites(T, R).
% whites([H|T], R)     :- H #<  1, whites(T, R).

problem(1,
        [[_,_,_],
         [_,0,_],
         [_,_,_]],
        [[1,1,1],
         [1,0,1],
         [1,1,1]]).

problem(2,
        [[1,_,_,0],
         [_,1,_,_],
         [2,0,0,_],
         [_,_,4,_]],
        [[1,1,1,0],
         [1,0,1,1],
         [1,0,0,1],
         [1,1,1,1]]).

problem(3,
        [[_,_,0,_],
         [_,_,_,_],
         [_,0,_,_],
         [_,_,_,_]],
        [[1,1,0,1],
         [1,1,1,1],
         [1,0,1,1],
         [1,1,1,1]]).

