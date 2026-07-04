import 'package:flutter/material.dart';

class LinkedInSocialButton extends StatelessWidget {
  final IconData inactiveIcon;
  final IconData activeIcon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final Color? activeColor;
  final Color? inActiveColor;

  const LinkedInSocialButton({
    super.key,
    required this.inactiveIcon,
    required this.activeIcon,
    required this.label,
    required this.onTap,
    required this.isActive,
    this.activeColor,
    this.inActiveColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color active =
        activeColor ?? const Color(0xFF0A66C2);
    final Color inactive =
        inActiveColor ?? Colors.black54;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          splashColor: active.withValues(alpha: 0.15),
          highlightColor: inactive.withValues(alpha: 0.05),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isActive ? activeIcon : inactiveIcon,
                  color: isActive ? active : inactive,
                  size: 20,
                ),
                const SizedBox(height: 3),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: isActive ? active : inactive,
                    fontWeight:
                    isActive ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
