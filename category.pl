%returns the weight of the word with respect to its category
weight(Word,0.8):-adjective(Word).
weight(Word,0.8):-adverb(Word).
weight(Word,0.6):-conjunction(Word).
weight(Word,0.1):-determiner(Word).
weight(Word,0.6):-exclamation(Word).
weight(Word,0.4):-noun(Word).
weight(Word,0.2):-preposition(Word).
weight(Word,0.3):-pronoun(Word).
weight(Word,0.1):-proper_noun(Word).
weight(Word,0.6):-verb(Word).
weight(_,0).