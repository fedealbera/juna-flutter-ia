import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'tenant_config.dart';

@lazySingleton
class BrandingManager {
  Widget getLogo(TenantConfig tenant, {double? width, double? height, BoxFit fit = BoxFit.contain}) {
    // Check if network URL
    if (tenant.logoUrl.startsWith('http') || tenant.logoUrl.startsWith('https')) {
      return Image.network(
        tenant.logoUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _fallbackLogo(tenant, width, height),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            width: width,
            height: height,
            child: const Center(
              child: CircularProgressIndicator.adaptive(strokeWidth: 2),
            ),
          );
        },
      );
    }

    // Otherwise fallback to asset loading (checking placeholder status)
    return Image.asset(
      tenant.logoUrl,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => _fallbackLogo(tenant, width, height),
    );
  }

  Widget _fallbackLogo(TenantConfig tenant, double? width, double? height) {
    return Container(
      width: width,
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            tenant.primaryColorRef.withValues(alpha: 0.22),
            tenant.primaryColorRef.withValues(alpha: 0.06),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: tenant.primaryColorRef.withValues(alpha: 0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: tenant.primaryColorRef.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: tenant.primaryColorRef,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: tenant.primaryColorRef,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              tenant.name.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: height != null ? (height * 0.38).clamp(11.0, 15.0) : 13.0,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient getPrimaryGradient(TenantConfig tenant) {
    return LinearGradient(
      colors: [
        tenant.primaryColorRef,
        tenant.secondaryColorRef,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
