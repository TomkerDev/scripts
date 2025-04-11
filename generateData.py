from faker import Faker
import oracledb

fake = Faker("fr_FR")  # Utilisation du français pour les données fictives

# Remplacez les informations par les vôtres
username = "votre_utilisateur"
password = "votre_mot_de_passe"
dsn = oracledb.makedsn("localhost", 1521, service_name="votre_service")  # Remplacez 'localhost', 1521, et 'votre_service'

try:
    connection = oracledb.connect(user=username, password=password, dsn=dsn)
    cursor = connection.cursor()

    def generate_clients():
        for _ in range(10):  # Générer 10 clients
            nom = fake.name()
            adresse = fake.address()
            email = fake.email()
            cursor.execute(
                "INSERT INTO Clients (id_client, nom, adresse, email) VALUES (clients_seq.NEXTVAL, :nom, :adresse, :email)",
                nom=nom,
                adresse=adresse,
                email=email,
            )

    def generate_produits():
        for _ in range(10):  # Générer 10 produits
            nom = fake.word().capitalize() + " " + fake.word().capitalize()
            description = fake.sentence()
            prix = fake.random_int(min=50, max=1000)
            cursor.execute(
                "INSERT INTO Produits (id_produit, nom, description, prix) VALUES (produits_seq.NEXTVAL, :nom, :description, :prix)",
                nom=nom,
                description=description,
                prix=prix,
            )

    def generate_commandes():
        for _ in range(10):  # Générer 10 commandes
            id_client = fake.random_int(min=1, max=10)  # Assurez-vous que les IDs clients existent
            date_commande = fake.date_between(start_date="-1y", end_date="today")
            cursor.execute(
                "INSERT INTO Commandes (id_commande, id_client, date_commande) VALUES (commandes_seq.NEXTVAL, :id_client, TO_DATE(:date_commande, 'YYYY-MM-DD'))",
                id_client=id_client,
                date_commande=date_commande.strftime("%Y-%m-%d"),
            )

    def generate_lignes_commande():
        for _ in range(20):  # Générer 20 lignes de commande
            id_commande = fake.random_int(min=1, max=10)  # Assurez-vous que les IDs commandes existent
            id_produit = fake.random_int(min=1, max=10)  # Assurez-vous que les IDs produits existent
            quantité = fake.random_int(min=1, max=5)
            cursor.execute(
                "INSERT INTO Lignes_commande (id_ligne, id_commande, id_produit, quantité) VALUES (lignes_commande_seq.NEXTVAL, :id_commande, :id_produit, :quantité)",
                id_commande=id_commande,
                id_produit=id_produit,
                quantité=quantité,
            )

    generate_clients()
    generate_produits()
    generate_commandes()
    generate_lignes_commande()

    connection.commit()
    print("Données générées et insérées avec succès.")

except oracledb.Error as error:
    print(f"Erreur lors de la connexion ou de l'exécution des requêtes : {error}")

finally:
    if connection:
        cursor.close()
        connection.close()