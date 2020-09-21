import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black45)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 15),
          CircleAvatar(
            backgroundColor: Colors.black12,
            maxRadius: 100,
            child: Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text("John Doe",
                    style: TextStyle(color: Colors.black45, fontSize: 40)),
                Text("Gampaha, Sri Lanka",
                    style: TextStyle(color: Colors.black38, fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text("Joined on 2020/09/21",
                    style: TextStyle(color: Colors.black26, fontSize: 16)),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () => {},
                  color: Colors.green,
                  child: Text("Upgrade to Premium",
                      style: TextStyle(color: Colors.white)),
                ),
                RaisedButton(
                  onPressed: () => {},
                  color: Colors.red,
                  child: Text("Delete Account",
                      style: TextStyle(color: Colors.white)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
