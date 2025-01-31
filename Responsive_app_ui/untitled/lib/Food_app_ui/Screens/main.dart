import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Helper_widgets/dishe_container.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> foodNames = [
    'Rice Bowl',
    'Biryani',
    'Pizza',
    'Bakery & Cake',
    'Pasta',
    'Mendu vada',
    'Idli',
    'Samosa'
  ];
  String selectedFood = 'Rice Bowl';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // appbar part
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.051,
                    top: screenHeight * 0.031,
                    right: screenWidth * 0.051),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.align_horizontal_left_outlined,color: Colors.black,),
                    FilledButton.tonalIcon(
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Color(0xfff5fafa)),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.065,
                              vertical: screenHeight * 0.02))),
                      icon: Icon(
                        Icons.search,
                        size: screenWidth * 0.07,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                      label: Text(
                        'Try Biryani',
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.grey.shade500),
                      ),
                    ),
                  ],
                ),
              ),
          
              // headline title
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.051, top: screenWidth * 0.075),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.068,
                        letterSpacing: screenWidth * 0.001),
                    text: 'Homemade',
                    children: [
                      TextSpan(
                        text: ' Food',
                        style: TextStyle(
                            fontSize: screenWidth * 0.068,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          
              //categories
              Padding(
                padding:  EdgeInsets.only(left: screenWidth * 0.051, top: screenWidth * 0.089),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: foodNames.map(
                      (e) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedFood = e;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: screenWidth * 0.04),
                            child: Column(
                              children: [
                                Text(
                                  e,
                                  style: TextStyle(
                                      color: (selectedFood == e)
                                          ? Colors.black
                                          : Colors.black45,
                                      fontSize: screenWidth * 0.038),
          
                                ),
                                Container(
                                  height: screenHeight * 0.019,
                                  width: screenWidth * 0.019,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (selectedFood == e) ? Colors.red.shade700 : Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
          
              //first row of dishes
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.051,top: screenHeight * 0.14),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/paratha_food.png.png',), //assets/images/cleaned_food_2.png
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.00',disheName: 'Chicken',disheSubName: 'rice bowl',dishRating: 4.6,color: Color(0xfff6c6bd),imagePath: 'assets/images/dhosa_food.png.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/yellow_food.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.00',disheName: 'Chicken',disheSubName: 'rice bowl',dishRating: 4.6,color: Color(0xfff6c6bd),imagePath: 'assets/images/dhosa_food.png.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/paratha_food.png.png',), //assets/images/cleaned_food_2.png
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/yellow_food.png',),
                      ),
                    ],
                  ),
                ),
              ),
          
              //popular recently
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.051,top: screenHeight * 0.06),
                child: Text('Popular this week',style: TextStyle(fontSize: screenWidth * 0.05,color: Colors.black,),),
              ),
          
              //last row of dishes
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.051,top: screenHeight * 0.13,bottom: screenHeight * 0.04),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/paratha_food.png.png',), //assets/images/cleaned_food_2.png
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.00',disheName: 'Chicken',disheSubName: 'rice bowl',dishRating: 4.6,color: Color(0xfff6c6bd),imagePath: 'assets/images/dhosa_food.png.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/yellow_food.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.00',disheName: 'Chicken',disheSubName: 'rice bowl',dishRating: 4.6,color: Color(0xfff6c6bd),imagePath: 'assets/images/dhosa_food.png.png',),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/paratha_food.png.png',), //assets/images/cleaned_food_2.png
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.045),
                        child: DisheContainer(price: r'$ 5.99',disheName: 'Special',disheSubName: 'rice bowl',dishRating: 4.7,imagePath: 'assets/images/yellow_food.png',),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


