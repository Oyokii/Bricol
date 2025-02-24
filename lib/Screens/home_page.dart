import 'package:bricol/Screens/detail_page_sauvegarde.dart';
import 'package:bricol/Services/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;

    final  double width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
            stream: db.collection("articles").snapshots(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return const Text("chargement de la page");
              }
              List<dynamic> articlesFavoris = [];
              snapshot.data!.docs.forEach((element) {
                articlesFavoris.add(element);
              });
              return MediaQuery(
                data: MediaQueryData(
                  size: MediaQuery.sizeOf(context),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  child: Column(
                    children: [
                      Container(height: 563, decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/bg_nvl_clt.jpg'))),
                        child: const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:50.0, left: 40, right: 40),
                              child: SearchBar(
                                backgroundColor: WidgetStatePropertyAll(Colors.white),
                                leading: Icon(CupertinoIcons.search, color: Colors.black, size: 20,),
                              ),
                            ),
                            SizedBox(height: 287),
                            Padding(
                              padding: EdgeInsets.only(right: 50.0),
                              child: Text("NOUVELLE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 180,),
                                Text("COLLECTION", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 3),
                              child: Column(
                                children: [
                                  Text('L\'été approche!', style: TextStyle(fontSize: 13, color: Colors.white), textAlign: TextAlign.right,),
                                  Text('Ils serait temps d\'apporter de la vie à votre extérieur', style: TextStyle(fontSize: 15, color: Colors.white), textAlign: TextAlign.right),
                                ],
                              ),
                            ),
                          ],
                        ),),

                      //NOS ARTICLES ====================================
                      itemGrid(width),

                      //CODE PROMO ==============================================
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          width: width,
                          height: 50,
                          color: const Color(0xFF6BB41A),
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,

                            physics: const ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const Padding(padding: EdgeInsets.all(10),
                                child: Text("CODE PROMO : NewSeason24", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                              );
                            },
                          ),
                        ),
                      ),

                      //MEILLEURES VENTES
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top:8, left: 20),
                          child: Text("Nos meilleures ventes", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23), textAlign: TextAlign.left,),
                        ),
                      ),
                      Container(
                        height: 800,
                        width: width,
                        padding: const EdgeInsets.all(20),
                        child: GridView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            final articlefavori = articlesFavoris[index];
                            final urlImage = articlefavori["urlImage"];
                            final libelle = articlefavori["libelle"];
                            final description = articlefavori["description"];
                            final famille = articlefavori["famille"];
                            final prix = articlefavori["prix"];
                            final List<dynamic> materiaux = List<String>.from(articlefavori['materiaux'] as List);
                            final favori = articlefavori["articleFavori"];
                            List<dynamic> listImages = List<String>.from(articlefavori['listImages'] as List);
                            return SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    height: 180,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: NetworkImage(/*"assets/table2.jpeg"*/urlImage))
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children:
                                        //BOUTON PAGE DETAILS ET PANIER
                                        [
                                          IconButton(
                                            icon: const Icon(CupertinoIcons.plus, color: Colors.black, size: 25), color: Colors.green, hoverColor: Colors.black, style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white), minimumSize: WidgetStatePropertyAll(Size(60, 40)), maximumSize: WidgetStatePropertyAll(Size(100, 40))),
                                            onPressed: () {
                                              setState(() {
                                                Services services = Services();
                                                services.RecupererDonneesArticles(libelle);
                                                print("Voici la liste des images : $listImages");
                                                if(listImages.isNotEmpty){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DetailPage(libelle,
                                                      description,
                                                      urlImage,
                                                      famille,
                                                      prix,
                                                      favori,
                                                      materiaux,
                                                      listImages: listImages,)),
                                                  );
                                                }if(listImages.isEmpty){
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => DetailPage(libelle,
                                                      description,
                                                      urlImage,
                                                      famille,
                                                      prix,
                                                      favori,
                                                      materiaux,)),
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                          IconButton(
                                            onPressed: (){
                                              print("Ajouté au panier");
                                            }, icon: const Icon(CupertinoIcons.cart_badge_plus, color: Colors.black, size: 25), color: Colors.white, hoverColor: Colors.black, style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white), minimumSize: WidgetStatePropertyAll(Size(60, 40)), maximumSize: WidgetStatePropertyAll(Size(100, 40))),
                                          ),
                                        ]),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )

                    ],
                  ),
                ),);
            }
        ),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Tips'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profiler'),
        ],),
      ),
    );
  }

  Widget itemGrid(double width) {
    final db = FirebaseFirestore.instance;
    const int count = 4;
    const int itemsPerRow =2;
    const double ratio = 1 / 1;
    const double horizontalPadding = 0;
    final double calcHeight = ((width / itemsPerRow) - (horizontalPadding)) *
        (count / itemsPerRow).ceil() *
        (1 / ratio);
    return StreamBuilder(
        stream: db.collection("typesArticles").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData!){
            return const Text("Attention aucune famille trouvée");
          }else{
            List<dynamic> familleArticle = [];
            snapshot.data!.docs.forEach((element) {familleArticle.add(element);});
            return Column(
              children: [
                Container(
                    color: const Color(0xFFB87C52),
                    width: width,
                    height: 40,
                    child:const Padding(padding: EdgeInsets.only(top:8, left: 20), child: Text("Nos articles", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 23),))
                ),
                Container(
                  color: const Color(0xFFB87C52),
                  width: width,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                        itemCount: count,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: false,
                        itemBuilder: (context, index) {
                          final familleArticles = familleArticle[index];
                          final libelle = familleArticles["libelle"];
                          final urlImage = familleArticles["urlImage"];

                          return SizedBox(
                            height: 180,
                            width: 200,
                            child: Column(
                              children: [
                                Container(
                                  width:180,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(image: NetworkImage(urlImage), fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Text(
                                    "${libelle}",
                                    maxLines: 1,
                                    style:
                                    const TextStyle(fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        }
    );
  }

  void openDetail(dynamic libelle, dynamic description, dynamic urlImage, dynamic famille, dynamic prix, dynamic favori, dynamic materiaux,){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(libelle, description, urlImage, famille, prix, favori, materiaux)));
  }
}

