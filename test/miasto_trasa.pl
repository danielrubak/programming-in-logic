% Dana jest baza wiedzy jak niżej:

% miasto(Nazwa, Populacja, Powierzchnia).
miasto('Warszawa', 1735442, 51724).
miasto('Kraków', 761873, 32685).
miasto('Łódź', 706004, 29325).
miasto('Wrocław', 634487, 29282).
miasto('Poznań', 545680, 26191).
miasto('Gdańsk', 461489, 26196).

% trasa(Miasto - Miasto, Długość, Szacowany czas przejazdu w minutach).
trasa('Warszawa' - 'Kraków', 294, 244).
trasa('Warszawa' - 'Kraków', 355, 239).
trasa('Warszawa' - 'Kraków', 311, 266).
trasa('Gdańsk' - 'Warszawa', 341, 253).
trasa('Warszawa' - 'Łódź', 130, 92).
trasa('Kraków' - 'Wrocław', 269, 169).
