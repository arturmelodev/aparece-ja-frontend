import 'dart:convert';

import 'package:apareceja/components/background_sign_signup.dart';
import 'package:apareceja/utils/user_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String cpf = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "iFound",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "CPF"),
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    cpf = text;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: true,
                  onChanged: (text) {
                    password = text;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    var url = Uri.parse('http://10.0.2.2:3333/authenticate');
                    var response = await http.post(url,
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          "cpf": cpf,
                          "password": password
                        }));
                    if (response.statusCode == 200) {
                      var jsonResponse = jsonDecode(response.body);
                      await UserSecureStorage.setName(
                          jsonResponse["user"]["firstName"]);
                      await UserSecureStorage.setLastName(
                          jsonResponse["user"]["lastName"]);
                      await UserSecureStorage.setCPF(
                          jsonResponse["user"]["cpf"]);
                      await UserSecureStorage.setToken(jsonResponse["token"]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                              firstName: jsonResponse["user"]["firstName"]),
                        ),
                      );
                    } else if (response.statusCode == 400) {
                      var message = response.body;
                      print(message);
                    }
                    var json = jsonDecode(response.body);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Colors.deepPurple,
                          Colors.purple.shade200
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "ENTRAR",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () =>
                      {Navigator.of(context).pushReplacementNamed('/signup')},
                  child: Text(
                    "Não tem uma conta? Registre-se",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('iFound'),
    //   ),
    //   body: SingleChildScrollView(
    //     child: SizedBox(
    //       width: MediaQuery.of(context).size.width,
    //       height: MediaQuery.of(context).size.height,
    //       child: Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             TextField(
    //               onChanged: (text) {
    //                 cpf = text;
    //               },
    //               keyboardType: TextInputType.number,
    //               decoration: const InputDecoration(
    //                   labelText: 'CPF', border: OutlineInputBorder()),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 16.0),
    //               child: TextField(
    //                 onChanged: (text) {
    //                   password = text;
    //                 },
    //                 obscureText: true,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Senha', border: OutlineInputBorder()),
    //               ),
    //             ),
    //             Container(
    //               width: double.infinity,
    //               child: ElevatedButton(
    //                 onPressed: () async {
    //                   var url = Uri.parse('http://10.0.2.2:3333/authenticate');
    //                   var response = await http.post(url,
    //                       headers: <String, String>{
    //                         'Content-Type': 'application/json; charset=UTF-8',
    //                       },
    //                       body: jsonEncode(<String, String>{
    //                         "cpf": cpf,
    //                         "password": password
    //                       }));
    //                   var json = jsonDecode(response.body);
    //                   print(json);
    //                   Navigator.of(context).pushReplacementNamed('/home');
    //                 },
    //                 child: const Text(
    //                   'Entrar',
    //                   style: TextStyle(fontSize: 16),
    //                 ),
    //               ),
    //             ),
    //             TextButton(
    //                 onPressed: () =>
    //                     {Navigator.of(context).pushNamed('/signup')},
    //                 child: Text('Novo por aqui?'))
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
