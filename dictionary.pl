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

adjective(Word):-member(Word,["absolute","awesome", "best", "boring","entire","excellent","fantastic", "few", 
	"funny", "good", "high","higher","huge","recent","super","shallow","terrible","uncreative","worst"]).

adverb(Word):-member(Word,["action","again","definitely","else","ever","extremely","great","highly", "only",
 	"out","personally", "rather",  "really", "simply","so", "somewhat", "there", "totally", 
 	"very","would"]).

conjunction(Word):-member(Word,["and","because","but","if","or", "than", "where","whether"]).

determiner(Word):-member(Word,["a","an","its","the","all","your"]).

exclamation(Word):-member(Word,[]).

noun(Word):-member(Word,["character","characters","cliche", "couple","crap","creativity","disappointment",
	"even","excellence", "film","films","formula","fun","job","joke","jokes","lack","love","magic","me","moment","moments", "money",
	"movie","movies","part","parts","performance","sequel","score","think", "time","world"]).

preposition(Word):-member(Word,[ "by","despite","in", "of","on", "to","with"]).

pronoun(Word):-member(Word,["everything","he","i","it","lot","lots","more","much","new", "one","plenty", "them","this", "you"]).

proper_noun(Word):-member(Word,["disney"]).

verb(Word):-member(Word,["amazed","are","be", "check", "compare","compared","do", "does", "doesn't", "don't",
	"enjoy","enjoyed","fill","filled", "find","found",
	"have","has", "is","laugh","like", "make","makes", "put","recommend", "rocks","should","show","sing","singing",
	"thought","warn","warned","was","waste","were"]).
