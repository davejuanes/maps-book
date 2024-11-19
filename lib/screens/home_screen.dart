import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        _RecipesCard(context),
        _RecipesCard(context),
      ],)
    );
  }
  Widget _RecipesCard(BuildContext context) {
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
                    // child: Image.network('https://static.platzi.com/media/uploads/flutter_lasana_b894f1aee1.jpg', fit: BoxFit.cover,),
                    child: Image.network('https://images.unsplash.com/photo-1467348733814-f93fc480bec6?q=80&w=1502&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', fit: BoxFit.cover,),
                  ),
                ),
                const SizedBox(
                  width: 26,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text('Road', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),),
                    SizedBox(height: 4,),
                    Container(
                      height: 2,
                      width: 75,
                      color: Colors.blueGrey[300],
                    ),
                    const Text('Dave Juanes', style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),),
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
