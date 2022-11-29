import 'package:flutter/material.dart';

class ItemPokemonWidget extends StatelessWidget {
 
    String name;
    String image;

    ItemPokemonWidget({ required this.name, required this.image});

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