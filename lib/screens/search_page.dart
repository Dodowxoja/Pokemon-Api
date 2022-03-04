import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work/models/pokemons_model.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  List<Pokemon> data;
  SearchPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Set<Pokemon> searchedItems = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 53),
          SizedBox(
            height: 88,
            width: 252,
            child: Image.asset('assets/svg/pokemon.png'),
          ),
          const SizedBox(height: 31),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: SvgPicture.asset('assets/svg/back_icon.svg'),
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
              ),
              SizedBox(
                height: 42,
                width: 228,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: "Buscar Pokemons",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0))),
                  onChanged: (v) {
                    searchedItems.clear();
                    for (Pokemon item in widget.data) {
                      if (v.length == 0) {
                        searchedItems.clear();
                        setState(() {});
                      } else if (item.name
                          .toString()
                          .toLowerCase()
                          .contains(v.toString().toLowerCase())) {
                        searchedItems.add(item);
                        setState(() {});
                      }
                    }
                  },
                ),
              ),
              InkWell(
                child: SvgPicture.asset('assets/svg/filter_icon.svg'),
                onTap: () => Navigator.pushReplacementNamed(context, '/'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(21.5),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 67),
                        height: 205,
                        width: 371,
                        decoration: BoxDecoration(
                          color: const Color(0xffFC7CFF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      Container(
                        height: 247,
                        width: 289,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                searchedItems.toList()[index].img.toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#' +
                                  searchedItems.toList()[index].num.toString(),
                              style: const TextStyle(
                                color: Color(0xffFA5AFD),
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              searchedItems.toList()[index].name.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: searchedItems.length,
            ),
          )
        ],
      ),
    );
  }
}

/*
                
searchedItems.toList()[index].img.toString()
*/
