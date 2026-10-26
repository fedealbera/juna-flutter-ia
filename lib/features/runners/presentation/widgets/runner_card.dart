import 'package:flutter/material.dart';
import '../../../../core/theme/tenant_config.dart';
import '../../domain/entities/runner_item.dart';

class RunnerCard extends StatelessWidget {
  final RunnerItem runner;
  final TenantConfig tenant;
  final bool isCurrentRunner;

  const RunnerCard({
    super.key,
    required this.runner,
    required this.tenant,
    this.isCurrentRunner = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool is21k = tenant.tenantName == '21kLG' ||
        tenant.name.toLowerCase().contains('21k');
    final String bibLabel = is21k ? 'DORSAL' : 'PLACA';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isCurrentRunner
            ? tenant.primaryColorRef.withValues(alpha: 0.15)
            : const Color(0xFF141414),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCurrentRunner
              ? tenant.primaryColorRef
              : Colors.white.withValues(alpha: 0.08),
          width: isCurrentRunner ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: isCurrentRunner
                ? tenant.primaryColorRef.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.25),
            blurRadius: isCurrentRunner ? 12 : 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Bib / Dorsal Box OR Athlete Initials Avatar with Verified Badge
            if (runner.hasDorsal)
              Container(
                constraints: const BoxConstraints(minWidth: 54),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: tenant.primaryColorRef.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: tenant.primaryColorRef.withValues(alpha: 0.6),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bibLabel,
                      style: TextStyle(
                        color: tenant.primaryColorRef,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      runner.dorsal,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              )
            else
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          tenant.primaryColorRef.withValues(alpha: 0.35),
                          tenant.secondaryColorRef.withValues(alpha: 0.15),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isCurrentRunner
                            ? tenant.primaryColorRef
                            : tenant.primaryColorRef.withValues(alpha: 0.45),
                        width: 1.2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        runner.initials,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: -2,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00C853),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF141414),
                          width: 1.5,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(width: 14),

            // 2. Runner Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Full Name + "TÚ" chip + Trailing Circuit Chip
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                runner.fullName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (isCurrentRunner) ...[
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: tenant.primaryColorRef,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'TÚ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Circuit Badge Chip (top right)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: tenant.primaryColorRef.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: tenant.primaryColorRef.withValues(alpha: 0.4),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          runner.circuito,
                          style: TextStyle(
                            color: tenant.primaryColorRef.computeLuminance() < 0.15
                                ? Colors.white
                                : tenant.primaryColorRef,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Row 2: Category
                  Row(
                    children: [
                      Icon(
                        runner.sexo == 'F' ||
                                runner.categoria.toLowerCase().contains('mujer')
                            ? Icons.female_rounded
                            : (runner.sexo == 'M' ||
                                    runner.categoria
                                        .toLowerCase()
                                        .contains('hombre')
                                ? Icons.male_rounded
                                : Icons.emoji_events_outlined),
                        size: 13,
                        color: Colors.white.withValues(alpha: 0.5),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          runner.categoria,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Row 3: Location + Training Group + Accredited status dot
                  Row(
                    children: [
                      if (runner.location.isNotEmpty) ...[
                        Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Colors.white.withValues(alpha: 0.45),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          runner.location,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      if (runner.grupoEntrenamiento != null &&
                          runner.grupoEntrenamiento!.isNotEmpty) ...[
                        Text(
                          ' • ',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            runner.grupoEntrenamiento!,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 11,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ] else
                        const Spacer(),

                      // Accredited Status Tag
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Color(0xFF00E676),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Acreditado',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.45),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

