import 'dart:ui';
import 'package:flutter/material.dart';

enum AppCardStyle { normal, gradient, glassmorphic }

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final AppCardStyle style;
  final LinearGradient? customGradient;
  final double blur;
  final double borderRadius;
  final Border? customBorder;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    this.style = AppCardStyle.normal,
    this.customGradient,
    this.blur = 15.0,
    this.borderRadius = 16.0,
    this.customBorder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    switch (style) {
      case AppCardStyle.normal:
        return Card(
          margin: EdgeInsets.zero,
          elevation: theme.cardTheme.elevation ?? 2,
          shadowColor: theme.cardTheme.shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        );

      case AppCardStyle.gradient:
        final gradient = customGradient ??
            LinearGradient(
              colors: [
                theme.colorScheme.primary.withValues(alpha: 0.8),
                theme.colorScheme.secondary.withValues(alpha: 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            );
        return Container(
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        );

      case AppCardStyle.glassmorphic:
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(borderRadius),
                border: customBorder ??
                    Border.all(
                      color: Colors.white.withValues(alpha: 0.12),
                      width: 1.5,
                    ),
              ),
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        );
    }
  }
}
