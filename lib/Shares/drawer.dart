import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + kToolbarHeight),
            // ── Danh sách menu ──
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  const DrawerItem(
                    icon: Icons.home_outlined,
                    label: 'Trang chủ',
                    isActive: true,
                  ),
                  const DrawerItem(
                    icon: Icons.open_in_new,
                    label: 'Nguồn học tiếng Anh',
                  ),
                  const DrawerItem(
                    icon: Icons.folder_outlined,
                    label: 'Folder',
                  ),
                  const DrawerItem(
                    icon: Icons.headset_outlined,
                    label: 'Nghe Playlist',
                  ),
                  const DrawerItem(
                    icon: Icons.warning_amber,
                    label: 'Từ yếu',
                  ),
                  const DrawerItem(
                    icon: Icons.notifications_outlined,
                    label: 'Thông báo',
                    badge: 5,
                  ),
                  const DrawerItem(
                    icon: Icons.menu_book_outlined,
                    label: 'Vocabulary',
                  ),
                  const DrawerItem(
                    icon: Icons.settings_outlined,
                    label: 'Cài đặt',
                  ),
                  const DrawerItem(
                    icon: Icons.info_outline,
                    label: 'About Rememvoca',
                  ),
                ],
              ),
            ),

            // ── User info + Đăng xuất ──
            const Divider(height: 1),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple.shade400,
                child: const Text(
                  'N',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: const Text(
                'nguyenvanddan113',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: const Text(
                'nguyenvanddan113@gmail.c...',
                style: TextStyle(fontSize: 12),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black54),
              title: const Text('Đăng xuất'),
              onTap: () => print('Đăng xuất'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ── DrawerItem Widget ─────────────────────────────────────────
class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final int badge;
  final VoidCallback? onTap;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.badge = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? Colors.purple.shade50 : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive ? Colors.purple : Colors.black54,
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            color: isActive ? Colors.purple : Colors.black87,
          ),
        ),
        trailing: badge > 0
            ? Container(
          padding:
          const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '$badge',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
            : null,
        onTap: onTap ?? () => Navigator.pop(context),
      ),
    );
  }
}