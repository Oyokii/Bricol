import 'package:bricol/Services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatelessWidget {
  final dynamic? libelle;
  final dynamic? description;
  final dynamic? urlImage;
  final List<dynamic>? listImages;
  final dynamic? famille;
  final dynamic? prix;
  final List<dynamic>? materiaux;
  final dynamic? favori;

  DetailPage(this.libelle, this.description, this.urlImage, this.famille,
      this.prix, this.favori, this.materiaux,
      {super.key, this.listImages});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    //print("J'ai réussi à prendre les valeurs de listImages ${listImages?.length}");
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFD2D2D2)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Builder(builder: (context) {
          return Container(
              height: screenHeight*0.55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(urlImage), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(193))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      top: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.keyboard_return)),),
                    Container(
                      width: screenWidth*0.6,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          libelle,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    // Container(
                    //   width: 200,
                    //   height: 400,
                    //   child: listImages != null ?
                    //       Container(
                    //         child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemCount: listImages?.length, physics: NeverScrollableScrollPhysics(), scrollDirection: Axis.vertical, itemBuilder: (context, index) {
                    //           Padding(
                    //             padding: const EdgeInsets.only(
                    //                 bottom: 5.0, left: 10),
                    //             child: Container(
                    //               foregroundDecoration: BoxDecoration(
                    //                 color: Colors.red,
                    //                   image: DecorationImage(
                    //                       image:
                    //                       AssetImage("assets/chaiseDetail2.png")
                    //                       //NetworkImage(listImages?[index])
                    //                   ),
                    //                   border: Border.all(
                    //                       color: Colors.white, width: 3)),
                    //               height: 100,
                    //               width: 100,
                    //               color: Colors.red,
                    //             ),
                    //           );
                    //         },),
                    //       ): null,
                    // ),

                    // Container(
                    //   child: (listImages != null) ? Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 20.0, left: 10),
                    //         child: Container(
                    //           height: 80,
                    //           width: 80,
                    //           decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: listImages?[0]!.isNotEmpty ?
                    //                   NetworkImage(
                    //                       listImages?[0]): const AssetImage("")),
                    //               border: Border.all(
                    //                   color: Colors.white, width: 3)),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 20.0, left: 10),
                    //         child: Container(
                    //           height: 80,
                    //           width: 80,
                    //           decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: listImages?[1]!.isNotEmpty ?
                    //                   NetworkImage(
                    //                       listImages?[1]): const AssetImage("")),
                    //               border: Border.all(
                    //                   color: Colors.white, width: 3)),
                    //         ),
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 20.0, left: 10),
                    //         child: Container(
                    //           height: 80,
                    //           width: 80,
                    //           decoration: BoxDecoration(
                    //               image: DecorationImage(
                    //                   image: listImages?[2]!.isNotEmpty ?
                    //                   NetworkImage(
                    //                       listImages?[2]): const AssetImage("")),
                    //               border: Border.all(
                    //                   color: Colors.white, width: 3)),
                    //         ),
                    //       ),
                    //     ],
                    //   ) : const Text("")
                    // ),

                    Container(
                        child: (listImages != null)
                            ? Column(
                                children: [
                                  listImages?[0]!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 10),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        listImages?[0])),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3)),
                                          ),
                                        )
                                      : Text(""),
                                  listImages?[1]!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 10),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        listImages?[1])),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3)),
                                          ),
                                        )
                                      : Text(""),
                                  listImages?[2]!.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 10),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        listImages?[2])),
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 3)),
                                          ),
                                        )
                                      : Text(""),
                                ],
                              )
                            : const Text("")),
                  ]));
        }),
        Column(children: [
          Container(
            height: screenHeight - 500,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Positioned(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: screenWidth*0.65,
                        height: screenHeight*0.2,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 7.0, top: 20),
                              child: Text(
                                description,
                                softWrap: true,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w100),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Icon(Icons.add),
                                Text(
                                  materiaux?[0],
                                  //"Bois d'acajou",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.add),
                                Text(
                                  materiaux?[1],
                                  //"Coussin relaxant haute qualité",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                      decorationStyle:
                                          TextDecorationStyle.double),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.add),
                                Text(materiaux?[2],
                                    //"Tissus verts",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.add),
                                Text(materiaux?[2],
                                    //"Matériaux recyclés",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Positioned(
                      right: 0,
                      child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Container(
                        height: screenHeight*0.1,
                        width: screenWidth*0.26,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_half_outlined,
                                color: Colors.yellowAccent,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "4.3/5",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),)
                  ],
                ),
              ),

              //QUANTITE ET PRIX
              Positioned(
                top: 150,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 13.0),
                          child: Container(
                            height: screenHeight*0.07,
                            width: screenHeight*0.5,
                            decoration: const BoxDecoration(
                                color: Color(0xFF335D48),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5, bottom: 50),
                              child: Text(
                                "Quantité : 3",
                                textWidthBasis: TextWidthBasis.longestLine,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width:screenWidth*0.1,
                        ),
                        Container(
                          height: screenHeight*0.15,
                          width: screenWidth*0.4,
                          decoration: const BoxDecoration(
                              color: Color(0xFFC0A25A),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20))),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 20),
                              child: Column(
                                children: [
                                  Text(
                                    '$prix €',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 66,
                                      ),
                                      Text(
                                        "$prix€",
                                        style: TextStyle(
                                            color: Colors.red.withOpacity(0.7),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              //CART
              Positioned(
                  bottom: 22,
                  left: 190,
                  // top: 218,
                  child: TextButton(
                    onPressed: () => StripeService.instance.makePayment(prix),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Container(
                        height: screenHeight *0.17,
                        width: screenWidth*0.18,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: const Text("PAYER",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            textAlign: TextAlign.center,
                            softWrap: true),
                      ),
                    ),
                  ))

              // Positioned(
              //     top: 220,
              //     left: 200,
              //     child: ElevatedButton(
              //       style: ButtonStyle(
              //         shape: WidgetStatePropertyAll(
              //
              //         )
              //       ),
              //       onPressed: (){
              //         print("Ajouté au panier");
              //       }, child: Padding(
              //       padding: const EdgeInsets.only(bottom: 0),
              //       child: Container(
              //         height: 150,
              //         width: 60,
              //         decoration: const BoxDecoration(
              //           color: Colors.black,
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(15),
              //               topLeft: Radius.circular(15)),
              //         ),
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 19),
              //         child:  Text("PANIER",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 20),
              //             textAlign: TextAlign.center,
              //             softWrap: true),
              //       ),
              //     ),)
              // ),
            ]),
          )
        ]),
      ]),
    );
  }
}
