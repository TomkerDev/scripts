-- Index sur Lignes_commande.id_produit
CREATE INDEX idx_lignes_commande_id_produit ON Lignes_commande (id_produit);

-- Index sur Produits.nom (si nécessaire)
CREATE INDEX idx_produits_nom ON Produits (nom);


SELECT index_name, table_name, column_name
FROM user_ind_columns
WHERE table_name IN ('LIGNES_COMMANDE', 'PRODUITS', 'COMMANDES', 'CLIENTS')
ORDER BY table_name, index_name;