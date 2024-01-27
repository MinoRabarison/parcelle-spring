use farming_game

db.message.insertOne({id_user: "", id_destinataire: "", message: "", date_envoi: ISODate("2024-01-01T00:00:00Z")})

db.user_ressource.insertOne({id_user: "", id_culture: "", quantite: 0})

db.photo.insertOne({id_photo: "", base64: ""})

db.historique_parcelle({id_parcelle: "", enregistrement: ISODate("2024-01-01T00:00:00Z"), etat: 0})

db.historique_parcelle({id_plantation: "", enregistrement: ISODate("2024-01-01T00:00:00Z"), etat: 0})