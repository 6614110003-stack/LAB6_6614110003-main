import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _CategoryCard(
            name: 'General',
            icon: Icons.folder,
            count: 2,
            color: Colors.grey,
          ),
          _CategoryCard(
            name: 'Work',
            icon: Icons.work,
            count: 5,
            color: Colors.blue,
          ),
          _CategoryCard(
            name: 'Learning',
            icon: Icons.school,
            count: 3,
            color: Colors.orange,
          ),
          _CategoryCard(
            name: 'Personal',
            icon: Icons.person,
            count: 1,
            color: Colors.green,
          ),
          _CategoryCard(
            name: 'Shopping',
            icon: Icons.shopping_bag,
            count: 0,
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final int count;
  final Color color;

  const _CategoryCard({
    required this.name,
    required this.icon,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withAlpha((0.2 * 255).round()),
          child: Icon(icon, color: color),
        ),
        title: Text(name),
        subtitle: Text('$count tasks'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }
}