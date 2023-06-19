import 'package:JobSearch/model/data/job_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JobCard extends HookConsumerWidget {
  const JobCard({super.key, required this.jobModel});
  final JobModel jobModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovering = useState(false);
    return MouseRegion(
      onEnter: (event) {
        isHovering.value = true;
      },
      onExit: (event) {
        isHovering.value = false;
      },
      child: InkWell(
          child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
        height: 350,
        width: 950,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: isHovering.value ? 10 : 2,
              offset: Offset(0, 5),
            )
          ],
        ),
      )),
    );
  }
}
