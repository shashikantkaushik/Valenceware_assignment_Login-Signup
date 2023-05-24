import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:valenceware_assignment/auth.dart';




class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override

  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false); 
    final name=(ap.userModel.name);
    final add=(ap.userModel.add);
    final dob=(ap.userModel.dob);
    final phone=(ap.userModel.phoneNumber);

    final uid=(ap.userModel.uid);
    final date=(ap.userModel.createdAt);
    // final DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('messages');

    return Scaffold(
      backgroundColor:  Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Color(0xFF189AB4),
        centerTitle: false,

        title: Text("Hello, $name",),

      ),
      body:SafeArea(
    child:Column(
    mainAxisAlignment:MainAxisAlignment.center,
        children :<Widget>[
          CircleAvatar(
            radius:65,
            backgroundImage:AssetImage('assets/image3.png')
            ,foregroundColor: Colors.purple.shade50,
            backgroundColor: Colors.purple.shade50,

          ),
          Text('$name',
              style:TextStyle(
                fontWeight:FontWeight.bold,
                fontSize: 40.0,
                fontFamily:'Pacifico',
              )
          ),
          Text('User Infomation',
              style:TextStyle(
                  fontWeight:FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily:'SourceSansPro-Regular',
                  color:Colors.grey,
                  letterSpacing: 2.5
              )
          ),
          SizedBox(height:20,
            width:150,
            child: Divider(
              color:Colors.white,
              thickness:2.0,

            ),
          ),


         Card(
              margin:EdgeInsets.symmetric(vertical:10,
                  horizontal:25),
              color:Colors.white,
              child:
              ListTile(
                leading:
                Icon(Icons.date_range_outlined,
                    color:Colors.teal),
                title: Text('$dob',
                  style:TextStyle(
                    color:Colors.teal[900],
                    fontFamily:'SourceSansPro-Regular',
                    fontSize: 13,
                    fontWeight:FontWeight.bold,)),



              )
          ),

          Card(margin:EdgeInsets.symmetric(vertical:10,
              horizontal:25),
              child: ListTile(
                  leading: Icon(Icons.email,
                      color:Colors.teal),
                  title:Text('$phone',
                      style:TextStyle(
                        color:Colors.teal[900],
                        fontFamily:'SourceSansPro-Regular',
                        fontSize: 13,
                        fontWeight:FontWeight.bold,
                      ))
              )



          ),
          Card(margin:EdgeInsets.symmetric(vertical:10,
              horizontal:25),
              child: ListTile(
                  leading: Icon(Icons.location_on,
                      color:Colors.teal),
                  title:Text('$add',
                      style:TextStyle(
                        color:Colors.teal[900],
                        fontFamily:'SourceSansPro-Regular',
                        fontSize: 13,
                        fontWeight:FontWeight.bold,
                      ))
              )



          )

        ]
    )
    ),
    );



  }
}
