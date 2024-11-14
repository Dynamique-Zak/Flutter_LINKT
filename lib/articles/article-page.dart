import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_redwire/auth-context.dart';

import '../app-dialog-helpers.dart';

class ArticlePage extends StatelessWidget {

  void onSubmit(BuildContext context) async {
    // Afficher ecran de chargement
    AppDialogHelper.showProgressDialog(context, "Tentative d'accès à la page...");

    // Simuler 1 seconde d'attente
    await Future.delayed(Duration(seconds: 1));

    // Appeler l'api
    // -- envoyer le token dans le header
    // Le header application/json
    final headers = {
      'Content-Type': 'application/json',
      'Authorization' : 'Bearer ${AuthContext.token}'
    };

    // Appeler l'api
    var responseHttp = await http.get(Uri.parse("http://127.0.0.1:3000/auth/check"),
        headers: headers);

    // Récupérer la rep http en json
    var responseBodyJson = convert.jsonDecode(responseHttp.body);

    // Fermer ecran de chargement
    AppDialogHelper.closeProgressDialog();

    if (responseBodyJson['code'] == "200"){
      print("TODO : Afficher la liste des articles");
    }
    else {
      Navigator.pushNamed(context, "/");
    }

    // est-ce que on a le droit d'avoir l'info
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text("Voici les articles "),
          ElevatedButton(onPressed: () { onSubmit(context); }, child :Text("Verifier connecté)"))
        ],
      ),
    );
  }
}
