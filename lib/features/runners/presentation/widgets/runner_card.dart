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
            : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isCurrentRunner
              ? tenant.primaryColorRef
              : Colors.white.withValues(alpha: 0.08),
          width: isCurrentRunner ? 1.5 : 1.0,
        ),
        boxShadow: isCurrentRunner
            ? [
                BoxShadow(
                  color: tenant.primaryColorRef.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bib / Dorsal Box
            Container(
              constraints: const BoxConstraints(minWidth: 54),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: runner.hasDorsal
                    ? tenant.primaryColorRef.withValues(alpha: 0.15)
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: runner.hasDorsal
                      ? tenant.primaryColorRef.withValues(alpha: 0.6)
                      : Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    bibLabel,
                    style: TextStyle(
                      color: runner.hasDorsal
                          ? tenant.primaryColorRef
                          : Colors.white54,
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    runner.hasDorsal ? runner.dorsal : '-',
                    style: TextStyle(
                      color: runner.hasDorsal ? Colors.white : Colors.white38,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),

            // Runner Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          runner.fullName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
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
                  const SizedBox(height: 4),

                  // Circuito and Category details
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          runner.circuito,
                          style: TextStyle(
                            color: tenant.primaryColorRef,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          runner.categoria,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Optional Location & Training Group row
                  if ((runner.ciudad != null && runner.ciudad!.isNotEmpty) ||
                      (runner.grupoEntrenamiento != null &&
                          runner.grupoEntrenamiento!.isNotEmpty)) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        if (runner.ciudad != null && runner.ciudad!.isNotEmpty) ...[
                          Icon(
                            Icons.location_on_outlined,
                            size: 11,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            runner.ciudad!,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.5),
                              fontSize: 10,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (runner.grupoEntrenamiento != null &&
                              runner.grupoEntrenamiento!.isNotEmpty)
                            Text(
                              ' • ',
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.3),
                                fontSize: 10,
                              ),
                            ),
                        ],
                        if (runner.grupoEntrenamiento != null &&
                            runner.grupoEntrenamiento!.isNotEmpty) ...[
                          Icon(
                            Icons.groups_outlined,
                            size: 11,
                            color: Colors.white.withValues(alpha: 0.45),
                          ),
                          const SizedBox(width: 3),
                          Expanded(
                            child: Text(
                              runner.grupoEntrenamiento!,
                              style: TextStyle(
                                color: Colors.white.withValues(alpha: 0.5),
                                fontSize: 10,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
