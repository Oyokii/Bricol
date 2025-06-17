import 'package:bricol/Screens/connexion_page.dart';
import 'package:bricol/Screens/home_page.dart';
import 'package:bricol/Services/authentication.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final AuthenticationService _auth = AuthenticationService();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController nom = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/homePage': (context) => const HomePage(),
        '/connexionPage': (context) => const ConnexionPage(),
      },
      home: Builder(
          builder: (context) {
            return Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0x0fffffff), image: DecorationImage(image: AssetImage('assets/bg2.png'), opacity: 0.9)),
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
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text("Prénom", textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            TextField(
                              controller: prenom,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(hoverColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none), fillColor: Colors.white, filled: true),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                Text("Nom", textAlign: TextAlign.start, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                              ],
                            ),
                            TextField(
                              controller: nom,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(hoverColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(40), borderSide: BorderSide.none), fillColor: Colors.white, filled: true),
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            TextButton(
                                onPressed: () async {
                                  var email = this.email.value.text;
                                  var password = this.password.value.text;
                                  return await _auth.RegisterWithEmailAndPassword(email, password);
                                },
                                style: const ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                                  fixedSize: WidgetStatePropertyAll(Size(400, 60)),
                                ),
                                child: const Text(
                                  "S'inscrire",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Vous avez déja un compte ?'),
                                const SizedBox(width: 3,),
                                TextButton(onPressed: (){
                                  Navigator.pushNamed(context, "/connexionPage");
                                }, child: const Text('Connectez-vous', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),)),
                              ],
                            ),
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
