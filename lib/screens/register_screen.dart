import 'package:flutter/material.dart';

import 'business_register_screen.dart';
import 'user_register_screen.dart';

class RegisterSelectionScreen extends StatefulWidget {
  const RegisterSelectionScreen({super.key});

  @override
  _RegisterSelectionScreenState createState() => _RegisterSelectionScreenState();
}

class _RegisterSelectionScreenState extends State<RegisterSelectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String appBarTitle = "Kullanıcı Kayıt";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          appBarTitle = "Kullanıcı Kayıt";
        } else {
          appBarTitle = "İşletme Kayıt";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.purple,
          labelColor: Colors.purple,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Kullanıcı Kayıt"),
            Tab(text: "İşletme Kayıt"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UserRegisterScreen(),
          BusinessRegisterScreen(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
