
-- Requêtes critiques pour le projet de base de données;
-- requete 1
--EXPLAIN PLAN  FOR 
--DEFINE id_commande = 123;
--SELECT c.nom, c.adresse, p.nom, p.prix, lc.quantite
--FROM Commandes co
--JOIN Clients c ON co.id_client = c.id_client
--JOIN Lignes_commande lc ON co.id_commande = lc.id_commande
--JOIN Produits p ON lc.id_produit = p.id_produit
--WHERE co.id_commande = :id_commande;


-- Affichage des plans d'exécution requete 1 
--SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

-- requete 2
--EXPLAIN PLAN  FOR  
SELECT p.nom, COUNT(*) AS nombre_ventes 
FROM Lignes_commande lc 
JOIN Produits p ON lc.id_produit = p.id_produit
GROUP BY p.nom 
ORDER BY nombre_ventes DESC;



-- Affichage des plans d'exécution requete 2
--SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY());

