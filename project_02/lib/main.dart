import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFFEAEEF0),
        body: Column(
          children: [
            // Header Section:
            _buildHeader(),

            // Scrollable Body:
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ACCOUNT
                    const _SectionLabel(label: 'ACCOUNT'),
                    const SizedBox(height: 8),
                    _buildAccountSection(),

                    const SizedBox(height: 22),

                    // PREFERENCES
                    const _SectionLabel(label: 'PREFERENCES'),
                    const SizedBox(height: 8),
                    _buildPreferencesSection(),

                    const SizedBox(height: 28),

                    // Log Out Button
                    _buildLogOutButton(),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER:
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF5F7E8C)),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 28),
          child: Column(
            children: [
              // Title Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings, color: Colors.white, size: 25),
                  SizedBox(width: 8),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              // Profile Info Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar circle with LOGO inside
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 2,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logo2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Name + batch + button
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Md. Arman Hussan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'CSE · 63rd Batch',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            letterSpacing: 0.2,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Edit Profile button
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Edit Profile',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 14,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ACCOUNT SECTION:
  Widget _buildAccountSection() {
    return _Card(
      children: [
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFDCEEFB),
            child: Icon(
              Icons.person_outline,
              color: Color(0xFF1E88E5),
              size: 20,
            ),
          ),
          title: 'My Profile',
          subtitle: 'View & edit your info',
          onTap: () {},
        ),
        const _Divider(),
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFFDE8E8),
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: Color(0xFFE53935),
              size: 20,
            ),
          ),
          title: 'Privacy',
          subtitle: 'Manage permissions',
          onTap: () {},
        ),
        const _Divider(),
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFE6F4EA),
            child: Icon(
              Icons.shield_outlined,
              color: Color(0xFF43A047),
              size: 20,
            ),
          ),
          title: 'Security',
          subtitle: 'Password & 2FA',
          onTap: () {},
          isLast: true,
        ),
      ],
    );
  }

  // PREFERENCES SECTION:
  Widget _buildPreferencesSection() {
    return _Card(
      children: [
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFEDE7F6),
            child: Icon(
              Icons.dark_mode_outlined,
              color: Color(0xFF8E24AA),
              size: 20,
            ),
          ),
          title: 'Dark Mode',
          onTap: () => setState(() => _darkMode = !_darkMode),
          showArrow: false, // No arrow
          // No trailing widget
        ),
        const _Divider(),
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFFFF8E1),
            child: Icon(
              Icons.notifications_outlined,
              color: Color(0xFFFFA000),
              size: 20,
            ),
          ),
          title: 'Notifications',
          onTap: () {},
          showArrow: false,
        ),
        const _Divider(),
        _SettingsTile(
          iconWidget: const _IconBadge(
            bg: Color(0xFFE0F7F4),
            child: Icon(
              Icons.language,
              color: Color(0xFF00897B),
              size: 20,
            ),
          ),
          title: 'Language',
          subtitle: 'Bangla',
          onTap: () {},
          showArrow: false,
          isLast: true,
        ),
      ],
    );
  }
  // LOGOUT BUTTON:
  Widget _buildLogOutButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFCC2A2A),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout_rounded, size: 20),
            SizedBox(width: 10),
            Text(
              'Log Out',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── REUSABLE WIDGETS:

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xFF7A7A7A),
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final List<Widget> children;
  const _Card({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      thickness: 0.6,
      indent: 66,
      endIndent: 0,
      color: Color(0xFFE8E8E8),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final Color bg;
  final Widget child;
  const _IconBadge({required this.bg, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Center(child: child),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool isLast;
  final bool showArrow;

  const _SettingsTile({
    required this.iconWidget,
    required this.title,
    this.subtitle,
    required this.onTap,
    this.trailing,
    this.isLast = false,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [
              iconWidget,
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: 0.1,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 12.5,
                          color: Color(0xFF909090),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null)
                trailing!
              else if (showArrow)
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFFBBBBBB),
                  size: 22,
                ),
            ],
          ),
        ),
      ),
    );
  }
}