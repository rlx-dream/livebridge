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
    final double radius = 12; // الحواف الدائرية للإطار

    if (app.icon != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          width: size,
          height: size,
          // تكبير الأيقونة قليلاً (1.3x) وقص الزوائد لإخفاء أي بكسلات بيضاء أو هوامش
          child: OverflowBox(
            maxWidth: size * 1.3,
            maxHeight: size * 1.3,
            child: Image.memory(
              app.icon!,
              width: size * 1.3,
              height: size * 1.3,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
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
