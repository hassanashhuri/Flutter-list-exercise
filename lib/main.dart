import 'package:flutter/material.dart';
import '/selectform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Assignment',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? _Mycontroller;
  String _savedValue = '';

  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Mango',
      'label': '1',
    },
    {
      'value': 'Grape',
      'label': '2',
    },
    {
      'value': 'Durian',
      'label': '3',
    },
    {
      'value': 'Rambutan',
      'label': '4',
    },
    {
      'value': 'Longan',
      'label': '5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Exercise'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10, right: 10, top: 100),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                "List of Fruits",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "1. Mango \n2. Grape \n3. Durian \n4. Rambutan \n5. Longan\n\n",
              ),
              SelectFormField(
                type: SelectFormFieldType.dialog,
                controller: _Mycontroller,
                labelText: 'Select your fruit number',
                items: _items,
                onSaved: (val) => setState(() => _savedValue = val ?? ''),
              ),
              SizedBox(height: 30),
              FloatingActionButton(
                onPressed: () {
                  final loForm = _formKey.currentState;

                  if (loForm?.validate() == true) {
                    loForm?.save();
                  }
                },
                child: Text('Submit'),
              ),
              SizedBox(height: 20),
              SizedBox(height: 30),
              SelectableText(_savedValue),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
