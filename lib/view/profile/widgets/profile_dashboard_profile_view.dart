import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/auth/user_model_provider.dart';
import 'package:JobSearch/model/provider/auth/user_provider.dart';
import 'package:JobSearch/model/service/firestore/user_model_service_notifier.dart';
import 'package:JobSearch/model/service/storage/upload_service.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/view/profile/widgets/profile_age_dropdown_button.dart';
import 'package:JobSearch/view/profile/widgets/profile_sex_dropdown_button.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfileDashboardProfileView extends HookConsumerWidget {
  const ProfileDashboardProfileView({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draftUserModelNotifier = useValueNotifier(userModel);
    final skillsController = useTextEditingController();
    final positionTitleController =
        useTextEditingController(text: userModel.positionTitles.join(' '));
    final nameController = useTextEditingController(text: userModel.name);
    final lastNameController =
        useTextEditingController(text: userModel.surname);
    final phoneController = useTextEditingController(text: userModel.phone);
    final emailController = useTextEditingController(text: userModel.mail);
    final bioController = useTextEditingController(text: userModel.bio);
    final user = ref.watch(userProvider);
    final isSelf = userModel.uid == user!.uid;
    if (isSelf) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        children: [
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            child: HookConsumer(builder: (context, ref, child) {
              final opacityNotifier = useValueNotifier(0.0);
              final picker = ImagePicker();
              final cropper = ImageCropper();
              return MouseRegion(
                  onExit: (event) {
                    opacityNotifier.value = 0.0;
                  },
                  onEnter: (event) {
                    opacityNotifier.value = 1.0;
                  },
                  child: HeadlessCupertinoButton(
                    onPressed: () async {
                      try {
                        final xFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        // final rawPicture =
                        //     await xFile!.readAsBytes();
                        if (xFile != null) {
                          final croppedFile = await cropper
                              .cropImage(sourcePath: xFile.path, uiSettings: [
                            // ignore: use_build_context_synchronously
                            WebUiSettings(
                                context: context,
                                enableZoom: true,
                                enableResize: true,
                                viewPort: const CroppieViewPort(type: 'circle'))
                          ]);
                          final croppedImage = await croppedFile!.readAsBytes();
                          ref
                              .read(uploadServiceProvider.notifier)
                              .uploadPicture(
                                  rawPicture: croppedImage,
                                  userId: userModel.uid);
                        }
                      } catch (e) {
                        context
                            .showErrorFlushbar("Image could not be selected");
                      }

                      // ref.read
                    },
                    child: Stack(
                      children: [
                        ProfileAvatar(radius: 75, userId: userModel.uid),
                        ValueListenableBuilder(
                            valueListenable: opacityNotifier,
                            builder: (context, opacity, child) {
                              return AnimatedOpacity(
                                  opacity: opacity,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 250),
                                  child: Container(
                                      width: 150,
                                      height: 150,
                                      padding: EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.75),
                                          borderRadius:
                                              BorderRadius.circular(75)),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Upload photo",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(height: 5),
                                          Icon(
                                            Icons.file_upload_outlined,
                                            color: Colors.white,
                                            size: 25,
                                          )
                                        ],
                                      )));
                            }),
                      ],
                    ),
                  ));
            }),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bio",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              const SizedBox(height: 10),
              CupertinoTextField(
                onChanged: (value) {
                  draftUserModelNotifier.value =
                      draftUserModelNotifier.value.copyWith(bio: value);
                },
                maxLines: 5,
                placeholder: "Write something about yourself",
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
                controller: bioController,
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Name",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    CupertinoTextField(
                      onChanged: (value) {
                        draftUserModelNotifier.value =
                            draftUserModelNotifier.value.copyWith(name: value);
                      },
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                      placeholder: "Enter your name",
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400),
                      maxLines: 1,
                      maxLength: 20,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: nameController,
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Last name",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    CupertinoTextField(
                      onChanged: (value) {
                        draftUserModelNotifier.value = draftUserModelNotifier
                            .value
                            .copyWith(surname: value);
                      },
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                      placeholder: "Enter your last name",
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400),
                      maxLines: 1,
                      maxLength: 25,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: lastNameController,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Phone",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    CupertinoTextField(
                      onChanged: (value) {
                        draftUserModelNotifier.value =
                            draftUserModelNotifier.value.copyWith(phone: value);
                      },
                      maxLines: 1,
                      maxLength: 25,
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                      placeholder: "Enter your phone number with country code",
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: phoneController,
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Mail",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    CupertinoTextField(
                      onChanged: (value) {
                        draftUserModelNotifier.value =
                            draftUserModelNotifier.value.copyWith(mail: value);
                      },
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600),
                      placeholder: "Enter your mail address",
                      placeholderStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400),
                      maxLines: 1,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: emailController,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Age",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    ProfileAgeDropdownButton(
                        draftUserModelNotifier: draftUserModelNotifier)
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sex",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    ProfileSexDropdownButton(
                        draftUserModelNotifier: draftUserModelNotifier)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Text("Skills & Qualifications",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16)),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: CupertinoTextField(
                          onSubmitted: (value) {
                            draftUserModelNotifier.value = draftUserModelNotifier
                                .value
                                .copyWith(skills: value);
                          },
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w600),
                          prefix: Icon(
                            Icons.add,
                            color: Colors.grey.shade500.withOpacity(0.75),
                          ),
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.grey.shade400.withOpacity(0.5),
                          maxLines: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          controller: skillsController,
                        ),
                      ),
                      Spacer(flex: 4)
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 4,
                  child: ValueListenableBuilder(
                      valueListenable: draftUserModelNotifier,
                      builder: (context, _, __) {
                        return Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: draftUserModelNotifier.value.skills
                              .map<Widget>((e) {
                            return Chip(
                              label: Text(e),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.grey.shade400),
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              onDeleted: () {},
                              deleteButtonTooltipMessage: "Remove filter",
                              deleteIcon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                            );
                          }).toList(),
                        );
                      }),
                )
              ],
            ),
          ),
          const SizedBox(height: 90),
          ValueListenableBuilder(
              valueListenable: draftUserModelNotifier,
              builder: (context, draftModel, child) {
                return FilledCupertinoButton(
                    onPressed: () {
                      if (draftModel != userModel) {
                        ref
                            .read(userModelServiceProvider.notifier)
                            .updateUserModel(draftUserModelNotifier.value);
                      }
                    },
                    height: 50,
                    width: 150,
                    fillColor: (draftModel != userModel)
                        ? Colors.blueAccent
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                    child: HookConsumer(builder: (context, ref, child) {
                      final isUpdating = ref.watch(userModelServiceProvider);
                      return isUpdating.when(data: (_) {
                        return Text("Save changes",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: (draftModel != userModel)
                                    ? Colors.white
                                    : Colors.grey.shade400));
                      }, error: (e, st) {
                        return const Center(
                          child: SpinKitRing(
                            size: 15,
                            lineWidth: 3,
                            duration: Duration(milliseconds: 500),
                            color: Colors.white,
                          ),
                        );
                      }, loading: () {
                        return const Center(
                          child: SpinKitRing(
                            size: 15,
                            lineWidth: 3,
                            duration: Duration(milliseconds: 500),
                            color: Colors.white,
                          ),
                        );
                      });
                    }));
              }),
        ],
      );
    } else {
      return Container();
    }
  }
}
