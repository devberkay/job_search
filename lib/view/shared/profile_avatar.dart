import 'dart:typed_data';

import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/provider/storage/raw_picture_provider.dart';
import 'package:JobSearch/model/provider/storage/storage_picture_provider.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class ProfileAvatar extends HookConsumerWidget {
  const ProfileAvatar({super.key, required this.radius, required this.userId});
  final double radius;
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rawData = ref.watch(
        rawPictureProvider(userId != null ? "users/$userId/profile" : null));
    return rawData.when(data: (rawData) {
      if (rawData != null) {
        debugPrint("heyyo-1");
        return CircleAvatar(
          radius: radius,
          backgroundImage: MemoryImage(rawData),
        );
      } else {
        debugPrint("heyyo-2");
        return Center(
          child: Container(
              height: radius * 2,
              width: radius * 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade600.withOpacity(0.25),
                  shape: BoxShape.circle),
              child:
                  Icon(Icons.person, color: Colors.black54, size: radius * 2)),
        );
      }
    }, error: (e, st) {
      debugPrint("heyyo-3 : ${e}");
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400.withOpacity(0.5),
        highlightColor: Colors.grey.shade100.withOpacity(0.5),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.25),
                shape: BoxShape.circle)),
      );
    }, loading: () {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade400.withOpacity(0.5),
        highlightColor: Colors.grey.shade100.withOpacity(0.5),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade600.withOpacity(0.25),
                shape: BoxShape.circle)),
      );
    });
  }
}
