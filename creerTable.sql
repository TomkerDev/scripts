
-- création de la table clients
CREATE TABLE clients (
	id_client INT PRIMARY KEY,
	nom VARCHAR2(100),
	adresse VARCHAR2(255),
	email VARCHAR2(100)
);
-- Création de la table Produits
CREATE TABLE produits (
    id_produit INT PRIMARY KEY,
    nom VARCHAR2(100),
    description VARCHAR2(255),
    prix DECIMAL(10, 2)
);

-- Création de la table Commandes
CREATE TABLE commandes (
    id_commande INT PRIMARY KEY,
    id_client INT,
    date_commande DATE,
    FOREIGN KEY (id_client) REFERENCES clients(id_client)
);

-- Création de la table Lignes_commande
CREATE TABLE lignes_commande (
    id_ligne INT PRIMARY KEY,
    id_commande INT,
    id_produit INT,
    quantite INT,
    FOREIGN KEY (id_commande) REFERENCES commandes(id_commande),
    FOREIGN KEY (id_produit) REFERENCES produits(id_produit)
);


