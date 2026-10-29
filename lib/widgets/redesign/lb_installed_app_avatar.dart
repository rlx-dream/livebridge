import 'package:flutter/material.dart';

import '../../models/app_models.dart';
import '../../theme/livebridge_tokens.dart';

class LbInstalledAppAvatar extends StatelessWidget {
  const LbInstalledAppAvatar({
    super.key,
    required this.app,
    required this.size,
  });

  final InstalledApp app;
  final double size;

  @override
  Widget build(BuildContext context) {
    final LbPalette palette = LbPalette.of(context);
    // جعل الحواف مربعة بالكامل (0) لتملاء الإطار حتى الزوايا
    final double radius = 0;

    if (app.icon != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.memory(
          app.icon!,
          width: size,
          height: size,
          fit: BoxFit.fill, // تمتد الأيقونة لتملأ الإطار بالكامل
          filterQuality: FilterQuality.high,
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: palette.surfaceSoft,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(
          app.label.isNotEmpty ? app.label[0].toUpperCase() : '?',
          style: LbTextStyles.caption.copyWith(color: palette.accent),
        ),
      ),
    );
  }
}
