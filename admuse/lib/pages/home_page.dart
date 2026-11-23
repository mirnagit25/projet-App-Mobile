import 'package:flutter/material.dart';
import 'create_ad_page.dart';
import 'login_page.dart'; 


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // L'index de l'onglet actuellement sélectionné (0 = Accueil)
  int _currentIndex = 0;

  // La liste des pages qui correspondent aux onglets
  final List<Widget> _tabs = [
    const HomeTab(),
    const HistoryTab(),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Le corps de l'application change en fonction de l'onglet cliqué
      body: _tabs[_currentIndex],
      
      // La fameuse barre de navigation en bas
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // On utilise le rouge de ton thème pour l'onglet actif
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Historique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// ==========================================
// ONGLET 1 : ACCUEIL 
// ==========================================
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tableau de bord')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mic, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              const Text(
                'Prêt à créer votre publicité ?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                'Générez un slogan, une voix off et une musique en quelques minutes.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.add, size: 28),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CreateAdPage()),
                    );
                  },
                  label: const Text(
                    'Créer ma publicité',
                    style: TextStyle(fontSize: 18),
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

// ==========================================
// ONGLET 2 : HISTORIQUE (Faux historique pour le visuel)
// ==========================================
class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Créations')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildHistoryCard('Boulangerie Chez Paul', 'Publicité 30s - Français', 'Hier'),
          _buildHistoryCard('Restaurant Le Gourmet', 'Publicité 15s - Arabe', '12 Oct 2023'),
          _buildHistoryCard('Boutique Mode & Style', 'Publicité 1min - Anglais', '05 Oct 2023'),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(String title, String subtitle, String date) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.music_note),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Text(date, style: const TextStyle(color: Colors.grey)),
        onTap: () {
          // Plus tard, ça ouvrira le projet
        },
      ),
    );
  }
}

// ==========================================
// ONGLET 3 : PROFIL (Faux profil pour le visuel)
// ==========================================
class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon Profil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 60, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Utilisateur AdMuse',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('utilisateur@admuse.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 32),
            OutlinedButton.icon(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Retour à la page de connexion
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              label: const Text('Se déconnecter'),
            )
          ],
        ),
      ),
    );
  }
}
