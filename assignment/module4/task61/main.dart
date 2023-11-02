import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(

      home: Screen1(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
    );
  }

}




class Screen1 extends StatefulWidget
{
  @override
  Screen1State createState() => Screen1State();
}


class Screen1State extends State<Screen1>
{
  int _currentIndex = 0;
  late SharedPreferences prefs;
  double totalAmount = 0.0;

  final List<Widget> _tabs = [
    MenuTab(),
    CartTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Menu',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),

    );
  }
}






class MenuTab extends StatefulWidget
{
  @override
  MenuState createState() => MenuState();

}

class MenuState extends State<MenuTab>
{

  List<Choice> choice = [
    Choice('https://paternalistic-hiera.000webhostapp.com/Images/veg%20and%20egg.jpeg','Vegetables And \n Poached Egg','12.50'),
    Choice('https://paternalistic-hiera.000webhostapp.com/Images/avocado%20salad.jpeg','Avocado Salad','19.28',),

    Choice('https://paternalistic-hiera.000webhostapp.com/Images/tabbouleh.jpeg','tabbouleh','15.32'),
    Choice('https://paternalistic-hiera.000webhostapp.com/Images/appetizer.jpeg','Appetizer','12.12',),

    Choice('https://paternalistic-hiera.000webhostapp.com/Images/manakish.jpeg','manakish','12.12',),
    Choice('https://paternalistic-hiera.000webhostapp.com/Images/vegetables.jpeg','vegetables','12.12',),

    Choice('https://paternalistic-hiera.000webhostapp.com/Images/ice%20cream.jpeg','ice cream','12.12',),
    Choice('https://paternalistic-hiera.000webhostapp.com/Images/cold%20coffee.jpeg','cold coffee','12.12',),

  ];


  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      appBar: AppBar(title: Text("  Menu",style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.orange),
            tabs: [
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Recommend"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Popular"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Noodeles"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.orange, width: 1)),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Pizza"),
                  ),
                ),
              ),
            ]),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20,bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: choice.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: ()
                      {

                      },
                      child: Card(
                        elevation: 5.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(choice[index].image, height: 100),
                            Text(
                              choice[index].name,
                              style: TextStyle(fontSize: 15.0),
                            ),
                            SizedBox(height: 5.0),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('\$${choice[index].price.toString()}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 25),
                                Container(
                                  color: Colors.orange,
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 25,
                                  child: Center(
                                    child: IconButton(
                                      padding: EdgeInsets.all(0.5),

                                      onPressed: () async {

                                        SharedPreferences prefs = await SharedPreferences.getInstance();
                                        List<String> cartItems = prefs.getStringList('cartItems') ?? [];

                                        cartItems.add(choice[index].name + "                        " +
                                            "          " + choice[index].price);

                                        await prefs.setStringList('cartItems', cartItems);

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(' ${choice[index].name} Added to cart'),
                                          ),
                                        );

                                      },icon: Icon(Icons.add),),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),

              ),
            ],
          ),
        ),
      ),
    );

  }

}

class Choice {
  final String image;
  final String name;
  final String price;


  Choice(this.image, this.name, this.price);
}






class CartTab extends StatefulWidget
{

  @override
  CartState createState() => CartState();

}

class CartState extends State<CartTab>
{
  List<String> cartItems = [];
  double totalAmount = 0.0;



  @override
  void initState() {
    super.initState();
    loadCartItems();
  }

  loadCartItems() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      cartItems = prefs.getStringList('cartItems') ?? [];
      calculateTotal();
    });
  }

  void calculateTotal() {
    totalAmount = 0.0;
    for (String cartItemName in cartItems) {
      final double itemPrice = itemPrices[cartItemName.trim()] ?? 0.0;
      print('CartItem: $cartItemName, Price: $itemPrice');
      totalAmount += itemPrice;
    }
    print('Total Amount: $totalAmount');
  }



  @override
  Widget build(BuildContext context)
  {
    var today = DateTime.now();
    var dateFormat = DateFormat('dd-MM-yyyy');
    String currentDate = dateFormat.format(today);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            SizedBox(height: 20),
            Text(currentDate, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index)
                  {
                    return ListTile(


                      title: Text(cartItems[index]),
                    );
                  }),),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(" \$${totalAmount.toString()}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: ()
                    {
                      clearCart();
                    }, child: Text("Checkout"),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearCart() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('cartItems');

    setState(() {
      cartItems = [];
      totalAmount = 0.0;
    });

  }

  final Map<String, double> itemPrices = {
    'Vegetables And Poached Egg': 12.50,
    'Avocado Salad': 25.28,
    'tabbouleh': 15.32,
    'Appetizer': 50.23,
    'manakish': 34.55,
    'vegetables': 12.00,
    'ice cream': 15.72,
    'cold coffee': 11.89,


  };

}

class CartItem {
  final String name;
  final String image;
  final double price;

  CartItem(this.name, this.image, this.price);


}

