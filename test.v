Inductive day : Type :=
| sun : day
| mon : day
| tue : day
| wed : day
| thu : day
| fri : day
| sat : day.

Definition prev_day d :=
  match d with
  | sun => sat
  | mon => sun
  | tue => mon
  | wed => tue
  | thu => wed
  | fri => thu
  | sat => fri
  end.

Theorem wed_after_tue : prev_day thu = wed.
Proof.
  auto.
Qed.

Theorem day_never_repeats : forall x : day, prev_day x <> x.
Proof.
  intros d. destruct d.
  all: discriminate.
Qed.

Theorem day_never_repeats2 : forall x : day, prev_day x <> x.
Proof.
  (* Intros introduces variable for a day. Destruct does a case by
     case analysis. Semicolon applies tactic on ALL subgoals generated
     by tactics before. *)
  intros d. destruct d; discriminate.
Qed.

Theorem wed_after_tues : forall x : day,
    prev_day x = tue -> x = wed.
Proof.
  intros d.
  intros H.
  (* intros H introduces the assumption that prev_day d = tue. *)
  destruct d.
  (* destruct d considers all possible values of d for the consequent d = wed. Each of these
     subgoals has the assumption H. The first subgoal would be: assuming prev_day sun = tue, sun = wed.
     Since H is false, the implication is true. For subgoals such as these, discriminate will prove it,
     for the only subgoal where H is true, trivial will solve that:*)
  all: discriminate || trivial.
Qed.


