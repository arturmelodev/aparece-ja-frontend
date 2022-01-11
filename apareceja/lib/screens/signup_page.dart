import 'dart:convert';

import 'package:apareceja/components/background_sign_signup.dart';
import 'package:apareceja/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String firstName = '';
  String lastName = '';
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
                  "REGISTRAR",
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
                  decoration: InputDecoration(labelText: "Nome"),
                  onChanged: (text) {
                    firstName = text;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "Sobrenome"),
                  onChanged: (text) {
                    lastName = text;
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "CPF"),
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
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    var url = Uri.parse("http://10.0.2.2:3333/user");
                    var response = await http.post(url,
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8'
                        },
                        body: jsonEncode(<String, String>{
                          "firstName": firstName,
                          "lastName": lastName,
                          "cpf": cpf,
                          "password": password,
                        }));

                    if (response.statusCode == 200) {
                    } else if (response.statusCode == 400) {}
                    Fluttertoast.showToast(msg: 'Usuário registrado.');
                    Navigator.of(context).pushReplacementNamed('/home');
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
                      "REGISTRAR",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: GestureDetector(
                  onTap: () =>
                      {Navigator.of(context).pushReplacementNamed('/')},
                  child: Text(
                    "Já tem uma conta? Fazer login",
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
    //     title: const Text('Registrar'),
    //   ),
    //   body: SingleChildScrollView(
    //     child: SizedBox(
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         child: Padding(
    //           padding: const EdgeInsets.all(16.0),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               TextField(
    //                 keyboardType: TextInputType.text,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Nome', border: OutlineInputBorder()),
    //                 onChanged: (text) {
    //                   firstName = text;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               TextField(
    //                 keyboardType: TextInputType.text,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Sobrenome', border: OutlineInputBorder()),
    //                 onChanged: (text) {
    //                   lastName = text;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               TextField(
    //                 keyboardType: TextInputType.text,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Email', border: OutlineInputBorder()),
    //                 onChanged: (text) {
    //                   email = text;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               TextField(
    //                 keyboardType: TextInputType.number,
    //                 decoration: const InputDecoration(
    //                     labelText: 'CPF', border: OutlineInputBorder()),
    //                 onChanged: (text) {
    //                   cpf = text;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               TextField(
    //                 keyboardType: TextInputType.text,
    //                 obscureText: true,
    //                 decoration: const InputDecoration(
    //                     labelText: 'Senha', border: OutlineInputBorder()),
    //                 onChanged: (text) {
    //                   password = text;
    //                 },
    //               ),
    //               const SizedBox(
    //                 height: 16,
    //               ),
    //               Container(
    //                 width: double.infinity,
    //                 child: ElevatedButton(
    //                   style: ButtonStyle(
    //                       shape:
    //                           MaterialStateProperty.all<RoundedRectangleBorder>(
    //                               RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.circular(8.0),
    //                   ))),
    //                   onPressed: () {
    //                     Fluttertoast.showToast(msg: 'Usuário registrado.');
    //                     Navigator.of(context).pushReplacementNamed('/home');
    //                   },
    //                   child: const Text('Registrar'),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         )),
    //   ),
    // );
  }
}
