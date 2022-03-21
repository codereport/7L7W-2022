author(marquez, hundredYears).
author(marquez, autumnPatriarch).
author(rustaveli, tigerSkin).

genre(hundredYears, magicRealism).
genre(autumnPatriarch, magicRealism).
genre(tigerSkin, epic).

getAuthorByGenre(G,A) :- author(A,Z), genre(Z,G).

