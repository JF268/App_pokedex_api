import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatelessWidget {
  
  //funcion para obtener data de los pokemon
  getDataPokemon() async{
    //Uri: engloba un url(mas extenso)
    //URL: localizador de recurso en el servidor
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    //cualquier peticion a un servicio como tal a internet es asincrono
    http.Response response = await http.get(_uri);
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton( 
          child: Text("Data"), onPressed: (() {
            getDataPokemon();
          }),
        ),
      ),
    );
  }
}