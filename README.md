https://www.cs.kent.ac.uk/people/staff/sjt/TTFP/

Type Theory and Functional Programming

This is all formalized in Type Theory, but the gist is: types correspond to propositions and values of the type are "evidence" for the proposition. Conjunction types ('a * 'b) are analogous to logical conjunctions A /\ B and functions (A -> B) are analogous to implications A => B. For example, the statement: (forall A: A => A) is equivalent to: for all types A there is a function with signature A -> A. This trivially the identity function. Functions can be seen as "proof transformers." Proof for A is transformed into proof for B. If such a transformation exists, this means "if there is a proof of A, there is a proof of B" which is logical implication.