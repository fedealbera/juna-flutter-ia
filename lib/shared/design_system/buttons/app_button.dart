import 'package:flutter/material.dart';

enum AppButtonType { primary, secondary, outlined, text }

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final IconData? icon;
  final bool isLoading;
  final double? width;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.icon,
    this.isLoading = false,
    this.width,
    this.color,
    this.textColor,
    this.borderColor,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return MouseRegion(
      cursor: widget.onPressed != null && !widget.isLoading 
          ? SystemMouseCursors.click 
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTapDown: widget.onPressed != null && !widget.isLoading 
            ? (_) => _controller.forward() 
            : null,
        onTapCancel: widget.onPressed != null && !widget.isLoading 
            ? () => _controller.reverse() 
            : null,
        onTapUp: widget.onPressed != null && !widget.isLoading 
            ? (_) {
                _controller.reverse();
                widget.onPressed?.call();
              }
            : null,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SizedBox(
            width: widget.width ?? double.infinity,
            height: 52,
            child: _buildButtonBody(theme),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBody(ThemeData theme) {
    final hasIcon = widget.icon != null;
    final child = widget.isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasIcon) ...[
                Icon(widget.icon, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: _getTextColor(theme),
                ),
              ),
            ],
          );

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: _getBackgroundColor(theme),
        border: _getBorder(theme),
        boxShadow: widget.type == AppButtonType.primary && widget.onPressed != null
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                )
              ]
            : null,
      ),
      child: Center(child: child),
    );
  }

  Color? _getBackgroundColor(ThemeData theme) {
    if (widget.onPressed == null) {
      return theme.disabledColor;
    }
    if (widget.color != null) {
      return widget.color;
    }
    switch (widget.type) {
      case AppButtonType.primary:
        return theme.colorScheme.primary;
      case AppButtonType.secondary:
        return theme.colorScheme.secondary;
      case AppButtonType.outlined:
      case AppButtonType.text:
        return Colors.transparent;
    }
  }

  Color _getTextColor(ThemeData theme) {
    if (widget.onPressed == null) {
      return Colors.grey.shade500;
    }
    if (widget.textColor != null) {
      return widget.textColor!;
    }
    switch (widget.type) {
      case AppButtonType.primary:
        return theme.colorScheme.onPrimary;
      case AppButtonType.secondary:
        return theme.colorScheme.onSecondary;
      case AppButtonType.outlined:
        return theme.colorScheme.primary;
      case AppButtonType.text:
        return theme.colorScheme.primary;
    }
  }

  Border? _getBorder(ThemeData theme) {
    if (widget.type == AppButtonType.outlined || widget.borderColor != null) {
      final color = widget.borderColor ?? (widget.onPressed != null ? theme.colorScheme.primary : theme.disabledColor);
      return Border.all(color: color, width: 2);
    }
    return null;
  }
}
