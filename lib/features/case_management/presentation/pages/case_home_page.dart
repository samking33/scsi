import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scsi/app/providers.dart';
import 'package:scsi/core/domain/entities/officer.dart';
import 'package:scsi/core/domain/value_objects/ids.dart';
import 'package:scsi/core/domain/value_objects/timestamp.dart';
import 'package:scsi/features/case_management/domain/entities/case_file.dart';
import 'package:scsi/features/case_management/presentation/pages/case_detail_page.dart';

final casesProvider = FutureProvider((ref) async {
  final repo = ref.read(caseRepositoryProvider);
  return repo.listCases();
});

class CaseHomePage extends ConsumerWidget {
  const CaseHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final casesAsync = ref.watch(casesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart CSI'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => const AiServerDialog(),
              );
            },
          ),
        ],
      ),
      body: casesAsync.when(
        data: (cases) {
          if (cases.isEmpty) {
            return const Center(
              child: Text('No cases loaded. Tap + to create one.'),
            );
          }
          return ListView.separated(
            itemCount: cases.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = cases[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(
                  '${item.createdAt.utc.toLocal()} • ${item.leadOfficer.fullName}',
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CaseDetailPage(caseFile: item),
                    ),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showCreateCaseDialog(context, ref);
          ref.invalidate(casesProvider);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateCaseDialog(BuildContext context, WidgetRef ref) async {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final jurisdictionController = TextEditingController();
    final officerNameController = TextEditingController();
    final officerBadgeController = TextEditingController();
    final officerAgencyController = TextEditingController();
    final officerRankController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Case'),
        content: SizedBox(
          width: 420,
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Case Title'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                  ),
                  TextFormField(
                    controller: jurisdictionController,
                    decoration: const InputDecoration(labelText: 'Jurisdiction'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: officerNameController,
                    decoration: const InputDecoration(labelText: 'Officer Name'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: officerBadgeController,
                    decoration: const InputDecoration(labelText: 'Badge Number'),
                  ),
                  TextFormField(
                    controller: officerAgencyController,
                    decoration: const InputDecoration(labelText: 'Agency'),
                  ),
                  TextFormField(
                    controller: officerRankController,
                    decoration: const InputDecoration(labelText: 'Rank'),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (!formKey.currentState!.validate()) return;

              final locationService = ref.read(locationServiceProvider);
              final location = await locationService.currentLocation();
              if (location == null) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Location permission required.')),
                  );
                }
                return;
              }

              final device =
                  await ref.read(deviceInfoServiceProvider).fetchDeviceInfo();
              final officer = Officer(
                id: IdFactory.newOfficerId(),
                fullName: officerNameController.text.trim(),
                badgeNumber: officerBadgeController.text.trim(),
                agency: officerAgencyController.text.trim(),
                rank: officerRankController.text.trim(),
              );

              final caseFile = CaseFile(
                id: IdFactory.newCaseId(),
                title: titleController.text.trim(),
                description: descriptionController.text.trim().isEmpty
                    ? null
                    : descriptionController.text.trim(),
                jurisdiction: jurisdictionController.text.trim().isEmpty
                    ? null
                    : jurisdictionController.text.trim(),
                createdAt: Timestamp.nowUtc(),
                leadOfficer: officer,
                createdOnDevice: device,
                initialLocation: location,
              );

              await ref.read(caseRepositoryProvider).addCase(caseFile);
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}

class AiServerDialog extends ConsumerStatefulWidget {
  const AiServerDialog({super.key});

  @override
  ConsumerState<AiServerDialog> createState() => _AiServerDialogState();
}

class _AiServerDialogState extends ConsumerState<AiServerDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    ref.read(settingsRepositoryProvider).load().then((settings) {
      _controller.text = settings.aiServerBaseUrl;
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('AI Server'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(
          labelText: 'Base URL',
          hintText: 'http://10.0.2.2:8000',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () async {
            await ref
                .read(settingsRepositoryProvider)
                .updateAiServerBaseUrl(_controller.text.trim());
            if (context.mounted) Navigator.of(context).pop();
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
