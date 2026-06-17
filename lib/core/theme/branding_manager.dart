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
      width: width ?? 120,
      height: height ?? 40,
      decoration: BoxDecoration(
        color: tenant.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          tenant.name,
          style: TextStyle(
            color: tenant.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  LinearGradient getPrimaryGradient(TenantConfig tenant) {
    return LinearGradient(
      colors: [
        tenant.primaryColor,
        tenant.secondaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
