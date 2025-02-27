import 'package:bricol/Screens/create_account_page.dart';
import 'package:bricol/Screens/home_page.dart';
import 'package:bricol/Services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/homePage': (context) => const HomePage(),
        '/createAccountPage': (context) => const CreateAccountPage()
      },
      home: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                //decoration: const BoxDecoration(color: Color(0xFFFFC772), image: DecorationImage(image: AssetImage('assets/bg.jpg'), opacity: 0.3)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Image(image: AssetImage("assets/Logo.png"), width: 200,),
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                Text("Email", textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            TextField(
                              controller: email,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(hoverColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none), fillColor: Colors.white, filled: true),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text("Password", textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            TextField(
                              controller: password,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(hoverColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none), fillColor: Colors.white, filled: true),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            TextButton(
                                onPressed: () {
                                  if( email != null && password != null){
                                    _auth.signInWithEmailAndPassword(email.value.text, password.value.text).onError((error, stackTrace) => print("Une erreur a été rencontrée lors de l'authentification"),);
                                    
                                    Navigator.pushNamed(context, "/homePage");
                                                                    }
                                },
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                                  fixedSize: WidgetStatePropertyAll(Size(400, 60)),
                                ),
                                child: const Text(
                                  "Se connecter",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text('Vous n\'avez pas de compte ?'),
                                const SizedBox(width: 3,),
                                TextButton(onPressed: (){
                                  Navigator.pushNamed(context, "/createAccountPage");
                                }, child: const Text('Inscrivez-vous', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),)),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            /*Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: GridView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                semanticChildCount: 1,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: 9/16, crossAxisSpacing: 30, mainAxisExtent: 80, mainAxisSpacing: 20), itemBuilder: (context, index) {
                                return Container(
                                    child: ElevatedButton(onPressed: (){}, child: Image.asset("assets/google.png")));
                              },),
                            )*/
                          ],
                        )
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
