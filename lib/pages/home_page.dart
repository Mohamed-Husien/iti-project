import 'package:first_app/pages/login_page.dart';
import 'package:first_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to our app')),

      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('Assets/images/test_image.jpg'),
              ),
              SizedBox(height: 14),
              Container(
                width: 200,
                height: 36,
                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        count.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Spacer(),
                      Icon(Icons.favorite),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: 200,
                height: 36,
                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Mohamed",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Spacer(),
                      Icon(Icons.person),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14),
              Container(
                width: 200,
                height: 36,
                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "25",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Spacer(),
                      Icon(Icons.format_list_numbered),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14),

              Container(
                width: 200,
                height: 36,
                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "Flutter",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Spacer(),
                      Icon(Icons.mobile_friendly),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // count++;
                      // setState(() {});
                      var status = await AuthService.logOut();
                      print("logout status$status");
                      if (status == 'success') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                    child: Text("logout"),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      // setState(() {
                      //   count--;
                      // });

                      var status = await AuthService.deleteUser();
                      print("delete user status$status");
                      if (status == 'success') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }
                    },
                    child: Text("delete"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///---------------------------------------------
