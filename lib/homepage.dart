import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('C W S Transactions'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.teal,
              dividerColor: Colors.teal,
              tabs: [
                Tab(
                  text: "OverView",
                ),
                Tab(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white54,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white54,
                  ),
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                      child: Form(
                        key:_formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              validator: (value){
                                if (value == null || value.isEmpty){
                                  return 'Please enter CWS name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                labelText: "CWS Name",
                              ),
                            ),
                            TextFormField(
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Please enter Farmer Name';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Farmer Name"
                              ),
                            ),

                            TextFormField(
                              readOnly: true,
                              initialValue: DateTime.now().year.toString(),
                              decoration: const InputDecoration(
                                labelText: "season",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 5),
                              child: ElevatedButton(
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content:Text('Great'),),
                                    );
                                  }

                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("SECOND TAB"),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Text("THIRD TAB"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
