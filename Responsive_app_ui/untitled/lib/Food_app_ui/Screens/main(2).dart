import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Lock to portrait mode
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // dealing with big dishe here
              Container(
                height: screenWidth * 0.80, // screenHeight * 0.47
                width: screenWidth,
                child: Stack(
                  children: [
                    Positioned(
                      left: 22,
                      top: 42,
                      child: Icon(
                        Icons.arrow_back,
                        size: screenWidth * 0.07,
                      ),
                    ),
                    Positioned(
                      right: -200,
                      top: -210,
                      child: Card(
                        shape: CircleBorder(),
                        elevation: 10.0,
                        child: Image(
                          image:
                              AssetImage('assets/images/paratha_food.png.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // rest part
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.065, right: screenWidth * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Chicken',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: screenWidth * 0.07),
                            children: [
                              TextSpan(
                                  text: ' rice bowl',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 0.0145,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.042,
                            ),
                            SizedBox(
                              width: screenWidth * 0.004,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.042,
                            ),
                            SizedBox(
                              width: screenWidth * 0.004,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.042,
                            ),
                            SizedBox(
                              width: screenWidth * 0.004,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.042,
                            ),
                            SizedBox(
                              width: screenWidth * 0.004,
                            ),
                            Icon(
                              Icons.star,
                              size: screenWidth * 0.042,
                              color: Colors.grey.shade500,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Text(
                              '4.6/5.0',
                              style: TextStyle(fontSize: screenWidth * 0.038),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: screenWidth * 0.083,
                      backgroundColor: Color(0xff8686af),
                      child: Text(
                        r'$ 4.99',
                        // '\$$price',
                        style: TextStyle(
                            color: Colors.white, fontSize: screenWidth * 0.045),
                      ),
                    )
                  ],
                ),
              ),

              // informations
              Divider(
                height: screenHeight * 0.06,
                indent: screenWidth * 0.075,
                endIndent: screenWidth * 0.099,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.065, right: screenWidth * 0.1),
                child: Text(
                  'A classic blend of cheddar and jack cheeses, cream and elbow macarani nicely blended in bowl handay squid rings lightly battered  served with.',
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),

              // ingredients
              Divider(
                height: screenHeight * 0.06,
                indent: screenWidth * 0.075,
                endIndent: screenWidth * 0.099,
              ),
              Text(
                'Ingredients',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.065, right: screenWidth * 0.1,bottom: screenHeight * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Zucchini noddle'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Basil posta and garlic'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Grilled chicken'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Mushrooms tamato'),
                      ],
                    ),
                    Container(
                      height: screenHeight * 0.11,
                      width: screenWidth * 0.004,
                      color: Colors.black12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Zucchini noddle'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Basil posta and garlic'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Grilled chicken'),
                        paintIngredients(
                            height: screenHeight,
                            width: screenWidth,
                            ingredientName: 'Mushrooms tamato'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          width: screenWidth,
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            color: Color(0xfff6c6bd),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth * 0.08),
              topRight: Radius.circular(screenWidth * 0.08),
            ),
          ),
          child: Column(
            children: [
              Divider(color: Colors.black,indent: screenWidth * 0.46,endIndent: screenWidth * 0.46,thickness: screenHeight * 0.002,height: screenHeight * 0.025,),
              SizedBox(height: screenHeight * 0.0055,),
              Text('Order & delivery option',style: TextStyle(fontSize: screenWidth * 0.047) ,)
            ],
          ),
        ),
      ),
    );
  }
}

Widget paintIngredients(
    {required double height,
    required double width,
    required String ingredientName}) {
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.red.shade800,
          shape: BoxShape.circle,
        ),
        height: height * 0.017,
        width: width * 0.017,
      ),
      SizedBox(
        width: width * 0.025,
      ),
      Text(ingredientName),
    ],
  );
}
