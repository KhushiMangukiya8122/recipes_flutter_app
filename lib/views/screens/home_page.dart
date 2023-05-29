import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/recipes_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  List<recipes> recipe = [];

  Future<void> loadJSON() async {
    data = await rootBundle.loadString("assets/recipes.json");

    setState(() {
      List decodeList = jsonDecode(data!);

      recipe = decodeList.map((e) => recipes.fromMap(data: e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes App"),
      ),
      body: (recipe.isEmpty)
          ? Container(
        child: Text("No data Available"),
      )
          : ListView.builder(
            itemCount: recipe.length,
            itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    radius: 60,
                    foregroundImage: NetworkImage("${recipe[i].imageURL}"),
                  ),
                  title: Text("${recipe[i].name}"),
                  subtitle: Text("${recipe[i].steps}")
                ),
                SizedBox(
                  height:10,
                ),
              ],
            ),
          ),
    );
  }
}



// {
// "name": "Old-Fashioned Oatmeal Cookies",
// "steps": [
// "Simmer raisins and water over medium heat until raisins are plump, about 15 minutes.",
// "Drain raisins, reserving the liquid.",
// "Add enough water to reserved liquid to measure 1/2 cup.",
// "Heat oven to 400°.",
// "Mix thoroughly shortening, sugar, eggs and vanilla.",
// "Stir in reserved liquid.",
// "Blend in remaining ingredients.",
// "Drop dough by rounded teaspoonfuls about 2 inches apart onto ungreased baking sheet.",
// "Bake 8 to 10 minutes or until light brown.",
// "About 6 1/2 dozen cookies."
// ],
// "imageURL": "http://s3.amazonaws.com/gmi-digital-library/65caecf7-a8f7-4a09-8513-2659cf92871e.jpg"
// },
//
// {
// "name": "Blueberry Oatmeal Squares",
// "steps": [
// "Filling: In saucepan, bring blueberries, sugar and orange juice to boil; reduce heat and simmer until tender, about 10 minutes.",
// "Whisk cornstarch with 2 tbsp (25 mL) water; whisk into blueberries and boil, stirring, until thickened, about 1 minute.",
// "Place plastic wrap directly on surface; refrigerate until cooled, about 1 hour.",
// "In large bowl, whisk together oats, flour, sugar, orange rind and salt ; with pastry blender, cut in butter until in coarse crumbs.",
// "Press half into 8-inch (2 L) square parchment paper–lined metal cake pan; spread with blueberry filling.",
// "Bake in centre of 350°F oven until light golden, about 45 minutes.",
// "Let cool on rack before cutting into squares.",
// "(Make-ahead: Cover and refrigerate for up to 2 days or overwrap with heavy-duty foil and freeze for up to 2 weeks.)"
// ],
// "imageURL": "http://www.canadianliving.com/img/photos/biz/blueberry-oatmeal-squares5801359401371.jpg"
// },
//
// {
// "name": "Curried chicken salad",
// "steps": [
// "ARRANGE chicken in a single layer in a large pot.",
// "Add water to just cover.",
// "Bring to a boil over medium-high.",
// "Flip chicken, reduce heat to medium and simmer until cooked, about 6 more min.",
// "Cool.",
// "STIR mayo with lemon zest, juice, curry and salt in large bowl.",
// "Using 2 forks, shred chicken, then stir into mayo mixture with mango, cranberries, green onions and celery.",
// "Divide among muffins with lettuce leaves",
// "Sandwich with tops"
// ],
// "imageURL": "http://www.chatelaine.com/wp-content/uploads/2013/05/Curried-chicken-salad.jpg"
// }