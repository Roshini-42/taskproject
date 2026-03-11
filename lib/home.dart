import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String,dynamic>> watch =[
    {
      "name":"Apple Watch" ,
      "series":"Series:6",
      "amount":"${350}",
      "image":"assets/watch.png"
    },
    {
      "name":"Apple Watch",
      "series":"Series:4",
      "amount":"${400}",
      "image":"assets/watch.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: ListView.builder(
          itemCount: watch.length + 1,
          itemBuilder: (BuildContext, index){
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          children: [
                            Icon(Icons.menu,size: 28,),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: Colors.grey.shade300),
                                  ), child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 10),
                                  ),
                                ),
                                ),
                              ),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Order Online\nCollect in Store",
                        style: TextStyle(fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              );
            }

            final wat = watch[index-1];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 210,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(wat['image']),fit: BoxFit.cover),
                              shape: BoxShape.circle,
                              color: Colors.pink[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(0, 4),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(wat['name'],style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text(wat['series']),
                          Padding(
                            padding: const EdgeInsets.only(left: 105.0),
                            child: Row(
                              children: [
                                Text("\$",style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                ),),
                                Text(wat['amount'],style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold

                                ),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );

          }),
    );
  }
}