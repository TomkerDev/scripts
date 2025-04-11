LOAD DATA
INFILE 'lignes_commande.csv'
REPLACE
INTO TABLE Lignes_Commande
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY '"'
(
    id_ligne INTEGER EXTERNAL,
    id_commande INTEGER EXTERNAL,
    id_produit INTEGER EXTERNAL,
    quantite INTEGER EXTERNAL
)
