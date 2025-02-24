import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class Services{
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  //AJOUTER UN PRODUITS DANS LA LISTE DES PRODUITS FAVORIS
  Future<dynamic> AjoutProduitFav(dynamic idProduit, dynamic libelle,
      dynamic description, dynamic famille, dynamic urlImage, List<dynamic> listImages,
      List<dynamic> materiaux, dynamic prix, dynamic pourcentageReduction, dynamic favori,
      dynamic nbFavori, dynamic qteStock, dynamic hotodatage,) async{

    DatabaseReference refListProduitsFav = FirebaseDatabase.instance.ref("articles/$idProduit");


    await refListProduitsFav.set({
      "articleId": idProduit,
      "libelle": libelle,
      "description": description,
      "famille": famille,
      "urlImage": urlImage,
      "listImages": {
        "line1": "100 Mountain View",
        "line1": "100 Mountain View",
        "line1": "100 Mountain View",
      },
      "materiaux": {
        "line1": "100 Mountain View",
        "line1": "100 Mountain View",
        "line1": "100 Mountain View",
      },
      "prix": prix,
      "pourcentageReduction": pourcentageReduction,
      "articleFavori": favori,
      "nbFavori": nbFavori,
      "qteStock": qteStock,
      //"hotodatage": hotodatage,
    });
  }

  //MODIFIER UNE PROPRIETE D'UN PRODUIT
Future<dynamic> UpdateUneProprieteProduit(dynamic idProduit, dynamic laPropriete, dynamic laValeur) async{
  DatabaseReference ref = FirebaseDatabase.instance.ref("articles/$idProduit");

// Only update the name, leave the age and address!
  await ref.update({
    "$laPropriete": laValeur,
  });
}

  //RECUPERER LES DONNEES DE MON ARTICLE DEPUIS LA COLLECTION ARTICLES
Future<dynamic> RecupererDonneesArticles(dynamic idProduit) async{
  final ref = FirebaseDatabase.instance.ref();

  final snapshot = await ref.child("articles/$idProduit").get();

  if (snapshot.exists) {
    return snapshot.value;
  } else {
    print('No data available.');
  }
}


  //RECUPERER LES DONNEES DE MON ARTICLE DEPUIS UNE COLLECTION LAMBDA
  Future<dynamic> RecupererDonneesArticlesDepuisCollection(dynamic laCollection, dynamic idProduit) async{
    final ref = FirebaseDatabase.instance.ref();

    final snapshot = await ref.child("$laCollection/$idProduit").get();

    if (snapshot.exists) {
      return snapshot.value;
    } else {
      print('No data available.');
    }
  }

  //SUPPRIMER UN ARTICLE EN FONCTION DU NOM DEPUIS LA COLLECTION ARTICLES
  Future<dynamic> SupprimerArticleAvecNomDepuisCollArticles(dynamic idProduit) async{
    final ref = FirebaseDatabase.instance.ref("articles/$idProduit").remove().then((idProduit){
      print("Article supprimé avec succès");
    }).catchError((error) {
      print("UN SOUCIS A ETE RENCONTRé !");
    });
  }

}