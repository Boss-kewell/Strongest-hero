import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:strongestheroes/model/superhero_model.dart';

class HeroDetails extends StatefulWidget {
  final SuperHeroModel hero;

  const HeroDetails({super.key, required this.hero});

  @override
  State<HeroDetails> createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            elevation: 0.0,
            title: Text(
              widget.hero?.name ?? 'Invalid Name',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.hero?.images?.lg ?? 'Invalid Image',
                child: CachedNetworkImage(
                  imageUrl: widget.hero?.images?.lg ?? 'Invalid Image',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: Center(
                      child: SpinKitRipple(
                        size: 50,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: Icon(
                      Icons.sentiment_very_dissatisfied,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index > 0) return null;
              return Column(
                children: [
                  PowerStats(hero: widget.hero),
                  Divider(
                    thickness: 1,
                  ),
                  Appearance(hero: widget.hero),
                  Divider(
                    thickness: 1,
                  ),
                  Biography(hero: widget.hero),
                  Divider(
                    thickness: 1,
                  ),
                  Work(hero: widget.hero),
                  Divider(
                    thickness: 1,
                  ),
                  Connections(hero: widget.hero),
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}

class PowerStats extends StatelessWidget {
  final SuperHeroModel hero;

  const PowerStats({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'PowerStats',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      children: <Widget>[
        ListTile(
          title: Text("Intelligence".toUpperCase() +
              " ${hero!.powerstats!.intelligence!}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.intelligence!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Colors.purple,
          ),
        ),
        ListTile(
          title: Text(
              'Strength'.toUpperCase() + "  ${hero!.powerstats!.strength}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.strength!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Colors.green,
          ),
        ),
        ListTile(
          title: Text('Speed'.toUpperCase() + "  ${hero!.powerstats!.speed}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.speed!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Theme.of(context).colorScheme.secondary,
          ),
        ),
        ListTile(
          title: Text('Durability'.toUpperCase()),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.durability!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Colors.red,
          ),
        ),
        ListTile(
          title: Text('Power'.toUpperCase() + "  ${hero!.powerstats!.power}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.power!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Colors.purple,
          ),
        ),
        ListTile(
          title:
              Text('Combat'.toUpperCase() + "  ${hero!.powerstats!.combat}%"),
          subtitle: LinearPercentIndicator(
            animation: true,
            lineHeight: 15.0,
            animationDuration: 2500,
            percent: hero!.powerstats!.combat!.toDouble() / 100.0,
            barRadius: Radius.circular(5),
            progressColor: Colors.amber,
          ),
        ),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  final SuperHeroModel hero;

  const Appearance({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Appearance',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'Gender'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.gender!
          ),
          subtitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        ListTile(
          title: Text(
            'Race'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.race!.toString()
          ),
          subtitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 15,
          ),
        ),
        ListTile(
          title: Text('Height'.toUpperCase()
          ),
          subtitle: Text(hero!.appearance!.height
              .toString()
              .replaceAll("[", "")
              .replaceAll("]", "")
          ),
          subtitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        ListTile(
          title: Text('Hair Color'.toUpperCase()
          ),
          subtitle: Text(hero!.appearance!.hairColor!,
          ),
          subtitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        ListTile(
          title: Text('Eye Color.'.toUpperCase(),
          ),
          subtitle: Text(hero!.appearance!.eyeColor!),
          subtitleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
class Biography extends StatelessWidget {
  final SuperHeroModel hero;

  const Biography({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Biography',
      style: TextStyle(
        fontWeight: FontWeight.bold, 
          fontSize: 35,
      ),
    ),
      children: <Widget> [
        ListTile(
          title: Text('Full Name'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.fullName!
          ),
        ),
        ListTile(
          title: Text(
              "Alter Ego's".toUpperCase()
          ),
          subtitle: Text(hero!.biography!.alterEgos!),
        ),
        ListTile(
          title: Text('Aliases'.toUpperCase()
          ),
          subtitle: Text(hero!.biography!.aliases!
              .toString()
              .replaceAll("[","")
              .replaceAll("]","")
          ),
        ),
        ListTile(
          title: Text('Publisher'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.publisher!),
        ),
        ListTile(
          title: Text('Alignment'.toUpperCase(),
          ),
          subtitle: Text(hero!.biography!.alignment!),
        )
      ],
    );
  }
}

class Work extends StatelessWidget {
  final SuperHeroModel hero;

  const Work({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
            'Work',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
          ),
        ),
      children: <Widget> [
        ListTile(
          title: Text(
            'Occupation'.toUpperCase(),
          ),
          subtitle: Text(hero!.work!.occupation!),
        ),
        ListTile(
          title: Text('Base'.toUpperCase(),
          ),
          subtitle: Text(hero!.work!.base!),
        ),
      ],
    );
  }
}

class Connections extends StatelessWidget {
  final SuperHeroModel hero;

  const Connections({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: Text(
          'Connections',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
          ),
        ),
      children: <Widget> [
        ListTile(
          title: Text(
            'Group Affiliation'.toUpperCase(),
          ),
          subtitle: Text(hero!.connections!.groupAffiliation!),
        ),
        ListTile(title: Text('Relatives'.toUpperCase(),
        ),
          subtitle: Text(hero!.connections!.relatives!),
        ),
      ],
    );
  }
}



