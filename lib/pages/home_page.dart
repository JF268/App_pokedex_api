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
                  shrinkWrap: true,
                  mainAxisSpacing: 12.2,
                  crossAxisSpacing: 12.2,
                  childAspectRatio: 1.35,
                  crossAxisCount: 2,
                  children: [
                    Container(
                    decoration: BoxDecoration(color: Color(0xff4CCFB2),
                    borderRadius: BorderRadius.circular(18.0)),
                    child: Stack( 
                      children: [
                        Positioned(
                          bottom: -14,
                          right: -25,
                          child: Image.asset('assets/images/pokeball.png',
                          height: 120,
                          color:Colors.white.withOpacity(0.27)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [ 
                              Text("Bolbasaur", 
                              style:TextStyle(color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 6.0),
                                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.27),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(color: Colors.black.withOpacity(0.04),
                                    offset: Offset(4,4),
                                    blurRadius: 12.0)
                                  ]
                                ),
                                child: Text("Grass",
                                style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.network("https://www.serebii.net/pokemongo/pokemon/001.png")),
                      ],
                    ),),
                  ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}