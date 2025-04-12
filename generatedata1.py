from faker import Faker
import csv
import random
from datetime import datetime, timedelta

fake = Faker('fr_FR')  # Utiliser la localisation française

def generer_clients(nombre_clients):
    clients = []
    for i in range(1, nombre_clients + 1):
        clients.append({
            'id_client': i,
            'nom': fake.name(),
            'adresse': fake.address(),
            'email': fake.email()
        })
    return clients

def generer_produits(nombre_produits):
    produits = []
    for i in range(1, nombre_produits + 1):
        produits.append({
            'id_produit': i,
            'nom': fake.word().capitalize() + " " + fake.word().capitalize(),
            'description': fake.sentence(),
            'prix': round(random.uniform(10, 200), 2)
        })
    return produits

def generer_commandes(nombre_commandes, clients):
    commandes = []
    for i in range(1, nombre_commandes + 1):
        client = random.choice(clients)
        date_debut = datetime(2023, 1, 1)
        date_fin = datetime.now()
        date_commande = fake.date_time_between(start_date=date_debut, end_date=date_fin)
        commandes.append({
            'id_commande': i,
            'id_client': client['id_client'],
            'date_commande': date_commande.strftime('%Y-%m-%d %H:%M:%S')
        })
    return commandes

def generer_lignes_commande(nombre_lignes, commandes, produits):
    lignes_commande = []
    for i in range(1, nombre_lignes + 1):
        commande = random.choice(commandes)
        produit = random.choice(produits)
        quantite = random.randint(1, 10)
        lignes_commande.append({
            'id_ligne': i,
            'id_commande': commande['id_commande'],
            'id_produit': produit['id_produit'],
            'quantite': quantite
        })
    return lignes_commande


#function d'enregistrement CSV
def enregistrer_clients_csv(clients, nom_fichier):
    with open(nom_fichier, 'w', newline='', encoding='utf-8') as fichier_csv:
        champs = ['id_client', 'nom', 'adresse', 'email']
        ecrivain_csv = csv.DictWriter(fichier_csv, fieldnames=champs)
        ecrivain_csv.writeheader()
        for client in clients:
            ecrivain_csv.writerow(client)

def enregistrer_produits_csv(produits, nom_fichier):
    with open(nom_fichier, 'w', newline='', encoding='utf-8') as fichier_csv:
        champs = ['id_produit', 'nom', 'description', 'prix']
        ecrivain_csv = csv.DictWriter(fichier_csv, fieldnames=champs)
        ecrivain_csv.writeheader()
        for produit in produits:
            ecrivain_csv.writerow(produit)

def enregistrer_commandes_csv(commandes, nom_fichier):
    with open(nom_fichier, 'w', newline='', encoding='utf-8') as fichier_csv:
        champs = ['id_commande', 'id_client', 'date_commande']
        ecrivain_csv = csv.DictWriter(fichier_csv, fieldnames=champs)
        ecrivain_csv.writeheader()
        for commande in commandes:
            ecrivain_csv.writerow(commande)

def enregistrer_lignes_commande_csv(lignes_commande, nom_fichier):
    with open(nom_fichier, 'w', newline='', encoding='utf-8') as fichier_csv:
        champs = ['id_ligne', 'id_commande', 'id_produit', 'quantite']
        ecrivain_csv = csv.DictWriter(fichier_csv, fieldnames=champs)
        ecrivain_csv.writeheader()
        for ligne in lignes_commande:
            ecrivain_csv.writerow(ligne)

# Exemple d'utilisation
clients = generer_clients(10000)
produits = generer_produits(2000)
commandes = generer_commandes(50000, clients)
lignes_commande = generer_lignes_commande(200000, commandes, produits)
print("Données générées avec succès.")
# Appel pour l'enregistrement en fichier CSV

enregistrer_clients_csv(clients, 'clients.csv')
enregistrer_produits_csv(produits, 'produits.csv')
enregistrer_commandes_csv(commandes, 'commandes.csv')
enregistrer_lignes_commande_csv(lignes_commande, 'lignes_commande.csv')
print("Fichiers CSV générés avec succès.")

# Affichage des données (vous pouvez les enregistrer dans des fichiers CSV ou les insérer dans une base de données)
#print("Clients:", clients)
#print("Produits:", produits)
#print("Commandes:", commandes)
#print("Lignes de commande:", lignes_commande)