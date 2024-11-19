import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        _RecipesCard(context),
        _RecipesCard(context),
      ],),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          _showButtom(context);
        }),

    );
  }

  Future<void> _showButtom(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        color: Colors.white,
        child: Text("Hola"),
      )
    );
  }

  Widget _RecipesCard(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    height: 125,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      // child: Image.asset('assets/images/your_image.png', fit: BoxFit.cover,),
                      child: Image.network('https://images.unsplash.com/photo-1669941060931-6912c4538ba3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHJvYWR8ZW58MHx8MHx8fDA%3D', fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Road', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),),
                      SizedBox(height: 4,),
                      Container(
                        height: 2,
                        width: 75,
                        color: Colors.blueGrey,
                      ),
                      Text('Dave Juanes', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                      SizedBox(height: 4,),                      
                    ],
                  )
                ],
              ),
            ),
          ),
    );
  }
}