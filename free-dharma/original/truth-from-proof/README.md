# Introduction: "What's in a number?"

> It's just like,
> Bunch of hashes.

Sanskrit doesn't have much need for congegation and neither do a lot of non-native english speakers, so it isn't hard to see how these words would appear to repeat for year to come like an old Buddhist mantra.

Looking back, this moment was quite a turning point in my thinking about cryptography.

What I had been working in was a lot of concepts. These concepts were given names, some of those names were acronyms, and the more everyone said these words they more they seemed to think they were talking about the same thing. I, looking at the actual work being done, couldn't help feeling like quite the opposite was taking place.

This is why, when a co-worker told me that what his team was handing my team was a "proof" I prepared for a long series of questions about what *exactly* that means. I'd been handed "proofs" before by other co-workers. The contents of these proofs were poor specs, sometimes expanded in to worse white papers written in a dialoge that seemed to be in an argument with itself, and finally a specification as an entire specification website generated from Go code that was generated from an abstract definition. The later form of proof was said to be superior, as it would not even build if any of the types were incorrect. This implementation, of course, never actually succeeded in working and never shipped, eventually being bailed out by the first engineer to leave this project to write something that actually works out of spite.

So when another co-worker told me he had a "proof" my mind filled with a large matrix of questions to determine how useful this might even be and if it is actually even a real thing.

"What exactly does that mean though? What are you actually handing off?" I said.

He paused, and he looked at me like I had just asked a very, very dumb question.

He responded.

> It's a proof.
> It's just like,
> Bunch of hashes.

At this response, the matrix of questions I had immediately evaporated. I had, at this time, become a good enough cryptographer that any other questions I had were already deterministically answered. I had not, at that time, become free of all the conceptual baggage I had accumulated before becoming a decent cryptographer. What I can say now, is that after more than twenty years of obsession with data structures the best one I've been able to find is just, bunch of hashes.

But what *is* a hash, and why is it useful?

It's just a number, a very big number. This book is about the characteristics of very big numbers, which you may be surprised to learn will involve almost no math whatsoever. Very big numbers, once arrived at, are already too big to much with in that way.

Cryptography is an old word, it means the "art of secret writing" and this is a good description for what we do with it today and how this book treats the subject. 

As evolutions in mathematics were applied to create new forms of secret writing we developed **ciphers**. The term cipher comes from the Arabic word ṣifr (صِفْر), which means “empty” or “zero.” In English, the word cipher first appeared in the 14th century, initially referring to the numeral zero. Eventually, it also came to mean “a secret or disguised form of writing,” drawing from the idea that a cipher system involves transforming meaningful text into a seemingly “empty” or “meaningless” form.

Advances in counting machines and eventually computing lead to ciphers that would have been impossible for human beings to do by hand. By WWII, all the parties at war with one another use machine automated ciphers and the British built the first turing machine to crack the ciphers of others. 50 years later, in the 1990's, a computer is on every desk and **public cryptography** is released to the world.

This cryptography leads to the proliferation of not just **ciphers**, but also one-way **hash** functions and public key **signatures**. Today, these tools are available in virtually every programming language, operation system, and general computing device in the world. It's a commidity, one that we know is available everywhere yet we don't even have a way to describe something built that would run in so many languages, systems and devices.

My hope is that, by the end of this book, we have a shared understanding that can describe and reason about such truths. These truths won't depend on knowledge of language, won't depend on knowledge of mathematics, won't even depend on knowledge of computing. If we can describe truth in this way, we resolve disputes before they even begin.

We'll start now, with simple truths in three forms:
1. Hashes.
2. Signatures.
3. Ciphers.

These describe three different forms of very large numbers. The exact means by which one achieves these forms cannot be known by observing the form. Each could be produced by any algorithm.

First, one should know some of the characteristic differences in sizes.

Hashes and signatures are typically a single very large number, and numbers less thatn 256b are not considered very large right now.

Ciphers are sequences of very large numbers. Once they are in a single linear binary sequence, the difference between many very large numbers and a very large binary number becomes purely a matter of observation and relativity in terms of "bigness."

In any computing environment, very large numbers are implemented as a sequence of "bits" (on/off registers appearing one after the other). Since the number representation has to fit in a fixed space, it has a size, in bits.

As we move along we're going to be accumulating **knowledge** through deterministic observation. This form of observation is great because we immediately know it is true, we don't need to actually *do* anything, we need only **recognize** certain truths *as they appear*. This means we don't need to create new algorithms or coordinate across systems to arrive at these truths from everyday cryptography.  

In this moment, we'll observe that:

| Any number in a computer is a series of bits,
| Any series of bits can be measured,
| So any number in a computer can be measured in bits.

When working with numbers, it's much easier to work with a "fixed size number," meaning that whether a number is 2 or 29494847373 it uses the same number of bits. Working with numbers of a uniform size is the only way to do efficient math on them, so very large numbers like the ones we observe in cryptography arrive in a fixed address space in which you can observe the size of the number quite easily.

| Since very large numbers appear in a fixed number size,
| One observing a very large number already knows its size.

Taking these together, we've gained deterministic knowledge.

**When observing a very large number one also observes its size.**

Knowing its size, we know how **unique** it is, because we know how many numbers fit into that space.

Very large numbers that are so large one could not realistically guess the same number (256b and above at this time) are considered "secure."

When the cryptography that produces hashes, signatures, and ciphers arrives at numbers that cannot be guessed they are considered "secure."

As we do not know which cryptography will be broken in the future, we do not know an algorithm will always be "secure," so as long as it produces a large enough number we consider it "secure" unless we have reason to suspect otherwise.

That's how all this cryptography works, numbers too big to guess.

With this, you have some idea of the stage in which cryptographic feats of "magic" are performed. Knowing the size of the number is like peeking behind the curtain of the magic act, you're no longer looking at the rabbit coming out of the hat (the "value") because you're considering the whole stage.

But what can you really do with all this?

One thing. That's all.

A really big unguessable number that won't conflict with any other number you generate a different way is only good for one thing, and you can't even do it until you have another very big number.

| Any very large number considered secure cannot be arrived at by other means,
| Two very large numbers can be compared,
| So two very large numbers that match could not have been arrived at by other means.

This is how one derives truth from proof.

When something could not be arrived at any other way, anyone who has arrived at such a result "agrees" with and understands it as an **agreement of process** which arrives at the same very large number.

This is what allows us to build compatible systems without prior agreement.

This is how we can teach AI systems to find agreement amongst themselves.

This is how we can do whatever we think is worthy of building and giving without permission granting institutions.

If that's something that interests you, you may wish to read this book.

# Truth

How do you 

# *from*

# Proof

