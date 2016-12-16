defined(Word):-adjective(Word).
defined(Word):-adverb(Word).
defined(Word):-conjunction(Word).
defined(Word):-determiner(Word).
defined(Word):-exclamation(Word).
defined(Word):-noun(Word).
defined(Word):-preposition(Word).
defined(Word):-pronoun(Word).
defined(Word):-proper_noun(Word).
defined(Word):-verb(Word).

adjective(Word):-member(Word,["absolute","awesome", "best", "boring","entire", "few", 
	"funny", "good", "high","huge","recent","shallow","terrible","uncreative","worst"]).

adverb(Word):-member(Word,["again","definitely","extremely","highly", "only",
 	"out","personally", "rather",  "really", "so", "somewhat", "there", "totally", 
 	"very","would"]).

conjunction(Word):-member(Word,["and","because","but","if","or", "than", "where","whether"]).

determiner(Word):-member(Word,["a","an","the","all","your"]).

exclamation(Word):-member(Word,[]).

noun(Word):-member(Word,["cliche", "couple","crap","creativity","disappointment",
	"even","excellence", "film","formula","fun","joke","lack","moment", "money",
	"movie","part","score","think", "time"]).

preposition(Word):-member(Word,[ "by","despite","in", "of","on", "to","with"]).

pronoun(Word):-member(Word,["i","it","more","much","new", "plenty", "them","this", "you"]).

proper_noun(Word):-member(Word,["disney"]).

verb(Word):-member(Word,["be", "check", "compare","do", "enjoy","fill", "find",
	"have", "laugh","like", "make", "recommend", "should","sing","warn","waste"]).
