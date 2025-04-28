import 'package:flutter/material.dart';
import 'business_register_screen.dart';
import 'user_register_screen.dart';

class RegisterSelectionScreen extends StatefulWidget {
  const RegisterSelectionScreen({super.key});

  @override
  _RegisterSelectionScreenState createState() => _RegisterSelectionScreenState();
}

class _RegisterSelectionScreenState extends State<RegisterSelectionScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String appBarTitle = "Kullanıcı Kayıt";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      setState(() {
        appBarTitle = _tabController.index == 0 ? "Kullanıcı Kayıt" : "İşletme Kayıt";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(appBarTitle, style: const TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.orange,
          labelColor: Colors.orange,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: "Kullanıcı"),
            Tab(text: "İşletme"),
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
