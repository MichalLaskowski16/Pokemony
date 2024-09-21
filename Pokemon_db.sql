-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-12-20 19:03:58.942

-- tables
-- Table: Gracz
CREATE TABLE Gracz (
    ID integer  NOT NULL,
    Nazwa varchar2(20)  NOT NULL,
    IloscPokemonow integer  NOT NULL,
    CONSTRAINT Gracz_pk PRIMARY KEY (ID)
) ;

-- Table: Gym
CREATE TABLE Gym (
    ID integer  NOT NULL,
    nazwa varchar2(100)  NOT NULL,
    Trener_ID integer  NOT NULL,
    Region_ID integer  NOT NULL,
    CONSTRAINT Gym_pk PRIMARY KEY (ID)
) ;

-- Table: Pokemon
CREATE TABLE Pokemon (
    ID integer  NOT NULL,
    Nazwa varchar2(40)  NULL,
    PokemonRasa_ID integer  NOT NULL,
    Trener_ID integer  NULL,
    Gracz_ID integer  NULL,
    LVL integer  NOT NULL,
    HP integer  NOT NULL,
    ATK integer  NOT NULL,
    DEF integer  NOT NULL,
    SPD_ATK integer  NOT NULL,
    SPD_DEF integer  NOT NULL,
    SPD integer  NOT NULL,
    EXP integer  NOT NULL,
    DataZlapania date  NULL,
    CONSTRAINT Pokemon_pk PRIMARY KEY (ID)
) ;

-- Table: PokemonRasa
CREATE TABLE PokemonRasa (
    ID integer  NOT NULL,
    gatunek varchar2(50)  NOT NULL,
    CONSTRAINT PokemonRasa_pk PRIMARY KEY (ID)
) ;

-- Table: Region
CREATE TABLE Region (
    ID integer  NOT NULL,
    nazwa varchar2(30)  NOT NULL,
    CONSTRAINT Region_pk PRIMARY KEY (ID)
) ;

-- Table: Trener
CREATE TABLE Trener (
    ID integer  NOT NULL,
    imie varchar2(30)  NOT NULL,
    IloscPokemonow integer  NOT NULL,
    CONSTRAINT Trener_pk PRIMARY KEY (ID)
) ;

-- Table: Typ
CREATE TABLE Typ (
    ID integer  NOT NULL,
    typ varchar2(30)  NOT NULL,
    CONSTRAINT Typ_pk PRIMARY KEY (ID)
) ;

-- Table: pokemonRasa_Region
CREATE TABLE pokemonRasa_Region (
    Region_ID integer  NOT NULL,
    PokemonRasa_ID integer  NOT NULL,
    CONSTRAINT pokemonRasa_Region_pk PRIMARY KEY (Region_ID,PokemonRasa_ID)
) ;

-- Table: pokemon_Typ
CREATE TABLE pokemon_Typ (
    Typ_ID integer  NOT NULL,
    PokemonRasa_ID integer  NOT NULL,
    CONSTRAINT pokemon_Typ_pk PRIMARY KEY (Typ_ID,PokemonRasa_ID)
) ;

-- foreign keys
-- Reference: Gym_Region (table: Gym)
ALTER TABLE Gym ADD CONSTRAINT Gym_Region
    FOREIGN KEY (Region_ID)
    REFERENCES Region (ID);

-- Reference: Gym_Trener (table: Gym)
ALTER TABLE Gym ADD CONSTRAINT Gym_Trener
    FOREIGN KEY (Trener_ID)
    REFERENCES Trener (ID);

-- Reference: Pokemon_Gracz (table: Pokemon)
ALTER TABLE Pokemon ADD CONSTRAINT Pokemon_Gracz
    FOREIGN KEY (Gracz_ID)
    REFERENCES Gracz (ID);

-- Reference: Pokemon_PokemonRasa (table: Pokemon)
ALTER TABLE Pokemon ADD CONSTRAINT Pokemon_PokemonRasa
    FOREIGN KEY (PokemonRasa_ID)
    REFERENCES PokemonRasa (ID);

-- Reference: Pokemon_Trener (table: Pokemon)
ALTER TABLE Pokemon ADD CONSTRAINT Pokemon_Trener
    FOREIGN KEY (Trener_ID)
    REFERENCES Trener (ID);

-- Reference: pokemonRasa_Region_PokemonRasa (table: pokemonRasa_Region)
ALTER TABLE pokemonRasa_Region ADD CONSTRAINT pokemonRasa_Region_PokemonRasa
    FOREIGN KEY (PokemonRasa_ID)
    REFERENCES PokemonRasa (ID);

-- Reference: pokemon_Typ_PokemonRasa (table: pokemon_Typ)
ALTER TABLE pokemon_Typ ADD CONSTRAINT pokemon_Typ_PokemonRasa
    FOREIGN KEY (PokemonRasa_ID)
    REFERENCES PokemonRasa (ID);

-- Reference: pokemonyDoRegionu (table: pokemonRasa_Region)
ALTER TABLE pokemonRasa_Region ADD CONSTRAINT pokemonyDoRegionu
    FOREIGN KEY (Region_ID)
    REFERENCES Region (ID);

-- Reference: typDoPokemonow (table: pokemon_Typ)
ALTER TABLE pokemon_Typ ADD CONSTRAINT typDoPokemonow
    FOREIGN KEY (Typ_ID)
    REFERENCES Typ (ID);

INSERT INTO Region (ID, nazwa)
    VALUES (1 , 'Kanto');
INSERT INTO Region (ID, nazwa)
    VALUES (2 , 'Johto');

INSERT INTO Gracz (ID, Nazwa, IloscPokemonow)
    VALUES (1 , 'Ash' , 1);
INSERT INTO Gracz (ID, Nazwa, IloscPokemonow)
    VALUES (2 , 'Gary' , 1);

INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (1 , 'Brock' , 2);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (2 , 'Misty' , 2);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (3 , 'Lt. Surge' , 3);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (4 , 'Erika' , 3);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (5 , 'Koga' , 4);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (6 , 'Sabrina' , 4);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (7 , 'Blaine' , 4);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (8 , 'Giovanni' , 5);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (9 , 'Lorelei' , 5);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (10 , 'Bruno' , 5);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (11 , 'Agatha' , 5);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (12 , 'Lance' , 5);
INSERT INTO Trener (ID, imie, IloscPokemonow)
    VALUES (13 , 'Champion' , 6);

INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (1 , 'Bulbasaur');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (2 , 'Ivysaur');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (3 , 'Venusaur');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (4 , 'Charmander');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (5 , 'Charmeleon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (6 , 'Charizard');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (7 , 'Squirtle');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (8 , 'Wartortle');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (9 , 'Blastoise');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (10 , 'Caterpie');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (11 , 'Metapod');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (12 , 'Butterfree');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (13 , 'Weedle');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (14 , 'Kakuna');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (15 , 'Beedrill');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (16 , 'Pidgey');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (17 , 'Pidgeotto');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (18 , 'Pidgeot');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (19 , 'Rattata');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (20 , 'Raticate');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (21 , 'Spearow');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (22 , 'Fearow');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (23 , 'Ekans');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (24 , 'Arbok');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (25 , 'Pikachu');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (26 , 'Raichu');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (27 , 'Sandshrew');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (28 , 'Sandslash');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (29 , 'Nidoran Female');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (30 , 'Nidorina');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (31 , 'Nidoqueen');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (32 , 'Nidoran Male');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (33 , 'Nidorino');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (34 , 'Nidoking');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (35 , 'Clefairy');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (36 , 'Clefable');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (37 , 'Vulpix');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (38 , 'Ninetales');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (39 , 'Jigglypuff');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (40 , 'Wigglytuff');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (41 , 'Zubat');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (42 , 'Golbat');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (43 , 'Oddish');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (44 , 'Gloom');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (45 , 'Vileplume');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (46 , 'Paras');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (47 , 'Parasect');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (48 , 'Venonat');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (49 , 'Venomoth');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (50 , 'Diglett');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (51 , 'Dugtrio');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (52 , 'Meowth');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (53 , 'Persian');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (54 , 'Psyduck');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (55 , 'Golduck');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (56 , 'Mankey');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (57 , 'Primeape');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (58 , 'Growlithe');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (59 , 'Arcanine');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (60 , 'Poliwag');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (61 , 'Poliwhirl');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (62 , 'Poliwrath');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (63 , 'Abra');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (64 , 'Kadabra');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (65 , 'Alakazam');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (66 , 'Machop');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (67 , 'Machoke');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (68 , 'Machamp');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (69 , 'Bellsprout');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (70 , 'Weepinbell');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (71 , 'Victreebel');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (72 , 'Tentacool');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (73 , 'Tentacruel');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (74 , 'Geodude');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (75 , 'Graveler');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (76 , 'Golem');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (77 , 'Ponyta');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (78 , 'Rapidash');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (79 , 'Slowpoke');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (80 , 'Slowbro');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (81 , 'Magnemite');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (82 , 'Magneton');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (83 , 'Farfetch''d');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (84 , 'Doduo');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (85 , 'Dodrio');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (86 , 'Seel');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (87 , 'Dewgong');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (88 , 'Grimer');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (89 , 'Muk');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (90 , 'Shellder');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (91 , 'Cloyster');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (92 , 'Gastly');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (93 , 'Haunter');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (94 , 'Gengar');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (95 , 'Onix');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (96 , 'Drowzee');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (97 , 'Hypno');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (98 , 'Krabby');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (99 , 'Kingler');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (100 , 'Voltorb');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (101 , 'Electrode');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (102 , 'Exeggcute');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (103 , 'Exeggutor');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (104 , 'Cubone');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (105 , 'Marowak');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (106 , 'Hitmonlee');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (107 , 'Hitmonchan');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (108 , 'Lickitung');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (109 , 'Koffing');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (110 , 'Weezing');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (111 , 'Rhyhorn');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (112 , 'Rhydon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (113 , 'Chansey');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (114 , 'Tangela');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (115 , 'Kangaskhan');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (116 , 'Horsea');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (117 , 'Seadra');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (118 , 'Goldeen');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (119 , 'Seaking');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (120 , 'Staryu');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (121 , 'Starmie');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (122 , 'Mr. Mime');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (123 , 'Scyther');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (124 , 'Jynx');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (125 , 'Electabuzz');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (126 , 'Magmar');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (127 , 'Pinsir');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (128 , 'Tauros');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (129 , 'Magikarp');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (130 , 'Gyarados');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (131 , 'Lapras');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (132 , 'Ditto');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (133 , 'Eevee');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (134 , 'Vaporeon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (135 , 'Jolteon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (136 , 'Flareon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (137 , 'Porygon');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (138 , 'Omanyte');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (139 , 'Omastar');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (140 , 'Kabuto');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (141 , 'Kabutops');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (142 , 'Aerodactyl');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (143 , 'Snorlax');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (144 , 'Articuno');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (145 , 'Zapdos');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (146 , 'Moltres');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (147 , 'Dratini');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (148 , 'Dragonair');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (149 , 'Dragonite');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (150 , 'Mewtwo');
INSERT INTO PokemonRasa (ID, gatunek)
    VALUES (151 , 'Mew');




INSERT INTO Typ (ID, typ)
    VALUES (1 , 'Normal');
INSERT INTO Typ (ID, typ)
    VALUES (2 , 'Fighting');
INSERT INTO Typ (ID, typ)
    VALUES (3 , 'Flying');
INSERT INTO Typ (ID, typ)
    VALUES (4 , 'Poison');
INSERT INTO Typ (ID, typ)
    VALUES (5 , 'Ground');
INSERT INTO Typ (ID, typ)
    VALUES (6 , 'Rock');
INSERT INTO Typ (ID, typ)
    VALUES (7 , 'Bug');
INSERT INTO Typ (ID, typ)
    VALUES (8 , 'Ghost');
INSERT INTO Typ (ID, typ)
    VALUES (9 , 'Steel');
INSERT INTO Typ (ID, typ)
    VALUES (10 , 'Fire');
INSERT INTO Typ (ID, typ)
    VALUES (11 , 'Water');
INSERT INTO Typ (ID, typ)
    VALUES (12 , 'Grass');
INSERT INTO Typ (ID, typ)
    VALUES (13 , 'Electric');
INSERT INTO Typ (ID, typ)
    VALUES (14 , 'Psychic');
INSERT INTO Typ (ID, typ)
    VALUES (15 , 'Ice');
INSERT INTO Typ (ID, typ)
    VALUES (16 , 'Dragon');
INSERT INTO Typ (ID, typ)
    VALUES (17 , 'Dark');
INSERT INTO Typ (ID, typ)
    VALUES (18 , 'Fairy');

INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 1);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 1);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 2);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 2);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 3);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 3);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 4);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 5);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 6);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 6);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 7);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 8);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 9);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 10);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 11);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 12);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 12);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 13);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 13);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 14);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 14);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 15);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 15);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 16);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 16);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 17);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 17);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 18);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 18);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 19);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 20);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 21);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 21);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 22);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 22);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 23);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 24);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 25);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 26);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 27);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 28);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 29);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 30);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 31);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 31);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 32);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 33);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 34);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 34);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 18, 35);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 18, 36);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 37);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 38);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 39);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 18, 39);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 40);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 18, 40);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 41);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 41);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 42);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 42);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 43);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 43);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 44);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 44);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 45);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 45);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 46);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 46);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 47);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 47);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 48);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 48);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 49);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 49);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 50);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 51);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 52);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 53);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 54);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 55);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 56);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 57);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 58);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 59);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 60);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 61);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 62);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 62);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 63);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 64);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 65);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 66);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 67);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 68);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 69);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 69);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 70);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 70);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 71);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 71);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 72);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 72);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 73);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 73);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 74);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 74);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 75);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 75);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 76);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 76);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 77);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 78);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 79);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 79);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 80);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 80);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 81);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 9, 81);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 82);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 9, 82);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 83);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 83);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 84);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 84);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 85);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 85);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 86);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 87);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 15, 87);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 88);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 89);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 90);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 91);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 15, 91);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 8, 92);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 92);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 8, 93);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 93);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 8, 94);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 94);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 95);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 95);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 96);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 97);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 98);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 99);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 100);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 101);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 102);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 102);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 103);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 103);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 104);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 105);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 106);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 2, 107);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 108);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 109);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 4, 110);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 111);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 111);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 5, 112);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 112);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 113);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 12, 114);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 115);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 116);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 117);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 118);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 119);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 120);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 121);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 121);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 122);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 18, 122);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 123);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 123);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 15, 124);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 124);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 125);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 126);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 7, 127);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 128);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 129);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 130);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 130);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 131);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 15, 131);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 132);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 133);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 134);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 135);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 136);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 137);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 138);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 138);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 139);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 139);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 140);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 140);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 141);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 11, 141);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 6, 142);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 142);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 1, 143);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 15, 144);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 144);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 13, 145);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 145);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 10, 146);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 146);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 16, 147);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 16, 148);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 16, 149);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 3, 149);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 150);
INSERT INTO pokemon_Typ (Typ_ID, PokemonRasa_ID)
    VALUES ( 14, 151);



INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 1);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 2);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 3);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 4);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 5);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 6);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 7);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 8);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 9);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 10);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 11);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 12);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 13);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 14);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 15);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 16);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 17);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 18);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 19);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 20);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 21);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 22);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 23);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 24);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 25);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 26);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 27);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 28);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 29);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 30);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 31);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 32);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 33);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 34);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 35);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 36);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 37);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 38);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 39);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 40);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 41);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 42);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 43);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 44);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 45);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 46);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 47);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 48);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 49);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 50);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 51);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 52);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 53);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 54);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 55);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 56);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 57);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 58);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 59);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 60);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 61);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 62);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 63);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 64);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 65);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 66);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 67);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 68);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 69);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 70);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 71);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 72);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 73);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 74);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 75);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 76);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 77);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 78);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 79);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 81);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 82);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 83);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 84);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 85);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 86);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 87);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 88);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 89);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 90);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 91);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 92);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 93);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 94);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 95);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 96);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 97);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 98);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 99);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 100);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 101);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 102);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 103);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 104);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 105);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 106);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 107);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 108);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 109);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 110);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 111);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 112);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 113);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 114);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 115);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 116);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 117);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 118);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 119);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 120);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 121);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 122);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 123);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 124);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 125);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 126);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 127);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 128);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 129);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 130);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 131);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 132);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 133);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 134);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 135);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 136);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 137);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 138);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 139);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 140);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 141);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 142);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 143);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 144);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 145);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 146);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 147);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 148);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 149);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 150);
INSERT INTO pokemonRasa_Region (Region_ID, PokemonRasa_ID)
    VALUES (1 , 151);

INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (1 , 'Pewter City Gym' , 1 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (2 , 'Cerulean City Gym' , 2 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (3 , 'Vermillion City Gym' , 3 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (4 , 'Celadon City Gym' , 4 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (5 , 'Fuschia City Gym' , 5 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (6 , 'Saffron City Gym' , 6 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (7 , 'Cinnabar Island Gym' , 7 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (8 , 'Viridian City Gym' , 8 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (9 , 'Elite Four 1' , 9 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (10 , 'Elite Four 2' , 10 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (11 , 'Elite Four 3' , 11 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (12 , 'Elite four 4' , 12 , 1);
INSERT INTO Gym (ID, nazwa, Trener_ID, Region_ID)
    VALUES (13 , 'Elite Four Champion' , 13 , 1);

INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (1 , 'Pikachu Asha' , 25 , null , 1 , 15 , 40 , 28 , 21 , 21 , 24 , 36 , 0, '1999-06-01');
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (2 , 'Squirtle Garryego' , 7 , null , 2 , 15 , 42 , 26 , 29 , 21 , 28 , 22 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (3 , 'Geodude Brocka' , 74 , 1 , null , 12 , 35 , 29 , 32 , 13 , 15 , 13 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (4 , 'Onix Brocka' , 95 , 1 , null , 14 , 38 , 23 , 54 , 15 , 21 , 28 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (5 , 'Staryu Misty' , 120 , 2 , null , 18 , 44 , 28 , 30 , 31 , 30 , 41 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (6 , 'Starmie Misty' , 121 , 2 , null , 21 , 62 , 47 , 47 , 47 , 47 , 59 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (7 , 'Voltrob Lt. Surgea' , 100 , 3 , null , 21 , 54 , 26 , 32 , 30 , 34 , 53 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (8 , 'Pikachu Lt. Surge' , 26 , 3 , null , 18 , 46 , 33 , 24 , 25 , 28 , 42 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (9 , 'Raichu Lt. Surge' , 26 , 3 , null , 24 , 70 , 60 , 38 , 49 , 50 , 65 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (10 , 'Victreebel Eriki' , 71 , 4 , null , 29 , 94 , 81 , 51 , 63 , 54 ,	54 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (11 , 'Tangela Eriki' , 114 , 4 , null , 24 , 72 , 41 , 67 , 54 , 31 , 41 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (12 , 'Vileplume Eriki' , 45 , 4 , null , 29 , 91 , 66 , 63 , 69 , 66 , 42 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (13 , 'Koffing Kogi' , 109 , 5 , null , 37 , 88 , 70 , 86 , 54 , 49 , 42 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (14 , 'Muk Kogi' , 89 , 5 , null , 39 , 142 , 107 , 75 , 60 , 95 , 56 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (15 , 'Koffing Kogi' , 109 , 5 , null , 37 , 88 , 70 , 86 , 54 , 49 , 42 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (16 , 'Weezing Kogi' , 110 , 5 , null , 43 , 122 , 104 , 121 , 81 , 78 , 69 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (17 , 'Kadabra Sabriny' , 64 , 6 , null , 38 , 90 , 47 , 39 , 96 , 69 , 96 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (18 , 'Mr. Mime Sabriny' , 122 , 6 , null , 37 , 88 , 53 , 64 , 81 , 105 , 83 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (19 , 'Venomoth Sabriny' , 49 , 6 , null , 38 , 112 , 72 , 62 , 76 , 73 , 85 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (20 , 'Alakazam Sabriny' , 65 , 6 , null , 43 , 113 , 67 , 57 , 120 , 100 , 121 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (21 , 'Growlithe Blainea' , 58 , 7 , null , 42 , 111 , 83 , 55 , 68 , 60 , 68 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (22 , 'Ponyta Blainea' , 77 , 7 , null , 40 , 102 , 93 , 61 , 62 , 69 , 89 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (23 , 'Rapidash Blainea' , 78 , 7 , null , 42 , 119 , 112 , 76 , 76 , 85 , 106 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (24 , 'Arcanine Blainea' , 59 , 7 , null , 47 , 156 , 134 , 94 , 101 , 94 , 108 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (25 , 'Rhyhorn Giovanniego' , 111 , 8 , null , 45 , 140 , 104 , 104 , 40 , 45 , 41 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (26 , 'Dugtrio Giovanniego' , 51 , 8 , null , 42 , 100 , 118 , 63 , 56 , 81 , 126 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (27 , 'Nidoqueen Giovanniego' , 31 , 8 , null , 44 , 146 , 108 , 95 , 75 , 93 , 85 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (28 , 'Nidoking Giovanniego' , 34 , 8 , null , 45 , 141 , 121 , 88 , 85 , 86 , 95 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (29 , 'Rhydon Giovanniego' , 112 , 8 , null , 50 , 180 , 165 , 140 , 58 , 65 , 60 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (30 , 'Dewgong Lorelei' , 87 , 9 , null ,52  , 171 , 102 , 104 , 83 , 119 , 93 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (31 , 'Cloyster Lorelei' , 91 , 9 , null , 51 , 127 , 128 , 204 , 96 , 66 , 92 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (32 , 'Slowbro Lorelei' , 80 , 9 , null , 52 , 176 , 108 , 135 , 112 , 104 , 52 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (33 , 'Jynx Lorelei' , 124 , 9 , null , 54 , 150 , 82 , 59 , 130 , 124 , 124 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (34 , 'Lapras Lorelei' , 131 , 9 , null , 54 , 221 , 124 , 108 , 101 , 124 , 86 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (35 , 'Onix Bruna' , 95 , 10 , null , 51 , 112 , 72 , 184 , 45 , 66 , 92 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (36 , 'Hitmonchan Bruna' , 107 , 10 , null , 53 , 132 , 145 , 105 , 52 , 138 , 101 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (37 , 'Hitmonlee Bruna' , 106 , 10 , null , 53 , 132 , 162 , 77 , 52 , 138 , 113 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (38 , 'Onix Bruna' , 95 , 10 , null , 54 , 118 , 77 , 194 , 48 , 70 , 97 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (39 , 'Machamp Bruna' , 68 , 10 , null , 56 , 184 , 183 , 111 , 85 , 117 , 83 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (40 , 'Gengar Agathy' , 94 , 11 , null , 54 , 145 , 100 , 86 , 145 , 102 , 140 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (41 , 'Golbat Agathy' , 42 , 11 , null , 54 , 161 , 118 , 97 , 81 , 102 , 118 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (42 , 'Haunter Agathy' , 93 , 11 , null , 53 , 127 , 81 , 69 , 128 , 79 , 122 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (43 , 'Arbok Agathy' , 24 , 11 , null , 56 , 150 , 140 , 99 , 85 , 110 , 111 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (44 , 'Gengar Agathy' , 94 , 11 , null , 58 , 155 , 107 , 92 , 155 , 109 , 150 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (45 , 'Gyarados Lancea' , 130 , 12 , null , 56 , 189 , 178 , 110 , 80 , 134 , 113 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (46 , 'Dragonair Lancea' , 148 , 12 , null , 54 , 146 , 123 , 91 , 87 , 97 , 97 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (47 , 'Dragonair Lancea' , 148 , 12 , null , 54 , 146 , 123 , 91 , 87 , 97 , 97 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (48 , 'Aerodactyl Lancea' , 142 , 12 , null , 58 , 178 , 158 , 98 , 82 , 109 , 173 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (49 , 'Dragonite Lancea' , 149 , 12 , null , 60 , 197 , 202 , 137 , 128 , 143 , 119 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (50 , 'Pidgeot Championa' , 18 , 13 , null , 59 , 185 , 128 , 111 , 94 , 105 , 142 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (51 , 'Alakazam Championa' , 65 , 13 , null , 57 , 147 , 86 , 73 , 158 , 130 , 159 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (52 , 'Rhydon Championa' , 112 , 13 , null , 59 , 211 , 193 , 164 , 68 , 76 , 70 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (53 , 'Arcanine Championa' , 59 , 13 , null , 59 , 193 , 168 , 117 , 126 , 117 , 135 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (54 , 'Exeggutor Championa' , 103 , 13 , null , 61 , 205 , 152 , 127 , 158 , 115 , 91 , 0 , null);
INSERT INTO Pokemon (ID, Nazwa, PokemonRasa_ID, Trener_ID, Gracz_ID, LVL, HP, ATK, DEF, SPD_ATK, SPD_DEF, SPD, EXP, DataZlapania)
    VALUES (55 , 'Blastoise Championa' , 9 , 13 , null , 63 , 192 , 141 , 150 , 117 , 156 , 12 , 0 , null);
	
	
--2 PROSTE ZAPYTANIA Z WARUNKIEM W WHERE

--Pokazuje Pokemony trenera Giovanni
SELECT *
FROM pokemon
WHERE trener_id = 8;

--Pokazuje gatunki Pokemonow, w ktorych nazwie wystepuje zlepek 'ite'
SELECT *
FROM pokemonrasa
WHERE gatunek LIKE '%ite%';


--2 PROSTE ZAPYTANIA Z WARUNKIEM WHERE NA WIELU TABELKACH (JOIN)

--Pokazuje gatunki Pokemonow o typie Steel i Ice
SELECT pokemonrasa.id, pokemonrasa.gatunek, typ.typ
FROM typ, pokemonRasa, pokemon_typ
WHERE pokemonRasa.id = pokemon_typ.pokemonrasa_id AND pokemon_typ.typ_id = typ.id AND typ IN ('Steel','Ice');

--Pokazuje gatunki Pokemonow, ktore wystepuja w Gymach, w ktorych sa trenerzy o ID 1, 3 lub 12
SELECT DISTINCT gym.nazwa, pokemonRasa.gatunek
FROM gym, trener, pokemon, pokemonRasa
WHERE gym.trener_id = trener.id AND trener.id = pokemon.trener_id AND pokemonRasa.id = pokemon.pokemonrasa_id AND trener.id IN (1 , 3 , 12);


--2 ZAPYTANIA GRUPUJĄCE

--Pokazuje najnizszy i najwyzszy poziom wsrod Pokemonow
SELECT MIN(lvl) AS Najnizszy_Poziom, MAX(lvl) AS Najwyzszy_Poziom
FROM pokemon;

--Pokazuje srednie statystyki Pokemonow
SELECT AVG(hp) AS Srednia_HP, AVG(atk) AS Srednia_ATK, AVG(def) AS Srednia_DEF, AVG(spd_atk) AS Srednia_SPD_ATK, AVG(spd_def) AS Srednia_SPD_DEF, AVG(spd) AS Srednia_SPD
FROM pokemon;


--2 ZAPYTANIA GRUPUJĄCE Z HAVING I GROUP BY

--Podaje ilosc Pokemonów z danego typu, jesli ta ilosc jest wieksza od 15
SELECT typ.typ, COUNT(typ.typ)
FROM pokemonRasa, typ, pokemon_typ
WHERE pokemonRasa.id = pokemon_typ.pokemonrasa_id AND pokemon_typ.typ_id = typ.id
GROUP BY typ.typ
HAVING COUNT(typ.typ) > 15;

--Oblicza srednia wartosc ataku dla Pokemonow wszystkich typow, a potem wypisuje te typy, ktorych srednie sa w przedziale <100,150)
SELECT typ.typ, AVG(pokemon.atk)
FROM typ, pokemon, pokemonRasa, pokemon_typ
WHERE typ.id = pokemon_typ.typ_id AND pokemon_typ.pokemonrasa_id = pokemonrasa.id AND pokemonrasa.id = pokemon.pokemonrasa_id
GROUP BY typ.typ
HAVING AVG(pokemon.atk) >= 100 AND AVG(pokemon.atk) < 150;


--1 PODZAPYTANIE ZWYKŁE Z WHERE

--Wyswietla Pokemony, ktorych poziom jest bliski sredniej wszystkich Pokemonow
SELECT nazwa, lvl
FROM pokemon
WHERE lvl > (SELECT AVG(lvl) - 5 FROM pokemon) AND lvl < (SELECT AVG(lvl) + 5 FROM pokemon);


--1 WYZWALACZ FOR EACH ROW

--Zapogieba uzyskaniu zbyt dużej ilości punktów doświadczenia 
CREATE OR REPLACE TRIGGER OverLeveled
BEFORE UPDATE OR INSERT
ON Pokemon
FOR EACH ROW
BEGIN
    IF :new.EXP > 100 THEN
        dbms_output.put_line('Awansuj Pokemona na kolejny poziom, aby mógł zdobywać dalsze doświadczenie.');
        :new.EXP := 100;
    END IF;
END;

--1 FUNKCJA

--Funkcja losowo wyłaniająca zwycięzce pojedynku
CREATE OR REPLACE FUNCTION WyłońZwycięzce  (
    v_ID1 Pokemon.ID%type,
    v_ID2 Pokemon.ID%type
) RETURN Pokemon.ID%type
AS
    v_Rzut INTEGER;
BEGIN
    v_Rzut := dbms_random.value(0,1001);
    IF v_Rzut>500 THEN
        RETURN (v_ID1);
    ELSE
        RETURN (v_ID2);
    END IF;
END;


CREATE OR REPLACE PROCEDURE Fight (
    v_ID1 Pokemon.ID%type,
    v_ID2 Pokemon.ID%type
)
AS
    v_EXPgain INTEGER := ROUND((dbms_random.value(25, 40)));
    v_WinnerID Pokemon.ID%type;
BEGIN
    v_WinnerID := WyłońZwycięzce(v_ID1,v_ID2);
        dbms_output.put_line('Wygrywa pokemon o ID: ' || v_WinnerID);
        dbms_output.put_line('Otrzymana ilość punktów doświadczenia: ' || v_EXPgain);
        UPDATE Pokemon
        SET EXP = EXP + v_EXPgain
        WHERE ID = v_WinnerID;
END;
      
EXECUTE Fight(1,2);
      
      
         
UPDATE Pokemon
SET EXP = 0
WHERE ID = 1;   
UPDATE Pokemon
SET EXP = 0
WHERE ID = 2;

--1 BLOK PL/SQL Z KURSOREM
--1 PROCEDURA ZWRACAJĄCA WARTOŚCI

--Procedura przeglądająca pokemony i informująca które z nich są gotowe do awansu
DECLARE
    CURSOR cur IS SELECT e.ID, e.EXP FROM Pokemon e;
    v_ID Pokemon.EXP%type;
    v_EXP Pokemon.EXP%type;
    v_ilosc INTEGER := 0;
BEGIN
    SELECT COUNT(1) INTO v_ilosc
    FROM Pokemon
    WHERE EXP = 100;
    
    OPEN cur;
    LOOP
        FETCH cur INTO v_ID, v_EXP;
        EXIT WHEN cur%NOTFOUND;
        IF v_EXP = 100 THEN
            dbms_output.put_line('Pokemon o ID:' || v_ID || ' jest gotowy do awansu.');
        ELSE
            dbms_output.put_line('Pokemon o ID:' || v_ID || ' nie ma wystarczająco doświadczenia.');
        END IF;
    END LOOP;
    CLOSE cur;
    IF v_ilosc > 0 THEN
        dbms_output.put_line('Znaleziono Pokemony gotowe do awansu!');
    ELSE 
        dbms_output.put_line('Nie znaleziono Pokemonów gotowych do awansu.');
    END IF;
END;

--Procedura awansująca pokemony
CREATE OR REPLACE PROCEDURE Awans (
    v_IDdoAwansu Pokemon.ID%type
)
AS
    CURSOR cur IS SELECT e.ID, e.EXP FROM Pokemon e WHERE e.ID = v_IDdoAwansu;
    v_ID Pokemon.ID%type;
    v_EXP Pokemon.EXP%type;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO v_ID,v_EXP;
        EXIT WHEN cur%NOTFOUND;
        IF v_EXP = 100 AND v_IDdoAwansu = v_ID THEN
            UPDATE Pokemon
            SET EXP = 0, LVL = LVL + 1, HP = HP * 1.1, ATK = ATK * 1.1, DEF = DEF * 1.1, SPD_ATK = SPD_ATK  * 1.1, SPD_DEF = SPD_DEF * 1.1, SPD = SPD * 1.1
            WHERE v_ID = ID;
            dbms_output.put_line('Pokemon o ID:' || v_ID || ' awansował na kolejny poziom!');
        ELSE
            dbms_output.put_line('Pokemon nie jest gotowy na awans. Liczba brakujących punktów doświadczenia: ' || (100 - v_EXP));
        END IF;
    END LOOP;
    CLOSE cur;
END;

----------------------------
	
-- End of file.