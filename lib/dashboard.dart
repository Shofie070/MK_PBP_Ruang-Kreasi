import 'package:flutter/material.dart';
import 'models/menu_model.dart';
import 'detail.dart';

class DashboardPage extends StatelessWidget {
  final String username;

  const DashboardPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4B0082),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        elevation: 4,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Logo + Nama Aplikasi + Salam
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 30, top: 20),
            child: Column(
              children: [
                Image.asset("assets/logo.jpeg", height: 100),
                const SizedBox(height: 10),
                const Text(
                  "Ruang Ekspresi",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Selamat datang, $username 🌸",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),

          // 🔹 List menu dari model
          ...menuList.map((menu) => _buildMenuCard(context, menu)),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, MenuModel menu) {
    return Card(
      color: menu.bgColor, // warna langsung dari model
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(menu.icon, color: Colors.white, size: 32),
        title: Text(
          menu.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          menu.subtitle, // ✅ subtitle ditampilkan
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(menu: menu),
            ),
          );
        },
      ),
    );
  }
}
