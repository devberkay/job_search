import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileDashboardCreateJobPostView extends HookConsumerWidget {
  const ProfileDashboardCreateJobPostView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleNotifier = useValueNotifier<String?>(null);
    final aboutJobNotifier = useValueNotifier<String?>(null);
    final minimumQualificationsNotifier = useValueNotifier<List<String>?>(null);
    final preferredQualificationsNotifier= useValueNotifier<List<String>?>(null);
    final responsibilitiesNotifier = useValueNotifier<List<String>?>(null);
    final degreeNotifier = useValueNotifier<String?>(null);
    final jobTypeNotifier = useValueNotifier<String?>(null);
    final isRemoteNotifier= useValueNotifier<String?>(null);
    final organizationNotifier = useValueNotifier<String?>(null);
    final longitudeNotifier = useValueNotifier<double?>(null);
    final latitudeNotifier = useValueNotifier<double?>(null);
    final salaryPerHourNotifier = useValueNotifier<double?>(null);
    final questionnaireNotifier = useValueNotifier<List<String>?>(null);

    // final titleController = useTextEditingController();
    // final aboutJobController = useTextEditingController();
    final minimumQualificationsController = useTextEditingController(); // onSubmitted
    final preferredQualificationsController = useTextEditingController(); // onSubmitted
    final responsibilitiesController = useTextEditingController(); // onSubmitted
    // final organizationController = useTextEditingController();
    // final longitudeController = useTextEditingController();
    // final latitudeController = useTextEditingController();
    final questionnaireController = useTextEditingController(); // onSubmitted
    
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("About job",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
            const SizedBox(height: 10),
            CupertinoTextField(
              onChanged: (value) {
                
              },
              maxLines: 5,
              placeholder: "Describe the job",
              style: TextStyle(
                  color: Colors.grey.shade600, fontWeight: FontWeight.w600),
              placeholderStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade400),
              maxLength: 500,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              
            )
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
