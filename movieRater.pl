:-include('corpus.pl').
:-include('dictionary.pl').
:-include('category.pl').

%% for building and calculating the score on sublime text editor
%% main :- calculate_scores("awesome film", Solution), writef('%t\n', [Solution]).
main :- calculate_scores("The film is a super awesome movie.", Solution), writef('%t\n', [Solution]).
%% main :- not_defined(Solution), writef('%t\n', [Solution]).

%calculates the score of the given review by using reviews on the carpus - the one in the project desctiption
%calculate_scores(+NewReview,-S).
calculate_scores(NewReview, S):-
	downcase_atom(NewReview, NewReviewDowncase),
	split_string(NewReviewDowncase, " ", ".,", Words),
	sumScores(Words,_,Sum),length(Words,Length), S is Sum / Length.

%calculates the score of the given review by using reviews on the carpus - the proper one 
%calculate_scores(+NewReview,-S).
calculate_scores2(NewReview, S):-
	downcase_atom(NewReview, NewReviewDowncase),
	split_string(NewReviewDowncase, " ", ".,", Words),
	sumScores(Words,Weights,Sum), S is Sum / Weights.

%returns the sum of scores of a word
%sumScores(+Words,TotalWeight,Score)
sumScores([],0,0).
sumScores([Word|T],Factor + Factors,K+FactorScore):-
	findall([P|N],(get_review(Words,S),count(Word,Words,N),P is S*N),WeightedList),
	calculate_score_from_weighted_list(WeightedList,Score),
	weight(Word,Factor),
	FactorScore is Factor * Score,
	sumScores(T,Factors,K).

%given the list of weighted scores and their occurences,returns the overall score of a word
%calculate_score_from_weighted_list(+WeightedList,-Score).
calculate_score_from_weighted_list(WeightedList,Score):-
	calculate_total_score_from_weighted_list(WeightedList,Scores,Counts),Counts>0,
	Score is Scores/Counts.


%given the list of weighted scores and their occurences,returns the sum of scores and occurences of a word
%calculate_total_score_from_weighted_list(+WeightedList,-TotalScore,-Count).
calculate_total_score_from_weighted_list( [], 0, 0 ).
calculate_total_score_from_weighted_list( [[Score| Count] | Tail], NewScores, NewCounts ) :-
	calculate_total_score_from_weighted_list( Tail, Scores, Counts ),
	NewScores is Scores+Score,
	NewCounts is Counts+Count.
 
%counts the number of occurences of X in the given list 
%count(+Elem, +List, -NumOfOccurence).
count(_, [], 0) :- !.
count(X, [X|T], N) :- count(X, T, N2), N is N2 + 1.    
count(X, [Y|T], N) :- X \= Y, count(X, T, N).

%returns all the words on any review and its score
get_review(Words,Score):-
	review(R,Score),
	downcase_atom(R, L),
	split_string(L, " ", ".,", Words).

%returns a list of all different words on reviews that isn't put on any category, used for producing dictionary file
%not_defined(-Words):-
not_defined(Words):-
	uniq(Uniques),
	findall(Word,(defined(Word)),Defined),
	subtract(Uniques,Defined,Words).

%returns a list of all different words on reviews, used for producing dictionary file
%uniq(-Uniques). 
uniq(Uniques) :- 
	findall(Word,(get_review(Words, _),member(Word,Words)),Data),
	sort(Data,Uniques).