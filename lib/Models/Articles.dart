import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Articles{
  String? articleId, libelle, description, famille;
  Timestamp? hotodatage;
  bool? articleFavori;
  List<dynamic>? materiaux, urlImage;
  int? prix, pourcentageReduction, qteStock, nbFavori;
  
  // Déclaraction et Initialisation
  final db = FirebaseFirestore.instance;
  CollectionReference _articles = FirebaseFirestore.instance.collection('articles');
  FirebaseStorage _storage = FirebaseStorage.instance;

  Articles(      
      {this.articleId,
        this.libelle,
        this.description,
        this.urlImage,
        this.famille,
        this.hotodatage,
        this.articleFavori,
        this.nbFavori,
        this.materiaux,
        this.prix,
        this.pourcentageReduction,
        this.qteStock,
      });

  //Ajouter un article dans firebase
  void addArticles(Articles articles){
    _articles.add({
      "libelle":articles.libelle,
      "description":articles.description,
      "urlImage":articles.urlImage,
      "famille":articles.famille,
      "articleId":articles.articleId,
      "prix":articles.prix,
      "qteStock":articles.qteStock,
      "pourcentageReduction":articles.pourcentageReduction,
      "materiaux":articles.materiaux,
      "hotodatage":articles.hotodatage,
      "articleFavori":articles.articleFavori,
      "nbFavori":articles.nbFavori,
    });
  }

  //Récupération de tous les articles en temps réel depuis firebase
  Stream<List<Articles>> get article{
    Query queryArticles = _articles.orderBy('nbFavori', descending: false);
    return queryArticles.snapshots().map((snapshot) {
      return snapshot.docs.map((doc){
        return Articles(
          articleId: doc.get("articleId"),
          libelle: doc.get('libelle'),
          description: doc.get('description'),
          urlImage: doc.get('urlImage'),
          famille: doc.get('famille'),
          prix: doc.get('prix'),
          qteStock: doc.get('qteStock'),
          pourcentageReduction: doc.get('pourcentageReduction'),
          materiaux: doc.get('materiaux'),
          hotodatage: doc.get('hotodatage'),
          articleFavori: doc.get('articleFavori'),
          nbFavori: doc.get('nbFavori'),
        );
      }).toList();
    });
  }
}