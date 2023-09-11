import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:strongestheroes/model/superhero_model.dart';
import 'package:strongestheroes/pages/descrption.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'https://akabab.github.io/superhero-api/api/all.json';
  List superhero = [];
  bool loading = false;

  fetchSuperHeroes() async {
    setState(() {
      loading = true;
    });
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          superhero = jsonDecode(response.body);
        });
        setState(() {
          loading = false;
        });
      } else {
        throw Exception('Failed to Load');
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e);
    }
  }

  @override
  void initState() {
    fetchSuperHeroes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: const Text(
          'SuperHeroes And Villains',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GridView.builder(
                  itemCount: superhero.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.8 / 2.3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    SuperHeroModel hero =
                        SuperHeroModel.fromJson(superhero[index]);
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HeroDetails(
                                  hero: hero,
                            ),
                            ),
                            );
                          },
                          child: Hero(
                            tag: '',
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: hero.images?.lg ?? "",
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          )
                                        ]
                                      ),
                                    ),
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                          child: Icon(
                                        Icons.sentiment_very_dissatisfied,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          hero.name ?? "Invalid Name ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    );
                  }),
            ),
    );
  }
}
