import 'package:flutter/material.dart';

class AppTheme {
  // ════════════════════════════════════
  // 🎨 COLORS — Màu sắc
  // Dùng: color: AppTheme.primary
  // ════════════════════════════════════
  static const Color primary = Color(0xFF6366F1); // tím chính
  static const Color primaryLight = Color(0xFFEEEDFE); // tím nhạt (nền icon)
  static const Color bgMain = Color(0xFFF5F3FF); // nền toàn app
  static const Color bgCard = Color(0xFFFFFFFF); // nền card
  static const Color bgDark = Color(0xFF3D3D5C); // nền tối (header Cài đặt)
  static const Color textPrimary = Color(0xFF1A1A2E); // chữ đậm
  static const Color textSecondary = Color(0xFF6B7280); // chữ xám
  static const Color textLight = Color(0xFFC0C0C0); // chữ nhạt
  static const Color warning = Color(0xFFC27A3F); // cam (đến hạn)
  static const Color warningLight = Color(0xFFFFF3E0); // cam nhạt (nền badge)
  static const Color border = Color(0xFFE5E7EB); // viền card
  static const Color error = Color(0xFFE24B4A); // đỏ (thông báo)

  // ════════════════════════════════════
  // 🌈 GRADIENT — Màu chuyển
  // Dùng: gradient: AppTheme.primaryGradient
  // ════════════════════════════════════
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF818CF8), Color(0xFF6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Header welcome card
  static const LinearGradient welcomeGradient = LinearGradient(
    colors: [Color(0xFF818CF8), Color(0xFF6366F1), Color(0xFF8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ════════════════════════════════════
  // 📐 SPACING — Khoảng cách
  // Dùng: SizedBox(height: AppTheme.lg)
  //       padding: EdgeInsets.all(AppTheme.lg)
  // ════════════════════════════════════
  static const double xs = 4.0; // khoảng cách cực nhỏ
  static const double sm = 8.0; // khoảng cách nhỏ
  static const double md = 12.0; // khoảng cách vừa
  static const double lg = 16.0; // khoảng cách chuẩn (padding trang)
  static const double xl = 24.0; // khoảng cách lớn
  static const double xxl = 32.0; // khoảng cách rất lớn

  // ════════════════════════════════════
  // 🔘 BORDER RADIUS — Bo góc
  // Dùng: BorderRadius.circular(AppTheme.radiusLg)
  // ════════════════════════════════════
  static const double radiusSm = 8.0; // icon container, badge
  static const double radiusMd = 12.0; // input, button nhỏ
  static const double radiusLg = 16.0; // card
  static const double radiusXl = 20.0; // card lớn
  static const double radiusFull = 999.0; // pill button, badge tròn

  // ════════════════════════════════════
  // ✍️ TEXT STYLE — Kiểu chữ
  // Dùng: style: AppTheme.h1
  // ════════════════════════════════════

  // Tiêu đề lớn (Folder của bạn, Cài đặt)
  static const TextStyle h1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A1A2E),
  );

  // Tiêu đề vừa (Day 1, Day 2, tên section)
  static const TextStyle h2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A1A2E),
  );

  // Tiêu đề nhỏ
  static const TextStyle h3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1A1A2E),
  );

  // Chữ thường (nội dung chính)
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFF1A1A2E),
  );

  // Chữ phụ (mô tả, subtitle)
  static const TextStyle bodySecondary = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Color(0xFF6B7280),
  );

  // Chữ nhỏ nhất (badge, label)
  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: Color(0xFF6B7280),
  );

  // ════════════════════════════════════
  // 🃏 DECORATION — Trang trí widget
  // Dùng: decoration: AppTheme.cardDecoration
  // ════════════════════════════════════

  // Card thông thường
  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Color(0xFFE5E7EB)),
  );

  // Button tím gradient
  static BoxDecoration btnPrimary = BoxDecoration(
    gradient: primaryGradient,
    borderRadius: BorderRadius.circular(999),
  );

  // Button outline tím
  static BoxDecoration btnOutline = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(999),
    border: Border.all(color: Color(0xFF6366F1)),
  );

  // Input tìm kiếm
  static BoxDecoration inputDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    border: Border.all(color: Color(0xFFE5E7EB)),
  );
}
