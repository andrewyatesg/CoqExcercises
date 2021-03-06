Theorem p_implies_p : forall P : Prop, P -> P.
Proof.
  intros P.
  intros P_assumed.
  (* The last two statements introduce the variable, and introduce
     the antecedent (P itself) as an assumption. Now we use the
     tactic "assumption" to prove a proposition already assumed
     in our environment surrounding the subgoal: P. *)
  assumption.
Qed.

Check p_implies_p. (* p_implies_p : forall P : Prop, P -> P *)
Print p_implies_p.
(*Prints:   
p_implies_p =
fun (P : Prop) (P_assumed : P) => P_assumed
     : forall P : Prop, P -> P
 *)

(* A function that takes P, the proposition in question, and P_assumed
   of type P (which means it is evidence for P). It simply returns the
   evidence for P. *)

Axiom excluded_middle : forall P : Prop, P \/ ~P.
    
(* As another example, let's look at contrapositives *)
Theorem contra_pos : forall P Q : Prop, (P -> Q) <-> ((~Q) -> (~P)).
Proof.
  intros P Q.
  split.
  (* Splits the logical equivalence, producing two subgoals, 
     one for the implication in either direction. *)

  (* (P -> Q) -> (~Q -> ~P) *)
  intros p_implies_q.
  intros not_Q assumed_P.  
  generalize (p_implies_q assumed_P).
  intros assumed_Q.
  contradiction.
  
  (* (~Q -> ~P) -> (P -> Q) *)
  intros nq_implies_np assumed_P.
  destruct (excluded_middle Q) as [Q_true | Q_false].
  (* Q can either be true or false, so we prove Q assuming Q is true or Q is false
     (deconstructs our subgoal Q into two subgoals (both Q) with Q_true as evidence
     of Q in the first subgoal and Q_false as evidence of ~Q in the second subgoal).: *)
  assumption. (* We assumed Q, so Q is trivially true. *)
  generalize (nq_implies_np Q_false).
  intros assumed_np.
  contradiction.
Qed.

(* In the above proof, we relied on the Law of the Excluded Middle to
   prove the reverse direction of the equivalence of contrapositive
   statements, which seems to match up with mathematics. *)

Check excluded_middle.
Check contra_pos.
Print contra_pos. (* This prints out a function generated by Coq that proves the theorem contra_pos. *)

Theorem vacuously_true : forall P Q : Prop, (P /\ ~P) -> Q.
Proof.
  intros.
  destruct H. (* Splits P /\ ~P into P and ~P. *)
  contradiction.
Qed.

Print vacuously_true.
(*
fun (P Q : Prop) (H : P /\ ~ P) =>
match H with
| conj H0 H1 => False_ind Q (H1 H0)
end
 *)
Print False_ind.
(*
fun (P : Prop) (f : False) => match f return P with
                              end
*)
Print
