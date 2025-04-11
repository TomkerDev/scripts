INSERT INTO Clients VALUES (1, 'Jean Dupont', '10 rue de la Paix, Paris', 'jean.dupont@email.com');
INSERT INTO Clients VALUES (2, 'Marie Curie', '20 avenue des Sciences, Lyon', 'marie.curie@email.com');
INSERT INTO Clients VALUES (3, 'Pierre Durand', '30 boulevard des Arts, Marseille', 'pierre.durand@email.com');
INSERT INTO Clients VALUES (4, 'Sophie Martin', '40 rue du Commerce, Toulouse', 'sophie.martin@email.com');
INSERT INTO Clients VALUES (5, 'Luc Bernard', '50 avenue de la Liberté, Bordeaux', 'luc.bernard@email.com');
INSERT INTO Clients VALUES (6, 'Isabelle Garcia', '60 rue de la République, Lille', 'isabelle.garcia@email.com');
INSERT INTO Clients VALUES (7, 'Antoine Thomas', '70 boulevard des Roses, Nantes', 'antoine.thomas@email.com');
INSERT INTO Clients VALUES (8, 'Catherine Robert', '80 rue du Château, Strasbourg', 'catherine.robert@email.com');
INSERT INTO Clients VALUES (9, 'Sébastien Richard', '90 avenue des Peupliers, Grenoble', 'sebastien.richard@email.com');
INSERT INTO Clients VALUES (10, 'Nathalie Petit', '100 rue des Étoiles, Nice', 'nathalie.petit@email.com');



-- Table Produits
INSERT INTO Produits VALUES (1, 'Ordinateur portable', 'Ordinateur portable performant', 1200);
INSERT INTO Produits VALUES (2, 'Smartphone', 'Smartphone dernière génération', 800);
INSERT INTO Produits VALUES (3, 'Tablette', 'Tablette tactile 10 pouces', 300);
INSERT INTO Produits VALUES (4, 'Imprimante', 'Imprimante multifonction laser', 250);
INSERT INTO Produits VALUES (5, 'Scanner', 'Scanner de documents A4', 150);
INSERT INTO Produits VALUES (6, 'Disque dur externe', 'Disque dur externe 2To', 100);
INSERT INTO Produits VALUES (7, 'Clé USB', 'Clé USB 64Go', 20);
INSERT INTO Produits VALUES (8, 'Souris', 'Souris sans fil ergonomique', 30);
INSERT INTO Produits VALUES (9, 'Clavier', 'Clavier mécanique rétroéclairé', 80);
INSERT INTO Produits VALUES (10, 'Écran', 'Écran 27 pouces 4K', 400);

-- Table Commandes
INSERT INTO Commandes VALUES (1, 1, TO_DATE('2023-10-26', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (2, 2, TO_DATE('2023-10-27', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (3, 3, TO_DATE('2023-10-28', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (4, 4, TO_DATE('2023-10-29', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (5, 5, TO_DATE('2023-10-30', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (6, 6, TO_DATE('2023-10-31', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (7, 7, TO_DATE('2023-11-01', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (8, 8, TO_DATE('2023-11-02', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (9, 9, TO_DATE('2023-11-03', 'YYYY-MM-DD'));
INSERT INTO Commandes VALUES (10, 10, TO_DATE('2023-11-04', 'YYYY-MM-DD'));

-- Table Lignes_commande
INSERT INTO Lignes_commande VALUES (1, 1, 1, 1);
INSERT INTO Lignes_commande VALUES (2, 1, 2, 2);
INSERT INTO Lignes_commande VALUES (3, 2, 3, 1);
INSERT INTO Lignes_commande VALUES (4, 2, 4, 3);
INSERT INTO Lignes_commande VALUES (5, 3, 5, 1);
INSERT INTO Lignes_commande VALUES (6, 3, 6, 2);
INSERT INTO Lignes_commande VALUES (7, 4, 7, 1);
INSERT INTO Lignes_commande VALUES (8, 4, 8, 4);
INSERT INTO Lignes_commande VALUES (9, 5, 9, 1);
INSERT INTO Lignes_commande VALUES (10, 5, 10, 2);
INSERT INTO Lignes_commande VALUES (11, 6, 1, 1);
INSERT INTO Lignes_commande VALUES (12, 6, 3, 1);
INSERT INTO Lignes_commande VALUES (13, 7, 5, 2);
INSERT INTO Lignes_commande VALUES (14, 7, 7, 1);
INSERT INTO Lignes_commande VALUES (15, 8, 9, 3);
INSERT INTO Lignes_commande VALUES (16, 8, 2, 1);
INSERT INTO Lignes_commande VALUES (17, 9, 4, 2);
INSERT INTO Lignes_commande VALUES (18, 9, 6, 1);
INSERT INTO Lignes_commande VALUES (19, 10, 8, 2);
INSERT INTO Lignes_commande VALUES (20, 10, 10, 1);