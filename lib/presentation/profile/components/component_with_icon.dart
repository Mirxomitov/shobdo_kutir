import 'package:flutter/material.dart';

class ComponentWithIcon extends StatelessWidget {
  const ComponentWithIcon({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Icon(
              icon,
              color: Colors.grey,
              size: 28,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
