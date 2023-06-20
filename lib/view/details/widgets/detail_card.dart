import 'package:JobSearch/model/data/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailCard extends HookConsumerWidget {
  const DetailCard({super.key,required this.selectedJobModel});
  final JobModel selectedJobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const companyEmoji = '\u{1F3E2}'; // display if on-site
    const locationEmoji = '\u{1F4CD}';
    const computerEmoji = '\u{1F4BB}'; // display if remote
    const moneyEmoji = '\u{1F4B5}';
    const applicantsEmoji = '\u{1F464}';
    final usDollarGreen = const Color(0xFF008543);

    final isHovering = useState(false);
    return MouseRegion(
        cursor: SystemMouseCursors.basic,
        onEnter: (event) {
          isHovering.value = true;
        },
        onExit: (event) {
          isHovering.value = false;
        },
        child: AnimatedContainer(
          clipBehavior: Clip.none,
          duration: const Duration(milliseconds: 250),
          transformAlignment: Alignment.center,
          // transform: isHovering.value
          //     ? Matrix4.identity().scaled(1.01)
          //     : Matrix4.identity(),
          curve: Curves.easeOut,
          
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(
                        isHovering.value ? -1 : 0, isHovering.value ? -1 : 0),
                    blurRadius: isHovering.value ? 1.25 : 0,
                    spreadRadius: isHovering.value ? 1.25 : 0),
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(
                        isHovering.value ? 1 : 0, isHovering.value ? 1 : 0),
                    blurRadius: isHovering.value ? 1.25 : 0,
                    spreadRadius: isHovering.value ? 1.25 : 0)
              ]),
        ));
  }
}
