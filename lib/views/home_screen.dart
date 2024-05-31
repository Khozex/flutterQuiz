import 'package:flutter/material.dart';
import 'package:quizz2/models/flutter_topics_model.dart';
import 'package:quizz2/views/history_screen.dart';
import 'package:quizz2/views/profile_screen.dart';
import 'package:quizz2/views/review_screen.dart';
import 'package:quizz2/widgets/bottom_nav_bar.dart';
import 'package:quizz2/views/difficulty_selection_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String filter = '';
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    ReviewScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F0C3), // Cor de fundo semelhante ao exemplo
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    Map<String, List<FlutterTopics>> groupedTopics = groupTopicsByCategory();

    return Scaffold(
      backgroundColor: Color(0xFFE7F0C3),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Olá, Ismael",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF262A4B),
              ),
            ),
            Text(
              "Qual matéria você quer melhorar hoje?",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF262A4B),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Pesquise aqui',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white24),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  filter = value.toLowerCase();
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: groupedTopics.entries
                    .expand((entry) => entry.value)
                    .map((topic) => _buildTopicItem(topic, context))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, List<FlutterTopics>> groupTopicsByCategory() {
    Map<String, List<FlutterTopics>> map = {};
    for (FlutterTopics topic in flutterTopicsList) {
      if (filter.isEmpty || topic.topicName.toLowerCase().contains(filter)) {
        map.putIfAbsent(topic.topicCategory, () => []).add(topic);
      }
    }
    return map;
  }

  Widget _buildTopicItem(FlutterTopics topic, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DifficultySelectionScreen(topic: topic),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              topic.topicIcon,
              color: Color(0xFF262A4B),
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              topic.topicName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF262A4B),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
