import 'package:JobSearch/model/service/firestore/job_notifier.dart';
import 'package:JobSearch/view/home/widgets/remote_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBox extends HookConsumerWidget {
  const SearchBox({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final whatDoYouWantToDoNotifier = useValueNotifier<String?>(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 45,
            ),
            Text("Role",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            SizedBox(
              width: 160,
            ),
            Text("Where",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            Spacer(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 500,
          height: 60,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60 / 2),
              border: Border.all(color: Colors.grey.shade400, width: 2)),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.grey.shade500,
                size: 20,
              ),
              Expanded(
                  flex: 4,
                  child: CupertinoTextField(
                      onChanged: (value) {
                        whatDoYouWantToDoNotifier.value = value;
                      },
                      placeholder: "Software Engineer",
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 0),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60 / 2),
                              bottomLeft: Radius.circular(60 / 2))),
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400))),
              Container(
                height: 60,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.symmetric(
                        vertical:
                            BorderSide(color: Colors.grey.shade400, width: 2))),
                child: Text(
                  "in",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: CupertinoTextField(
                      placeholder: "Famagusta,CY",
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.transparent, width: 0),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(60 / 2),
                              bottomRight: Radius.circular(60 / 2))),
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400))),
              TextButton(
                onPressed: () {
                  if(whatDoYouWantToDoNotifier.value != null) {
                     ref
                      .read(whatDoYouWantToDoListProvider.notifier)
                      .add(whatDoYouWantToDoNotifier.value!.split(' '));
                      
                  }
                  
                  context.go("/jobs");
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(60 / 2)))),
                    fixedSize: const MaterialStatePropertyAll(Size(75, 60)),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.hovered)) {
                        return Colors.white;
                      }
                      return Colors.black;
                    }),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed) ||
                          states.contains(MaterialState.hovered)) {
                        return Colors.blueAccent.shade700;
                      } else {
                        return Colors.white;
                      }
                    })),
                child: const Text("Search"),
              )
            ],
          ),
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 45,
            ),
            SizedBox(
              width: 180,
            ),
            RemoteCheckbox(),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
