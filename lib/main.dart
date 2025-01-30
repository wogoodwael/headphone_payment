import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFE8EAF6),
      ),
      home: const HeadphoneShop(),
    );
  }
}

class HeadphoneShop extends StatefulWidget {
  const HeadphoneShop({Key? key}) : super(key: key);

  @override
  State<HeadphoneShop> createState() => _HeadphoneShopState();
}

class _HeadphoneShopState extends State<HeadphoneShop> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _slideAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e64bc),
      body: Stack(
        children:[ Column(
          children: [
          SizedBox(height: .4*MediaQuery.sizeOf(context).height,),
        
            Stack(
           
              children:[ AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _slideAnimation.value),
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Stack(
                        children:[ Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 40,),
                              Text(
                                'Beats',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Studio 3 Wireless',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.star , color: Colors.orange,), 
                                  Text("4.5" , style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),), 
                                  Text("(126 reviwes)" , style: TextStyle(
                                    color: Colors.grey
                                  ),)                               
 ],
                              ),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                spacing: 20,
                                children: [
                                  _buildFeatureIcon(Icons.wifi, 'Wireless'),
                                  _buildFeatureIcon(Icons.bluetooth, 'Bluetooth'),
                                  _buildFeatureIcon(Icons.battery_full, 'Battery'),
                                ],
                              ),
                              Text("Lorem ipsum is simply dummy text of the printing and typesetting industry. Lorem ipsum has been the industry's standar, when an unknown printer...read more")
                          ,    Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$450',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {},
                                    
                                    icon: Icon(Icons.shopping_cart ,
                                    size: 25,
                                     color: Colors.white,),
                                    label: Text('Add to Cart' , style: TextStyle(
                                      color: Colors.white
                                    ),),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff1e64bc),
                                     minimumSize: Size(200, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Column(
                            spacing: 10,
                          children: [
                            Icon(Icons.circle , color: Colors.green,), 
                            Icon(Icons.circle , color: Colors.black,), 
                            Icon(Icons.circle , color: Colors.purple,), 
                            SizedBox(height: 10,), 
                            Container(
                            
                            padding: EdgeInsets.only(bottom: 10 , left: 5 , right: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(.1)
                              ),
                              child: Center(child: Icon(Icons.minimize_outlined)),
                            ) , 
                            Text("01" , style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),), 
                            Container(
                            
                            padding: EdgeInsets.only(left: 5 , right: 5),
                              decoration: BoxDecoration(
                                color: Colors.blue[700]
                              ),
                              child: Center(child: Icon(Icons.add , color: Colors.white,)),
                            ) , 
                          ],
                        ))
                   ]
                      ),
                    ),
                  );
                },
              ),
             
              ]
            ),
          ],
        ),
        Positioned(
          top: 40,
          left: 10,
          child: Icon(Icons.arrow_back , color: Colors.white,)),
          Positioned(
            top: 40,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle, 
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(.2), 
            ),
            child: Icon(Icons.favorite , color: Colors.red[800] ,),
          )), 
          Positioned(
              top: 70,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
               
                child: Hero(
                  tag: 'headphone',
                  child: Image.asset(
                    "assets/images/headphone.png",
                    height: 70,
                    fit: BoxFit.scaleDown,
                  
                  ),
                ),
              ),
            ),
             
        ]
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blue[700]),
        ),
        SizedBox(height: 8),
       
      ],
    );
  }
}