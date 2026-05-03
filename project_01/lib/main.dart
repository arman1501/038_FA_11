import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7B7FC4)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const DeveloperProfilePage(),
    );
  }
}

class DeveloperProfilePage extends StatelessWidget {
  const DeveloperProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                color: Color(0xFF030C59),
              ),
              child: const Text(
                'Developer Profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Main Content - Centered Box
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 32),

                        // Avatar + Info Row (With Logo instead of AH)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              // Avatar Circle with Logo
                              Container(
                                width: 72,
                                height: 72,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF030C59),
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/logo1.jpg',
                                    width: 72,
                                    height: 72,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Text(
                                          'AH',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),

                              // Name & Details
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arman Hussan',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF2D2D2D),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'CSE - 63rd Batch',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF9B9FD4),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14,
                                        color: Color(0xFF030C59),
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        'Sylhet, Bangladesh',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Color(0xFF030C59),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),
                        const Divider(color: Color(0xFFE8E8F0), thickness: 1),

                        // Stats Row
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _StatItem(count: '12', label: 'Posts'),
                              _StatItem(count: '340', label: 'Followers'),
                              _StatItem(count: '98', label: 'Following'),
                            ],
                          ),
                        ),

                        const Divider(color: Color(0xFFE8E8F0), thickness: 1),

                        // Skills Tags
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 24),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _SkillChip(
                                label: 'Flutter',
                                backgroundColor: Color(0xFFEC5F41),
                              ),
                              _SkillChip(
                                label: 'Dart',
                                backgroundColor: Color(0xFF030C59),
                              ),
                              _SkillChip(
                                label: 'UI/UX',
                                backgroundColor: Color(0xFF6AADA0),
                              ),
                              _SkillChip(
                                label: 'Git',
                                backgroundColor: Color(0xFF8004C5),
                              ),
                              _SkillChip(
                                label: 'Firebase',
                                backgroundColor: Color(0xFFFF8F06),
                              ),
                            ],
                          ),
                        ),

                        // Action Buttons
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: Row(
                            children: [
                              // Follow Button
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.person_add_alt_1,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    'Follow',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF030C59),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    elevation: 0,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),

                              // Message Button
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.chat_bubble_outline,
                                    size: 16,
                                    color: Color(0xFF6AADA0),
                                  ),
                                  label: const Text(
                                    'Message',
                                    style: TextStyle(
                                      color: Color(0xFF6AADA0),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                      color: Color(0xFF6AADA0),
                                      width: 1.5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2D2D2D),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;
  final Color backgroundColor;

  const _SkillChip({required this.label, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
