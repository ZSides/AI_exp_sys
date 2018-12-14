xpositive("a", "b").
xnegative("b", "a").

consult :-
	dog_is(X), !,
	nl,
	write("Your dog is "), 
	write(X),
	nl.
consult :-
	nl,
	write("Sorry! Maybe later!"),
	nl.
ask(X, Y) :-
	nl,
	write('?: '),
	ttyflush,
	write(X),
	ttyflush, 
	write(' '),
	ttyflush, 
	write(Y),
	ttyflush,
	write(' '),
	ttyflush,
	readln(Reply),
	write(Reply),
	ttyflush,
	remember(X, Y, Reply).

positive(X, Y) :-
	xpositive(X, Y), !.
positive(X, Y) :-
	not(negative(X, Y)), !,
	ask(X, Y).
negative(X, Y) :-
	xnegative(X, Y), !.
remember(X, Y, [yes]) :-
	asserta(xpositive(X, Y)).
remember(X, Y, [no]) :-
	asserta(xnegative(X, Y)), fail.

dog_is("English Bulldog") :-
	it_is("short-haired dog"),
	positive("her","height in withers no more than 57 cm"),
	positive("she has","low put tail"),
  	positive("she has","friendly character"),!.

dog_is("Hound") :-
	it_is("short-haired dog"),
  	positive("her","height in withers no more than 57 cm"),
  	positive("she has","long ears"),
  	positive("she has","friendly character"),!.

dog_is("German Mastiff") :- 
	it_is("short-haired dog"),
  	positive("she has","low put tail"),
  	positive("she has","friendly character"),
	positive("her","weight is more than 45 kg"),!.

dog_is("American Foxhound") :-
	it_is("short-haired dog"),
  	positive("her","height in withers no more than 77 cm"),
  	positive("she has","long ears"),
	positive("she has","friendly character"),!.

dog_is("Cocker spaniel") :-
	it_is("long-haired dog"),
	positive("her","height in withers no more than 57 cm"),
	positive("she has","low put tail"),
	positive("she has","long ears"),
	positive("she has","friendly character"),!.

it_is("short-haired dog") :-
	positive("?","short-haired dog"),!.

it_is("long-haired dog") :-
	positive("?","long-haired dog"),!.