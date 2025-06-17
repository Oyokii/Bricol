import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class NewCollectionPage extends StatefulWidget {
  const NewCollectionPage({super.key});

  @override
  State<NewCollectionPage> createState() => _NewCollectionPageState();
}

class _NewCollectionPageState extends State<NewCollectionPage> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MediaQuery(data: MediaQueryData(
          size: MediaQuery.of(context).size
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [

              //REPRESENTATION DECORATION ENVIRONNEMENT
              StreamBuilder(
                stream: db.collection("newCollectionRepresentationImages").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Aucune image de représentation trouvée");
                  } else {
                    List<dynamic> imageRepresentation = [];
                    for (var element in snapshot.data!.docs) {
                      imageRepresentation.add(element);
                    }

                    return Container(
                      child: SizedBox(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 450,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: SizedBox(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: 2,
                                  scrollDirection: Axis.horizontal,
                                  physics: const ScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      crossAxisSpacing: 1,
                                      childAspectRatio: 1.40 / 1),
                                  itemBuilder:
                                      (context, index) {
                                    final imagesRepresentation = imageRepresentation[index];
                                    final urlImage = imagesRepresentation['urlImage'];

                                    return Padding(
                                      padding: const EdgeInsets.all(30.0),
                                      child: SizedBox(
                                        width: 250,
                                        height: 450,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .circular(40),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      urlImage),
                                                  fit: BoxFit.cover)
                                          ),
                                        ),
                                      ),
                                    );
                                  },),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }
              ),

              // MOTS REPRESENTATIFS DECORATION
              StreamBuilder(
                stream: db.collection("newCollectionKeywords").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Aucune image de représentation trouvée");
                  } else {
                    List<dynamic> motCle = [];
                    for (var element in snapshot.data!.docs) {
                      motCle.add(element);
                    }

                    return SizedBox(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: GridView.builder(
                                  itemCount: 6,
                                  shrinkWrap: false,
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 2 / 6,
                                      crossAxisSpacing: 1),
                                  itemBuilder: (context, index) {
                                    final motsCle = motCle[index];
                                    final libelle = motsCle["libelle"];
                                    return SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 11),
                                        child: Container(
                                          height: 10,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20),
                                            color: const Color(0xFF37271F),
                                          ),
                                          child: Center(
                                            child: Text(
                                              libelle, style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                      ),
                                    );
                                  },),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }
              ),


              // MOTS REPRESENTATIFS DECORATION
              StreamBuilder(
                stream: db.collection("newCollectionKeywords").snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("Aucun mot clé trouvé");
                  } else {
                    final List<dynamic> motCle= [];
                    for (var element in snapshot.data!.docs) {
                      motCle.add(element);
                    }

                    return SizedBox(
                      height: 60,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: SizedBox(
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                            ),
                            Container(
                              child: SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width - 60,
                                child: GridView.builder(
                                  itemCount: 6,
                                  shrinkWrap: false,
                                  physics: const ScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 2 / 6,
                                      crossAxisSpacing: 1),
                                  itemBuilder: (context, index) {
                                    final motsCle = motCle[index];
                                    final libelle = motsCle["libelle"];

                                    return SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 11),
                                        child: Container(
                                          height: 10,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20),
                                            color: const Color(0xFF37271F),
                                          ),
                                          child: Center(
                                            child: Text(
                                              libelle, style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          ),
                                        ),
                                      ),
                                    );
                                  },),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }
              ),

              //MEUBLES DE LA COLLECTION
      StreamBuilder(
        stream: db.collection("newCollectionArticles").snapshots(),
        builder: (context, snapshot) {
          final List<dynamic> listeArticle = [];
          if (!snapshot.hasData) {
            return const Text('Aucun article trouvé');
          } else {
            for (var element in snapshot.data!.docs) {
              listeArticle.add(element);
            }

            return Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: SizedBox(
                height: 310,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: SizedBox(
                  child: Column(
                    children: [
                      Container(
                        child: SizedBox(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width - 60,
                          height: 310,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 0.45 / 0.2,
                                crossAxisSpacing: 1),
                            itemBuilder: (context, index) {
                              final listeArticles = listeArticle[index];
                              final urlImage = listeArticles["urlImage"];
                              final libelle = listeArticles["libelle"];
                              final description = listeArticles["description"];
                              final prix = listeArticles["prix"];
                              final nbArticleLot = listeArticles["nbArticleLot"];

                              return SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 140,
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  urlImage)),
                                        ),
                                      ),
                                      Container(
                                        height: 140,
                                        width: 210,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                          color: Color(0xFFDD9B6C),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: Text(libelle,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight
                                                        .bold),),),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(horizontal: 8.0),
                                              child: Text(
                                                  description,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 120.0),
                                              child: Text("$prix€",
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 22,
                                                      fontWeight: FontWeight
                                                          .w800)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 130.0),
                                              child: Text(
                                                "soit ${prix/nbArticleLot}€ par $libelle",
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11),
                                                maxLines: 2,),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }
      ),
            ],
          ),
        ),
        ),
      )
    );
  }
}
