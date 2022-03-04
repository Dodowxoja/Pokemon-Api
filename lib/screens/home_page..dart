import 'package:work/models/pokemons_model.dart';
import 'package:work/services/pokemons_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: PokemonsService.getData(),
        builder: (context, AsyncSnapshot<PokemonsModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Text("ERROR");
          } else {
            return Column(
              children: [
                const SizedBox(height: 53),
                SizedBox(
                  height: 88,
                  width: 252,
                  child: Image.asset('assets/svg/pokemon.png'),
                ),
                const SizedBox(height: 31),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Buscar Pokemons",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/search',
                      arguments: snapshot.data!.pokemon,
                    );
                  },
                ),
                const SizedBox(height: 31),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 160,
                    ),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: MediaQuery.of(context).size.width * 0.45,
                            margin: const EdgeInsets.only(left: 10, top: 18),
                            decoration: BoxDecoration(
                              color: const Color(0xffFC7CFF),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              snapshot.data!.pokemon![index].img.toString(),
                              alignment: const Alignment(0.1, -2),
                              height: MediaQuery.of(context).size.height * 0.28,
                              width: MediaQuery.of(context).size.width * 0.28,
                            ),
                          ),
                          Positioned(
                            top: 105,
                            left: 30,
                            child: Container(
                              height: 30,
                              width: 147,
                              decoration: BoxDecoration(
                                color: const Color(0xFF676767),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "#" +
                                        snapshot.data!.pokemon![index].num
                                            .toString(),
                                    style: const TextStyle(
                                      color: Color(0xFFF993FB),
                                    ),
                                  ),
                                  Text(
                                    snapshot.data!.pokemon![index].name
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                    overflow: TextOverflow.clip,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                    itemCount: snapshot.data!.pokemon!.length,
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
