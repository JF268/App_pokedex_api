import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/ui/widgets/item_pokemon_widget.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pokemons = [];
  @override
  initState(){
    super.initState();
    getDataPokemon();
  }

  //funcion para obtener data de los pokemon
  getDataPokemon() async{
    //Uri: engloba un url(mas extenso)
    //URL: localizador de recurso en el servidor
    Uri _uri = Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    //cualquier peticion a un servicio como tal a internet es asincrono
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> myMap = json.decode(response.body);
      pokemons = myMap["pokemon"];
      setState(() {
        
      });
      //pokemons.forEach((element) {print(element["name"]);});
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView( 
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column( 
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12.0,),
                const Text("Pokedex", style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),),
                  SizedBox(height: 30.0,),
                  GridView.count(
                    physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 12.2,
                  crossAxisSpacing: 12.2,
                  childAspectRatio: 1.35,
                  crossAxisCount: 2,
                  children: pokemons.map((e) => ItemPokemonWidget(
                    name: e["name"],
                    image: e["img"],
                    types: List<String>.from(e["type"].map((item)=>item)),
                  )).toList()            
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}