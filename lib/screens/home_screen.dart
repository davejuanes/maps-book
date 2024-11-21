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
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600,
          child: const RecipeForm(),
        ),
      ),
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

class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _roadName = TextEditingController();
    final TextEditingController _authorName = TextEditingController();
    final TextEditingController _imageUrl = TextEditingController();
    final TextEditingController _description = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Add New Road', 
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 24,
            ),),
            SizedBox(height: 16,),
            _buildTextField(controller: _roadName, label: 'Road Name',
              validator: (value) {
                if (value == null ||value.isEmpty) {
                  return 'Please enter the road name';
                }
                return null;
              }
            ),
            SizedBox(height: 16,),
            _buildTextField(controller: _authorName, label: 'Author Name',
              validator: (value) {
                if (value == null ||value.isEmpty) {
                  return 'Please enter the author name';
                }
                return null;
              }
            ),
            SizedBox(height: 16,),
            _buildTextField(controller: _imageUrl, label: 'Image URL',
              validator: (value) {
                if (value == null ||value.isEmpty) {
                  return 'Please enter the image url';
                }
                return null;
              }
            ),
            SizedBox(height: 16,),
            _buildTextField(
              maxLines: 4,
              controller: _description,
              label: 'Description',
              validator: (value) {
                if (value == null ||value.isEmpty) {
                  return 'Please enter the road description';
                }
                return null;
              }
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()){
                    Navigator.pop(context);
                  }
                }
                ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                child: 
                  Text(
                    'Save Road',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, fontWeight: FontWeight.bold,
                    ),
                ),
              ),
            )
          ],
        ),  
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    int maxLines = 1
    }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.blueGrey
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 1),
          borderRadius: BorderRadius.circular(10)
        )
      ),
      validator: validator,
      maxLines: maxLines,
    );
  }
}