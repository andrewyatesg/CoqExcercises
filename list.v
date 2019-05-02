Require Import List.
Import ListNotations.

(* Check the type of list *)
Check list.
(* It is a constructor:
   list : Type -> Type
   that maps the type of elements in the list to the list type. *)

Definition is_empty (A : Type) (lst : list A) :=
  match lst with
  | nil => true
  | cons _ _ => false
  end.

(* or *)

Definition is_empty2 (A : Type) (lst : list A) :=
  match lst with
  | [] => true
  | _::_ => false
  end.

Compute is_empty nat [1].
Compute is_empty nat [].

Theorem empty_is_empty : forall A : Type, forall lst : list A,
      length lst = 0 -> is_empty A lst = true.
Proof.
  intros A lst H.
  (* lst has two possible values: nil and cons.
     Both subgoals assume H, that is, length lst = 0.
     The first subgoal has H true, because length nil = 0.
          is_empty A [] = true, so this subgoal is proved
          with trivial.
     The second subgoal has H false. Because H is false, we
         use discriminate. Again, discriminate lets us prove
         anything when one of our assumptions is false. *)
  destruct lst.
    trivial.
    discriminate.
Qed.

