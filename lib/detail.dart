import 'package:flutter/material.dart';
import 'models/menu_model.dart';

class DetailPage extends StatelessWidget {
  final MenuModel menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1976D2),
        elevation: 0,
        title: Text(
          menu.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF87CEEB), Color(0xFF4B0082)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            if (menu.title == "🔵 Ruang Refleksi") _buildReflection(),
            if (menu.title == "🟢 Pelukan Musik") _buildMusic(),
            if (menu.title == "🟠 Karya yang Bicara") _buildGallery(),
            if (menu.title == "About") _buildAboutLayout(),
          ],
        ),
      ),
    );
  }

  // 🔵 Ruang Refleksi
  Widget _buildReflection() {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Tulis Refleksi Harianmu",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Ketik di sini...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Simpan Catatan"),
            ),
            const SizedBox(height: 20),
            const Text(
              "History Catatan",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            _historyItem("Hari ini aku merasa lebih baik setelah menulis."),
            _historyItem("Kemarin aku agak cemas, tapi bisa teratasi."),
          ],
        ),
      ),
    );
  }

  // 🟢 Pelukan Musik
  Widget _buildMusic() {
    final playlist = [
      "Relax & Calm",
      "Semangat Pagi",
      "Fokus & Belajar",
      "Mellow & Santai"
    ];

    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Playlist Rekomendasi",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 12),
            ...playlist.map((song) => ListTile(
                  leading: const Icon(Icons.music_note, color: Colors.white70),
                  title: Text(
                    song,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_circle_fill,
                        color: Colors.white70),
                    onPressed: () {},
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // 🟠 Karya yang Bicara
  Widget _buildGallery() {
    return Card(
      color: Colors.white.withOpacity(0.15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Unggah Karyamu",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 12),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Tulis puisi, cerita, atau ide singkatmu...",
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.upload),
              label: const Text("Unggah Karya"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Karya Terbaru",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            _historyItem("Puisi: Senja yang Menyapa"),
            _historyItem("Foto: Langit setelah hujan"),
            _historyItem("Cerpen: Hujan di Kota Kecil"),
          ],
        ),
      ),
    );
  }

  // Card kecil untuk history
  Widget _historyItem(String text) {
    return Card(
      color: Colors.white.withOpacity(0.12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }

  // About atas-bawah
  Widget _buildAboutLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Kotak pertama - Informasi Aplikasi
        Card(
          color: Colors.white.withOpacity(0.15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Informasi Aplikasi",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Nama: Ruang Ekspresi\nVersi: 1.0.0\nPlatform: Flutter",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        // Kotak kedua - Informasi Pembuat
        Card(
          color: Colors.white.withOpacity(0.15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Informasi Pembuat",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Nama: Shofie Ardhya Shafina\nKelas: Informatika\nTahun: 2025",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        // Footer
        const Center(
          child: Text(
            "@2025 copyright all rights reserved",
            style: TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: Text(
            "Salam Hangat —Shofie A Shafina",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
