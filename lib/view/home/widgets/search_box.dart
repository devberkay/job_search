import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBox extends HookConsumerWidget {
  const SearchBox({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              width: 141,
            ),
            Text("Where",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            Spacer(),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: 450,
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
                color: Colors.grey.shade200,
                height: 60,
                width: 45,
                alignment: Alignment.center,
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
                onPressed: () {},
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
        )
      ],
    );
  }
}
