import 'package:flutter/material.dart';

import 'components/component_with_icon.dart';
import 'components/component_with_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Profile', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            // TODO: Implement action
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // TODO: Implement action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/messi.png'),
                ),
                const SizedBox(height: 12),
                Text(
                  'Maria Akter Dipti',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                ComponentWithText(title: 'UserName', description: 'dipti_2020'),
                ComponentWithText(title: 'Email', description: 'mariadipti@gmail.com'),
                ComponentWithIcon(title: 'Change Password', icon: Icons.arrow_forward_ios_rounded),
                ComponentWithIcon(title: 'Notification', icon: Icons.notifications_active_rounded),
                ComponentWithIcon(title: 'Enable Dark Mode', icon: Icons.dark_mode_rounded),
                ComponentWithIcon(title: 'Settings', icon: Icons.settings_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
