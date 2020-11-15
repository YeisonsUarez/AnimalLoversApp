import 'package:carouserl_inicio/components/item_animal_widget.dart';
import 'package:carouserl_inicio/models/animal.dart';
import 'package:carouserl_inicio/screens/home/addAnimalScreen.dart';
import 'package:carouserl_inicio/settings/constants.dart';
import 'package:carouserl_inicio/settings/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'configuration.dart';
import 'animalDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  List<Animal> animales = [];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddAnimal.routeName);
          },
          child: Icon(
            Icons.pets,
            color: kPrimaryColor,
            size: 40.0,
          ),
          backgroundColor: Colors.orange[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                xOffset = 0;
                                yOffset = 0;
                                scaleFactor = 1;
                                isDrawerOpen = false;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios),
                                Text("volver")
                              ],
                            ),
                          )
                        : IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset = 230;
                                yOffset = 150;
                                scaleFactor = 0.6;
                                isDrawerOpen = true;
                              });
                            }),
                    Column(
                      children: [
                        Text('Ciudad'),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: primaryGreen,
                            ),
                            Text('Bucaramanga'),
                          ],
                        ),
                      ],
                    ),
                    ClipOval(
                        child: Image.network(
                      "https://scontent.fbga1-4.fna.fbcdn.net/v/t1.0-9/107255257_3057926057624057_8699687802890458276_o.jpg?_nc_cat=107&ccb=2&_nc_sid=84a396&_nc_ohc=a8Lkldkdp44AX8xetcM&_nc_ht=scontent.fbga1-4.fna&oh=9b0c282e1b0b24ab5aec52cec10489b3&oe=5FC8CB63",
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0,
                    ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.pets),
                    Text('Seleciona un animalito\n para más información'),
                    Icon(Icons.check)
                  ],
                ),
              ),
              Container(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadowList,
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.asset(
                              categories[index]['iconPath'],
                              height: 50,
                              width: 50,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(categories[index]['name'])
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Container(
                    height: getProportionateScreenHeight(450.0),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: _pintarItems(animals),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _pintarItems(List<Animal> animales) {
    List<Widget> widgets = [];
    animales.forEach((element) {
      widgets.add(ItemAnimal(
        animal: element,
      ));
    });
    return widgets;
  }
}
