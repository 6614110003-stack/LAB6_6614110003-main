
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../widgets/task_card.dart';
import '../widgets/empty_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<TaskProvider>(
        builder: (context, provider, _) {
          if (provider.tasks.isEmpty) {
            return const EmptyState();
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Summary Card
              Card(
                color: colorScheme.primaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: textTheme.titleMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${provider.pendingTasks.length} tasks pending',
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimaryContainer
                                    .withAlpha((0.8 * 255).round()),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CircularProgressIndicator(
                        value: provider.tasks.isEmpty
                            ? 0
                            : provider.completedTasks.length /
                                provider.tasks.length,
                        backgroundColor:
                            colorScheme.onPrimaryContainer.withAlpha((0.2 * 255).round()),
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Pending Tasks
              if (provider.pendingTasks.isNotEmpty) ...[
                Text('Pending', style: textTheme.titleMedium),
                const SizedBox(height: 12),
                ...provider.pendingTasks.map(
                  (task) => TaskCard(task: task),
                ),
                const SizedBox(height: 24),
              ],

              // Completed Tasks
              if (provider.completedTasks.isNotEmpty) ...[
                Text('Completed', style: textTheme.titleMedium),
                const SizedBox(height: 12),
                ...provider.completedTasks.map(
                  (task) => TaskCard(task: task),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}