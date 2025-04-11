LOAD DATA
INFILE 'clients.csv'
REPLACE
INTO TABLE Clients
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY '"'
(
    id_client INTEGER EXTERNAL,
    nom CHAR,
    adresse CHAR,
    email CHAR
)
