import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Untuk membuka link sosial media
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screen/movie_list_page.dart'; // Import screen baru


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Fungsi untuk membuka URL
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Tidak dapat membuka URL: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
        centerTitle: true,
      ),
      endDrawer: Drawer( // Drawer muncul dari sebelah kanan
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Farhana Ode Harfiddin"),
              accountEmail: const Text("faraharfiddin@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'), // Tambahkan gambar ke folder assets
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Portfolio"),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.movie),
              title: const Text("Movie List"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MovieListPage()),
                  );
              }
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.whatsapp),
              title: const Text("WhatsApp"),
              onTap: () => _launchURL('https://wa.me/6281244519191'), // Link WhatsApp
            ),
            ListTile(
              leading: const FaIcon(FontAwesomeIcons.instagram),
              title: const Text("Instagram"),
              onTap: () => _launchURL('https://www.instagram.com/farhanaaode/'), // Link Instagram
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/profile.png'), // Gambar profil
              ),
              
              SizedBox(height: 20),
              
               Card(
                elevation: 4, // Bayangan
                color: Color.fromARGB(255, 250, 250, 250),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
              Text(
                'Farhana Ode Harfiddin',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                children: [
                  _SkillChip(label: 'Institut Teknologi & Bisnis Stikom Ambon'),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 4, // Bayangan
                color: Color.fromARGB(255, 250, 250, 250),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                  Text(
                  'Saya adalah seorang mahasiswa yang sedang berusaha meraih gelar S.KOM ( Sarjana Komputer) di Institut Teknologi & Bisnis Stikom Ambon',
                  textAlign: TextAlign.center,
                ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _InfoCard(title: 'Semester', value: '5'),
                  _InfoCard(title: 'Konsentrasi', value: 'Mobile'),
                ],
              ),
              SizedBox(height: 20),

              Card(
                elevation: 4, // Bayangan
                color: Color.fromARGB(255, 250, 250, 250),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
              Text(
                'Skills & Expertise',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 10,
                children: [
                  _SkillChip(label: 'Flutter'),
                  _SkillChip(label: 'Dart'),
                  _SkillChip(label: 'Firebase'),
                  _SkillChip(label: 'REST API'),
                  _SkillChip(label: 'Git'),
                  _SkillChip(label: 'UI/UX'),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
    ),
    ),
    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const _InfoCard({required this.title, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 120,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.purple.shade100,
    );
  }
}
