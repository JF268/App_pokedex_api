import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/widgets/item_type_widget.dart';

class ItemPokemonWidget extends StatelessWidget {
 
    String name;
    String image;
    List<String> types;

    ItemPokemonWidget({ required this.name,
     required this.image,
     required this.types});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              Text(name, 
                              style:TextStyle(color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),),

                              Column(
                                children: types.map((e) => ItemTypeWidget(text: e,)).toList(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.network("https://www.serebii.net/pokemongo/pokemon/001.png")),
                      ],
                    ),);
  }
}