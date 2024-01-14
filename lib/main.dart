import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'farmers.dart';
import 'transactions.dart';
import 'homepage.dart';
import 'my_drawer_header.dart';

void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    const appTitle= 'CWS Transaction';
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.white),
        // primarySwatch: Colors.teal
      ),
      title: appTitle,
      home: LandingPage(),
      // home:Scaffold(
      //   appBar: myAppBar(),
      //   body: const MyTransactionsForm(),
      // ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      title: const Text("CWS Transaction"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
    );
  }
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState()=>_LandingPageState();
  }

class _LandingPageState extends State<LandingPage>{
  var currentPage=DrawerSections.farmers;
  @override
  Widget build(BuildContext context) {

    var container;
    if(currentPage==DrawerSections.dashboard){
      container=Dashboard();
    }
    else if(currentPage==DrawerSections.farmers){
      container=Farmers();
    }
    else if(currentPage==DrawerSections.transactions){
      container=Transactions();
    }

    return Scaffold(
          appBar: AppBar(
            title: Text("CWS Transactions"),
            backgroundColor: Colors.teal[500],
          ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(),
                ],

              ),
            ),
        ),
      ),
    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15,),
      child: Column(
          children: [
            menuItem(1,"Dashboard",Icons.dashboard_outlined,
            currentPage==DrawerSections.dashboard ?true:false),
            menuItem(1,"Farmers",Icons.people,
                currentPage==DrawerSections.farmers ?true:false),
            menuItem(1,"Transactions",Icons.transfer_within_a_station_sharp,
                currentPage==DrawerSections.transactions ?true:false),
            // menuItem(),
          ],
      ),
    );

  }
  Widget menuItem(int id, String title,IconData icon,bool selected){
    return Material(
      color: selected ? Colors.grey[300]:Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id==1){
              currentPage=DrawerSections.dashboard;
            }
            else if(id==2){
              currentPage=DrawerSections.farmers;
            }
            else if(id==3){
              currentPage=DrawerSections.transactions;
            }
          });
        },
          child:Padding(
            padding: EdgeInsets.all(15.0),

            child: Row(
              children: [
                Expanded(child: Icon(icon,
                size: 20,
                color: Colors.black,
                )
                ),
                Expanded(
                  flex: 1,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                      ),)

                )
              ],
            ),
          )
      ),
    );
  }
}


class MyTransactionsForm extends StatefulWidget{
  const MyTransactionsForm({super.key});

  @override
  MyTransactionsFormState createState(){
    return MyTransactionsFormState();
  }
}

class MyTransactionsFormState extends State<MyTransactionsForm> {
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Padding(
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
    );
  }
}

enum DrawerSections {
  dashboard,
  farmers,
  transactions,
}
