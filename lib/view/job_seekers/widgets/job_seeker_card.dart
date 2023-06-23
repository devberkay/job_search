import 'package:JobSearch/model/data/user_model.dart';
import 'package:JobSearch/model/provider/storage/file_download_url_provider.dart';
import 'package:JobSearch/model/utils/capitalize_text_input_formatter.dart';
import 'package:JobSearch/model/utils/flushbar_extension.dart';
import 'package:JobSearch/model/utils/word_by_word_formatter.dart';
import 'package:JobSearch/view/profile/widgets/profile_age_dropdown_button.dart';
import 'package:JobSearch/view/profile/widgets/profile_sex_dropdown_button.dart';
import 'package:JobSearch/view/shared/headless_cupertino_button.dart';
import 'package:JobSearch/view/shared/profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:html' as html;
class JobSeekerCard extends HookConsumerWidget {
  const JobSeekerCard({super.key,required this.userModel});
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
    //boo
    final downloadUrl =
        ref.watch(fileDownloadUrlProvider("/users/${userModel.uid}/cv"));
    // ignore: no_leading_underscores_for_local_identifiers
    return downloadUrl.when(data: (_downloadUrl) {
      if (_downloadUrl != null) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          children: [
            Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Spacer(),
                  HookConsumer(builder: (context, ref, child) {
                    final opacityNotifier = useValueNotifier(0.0);

                    return MouseRegion(
                        onExit: (event) {
                          opacityNotifier.value = 0.0;
                        },
                        onEnter: (event) {
                          opacityNotifier.value = 1.0;
                        },
                        child: Stack(
                          children: [
                            ProfileAvatar(radius: 75, userId: userModel.uid),
                          ],
                        ));
                  }),
                  
                  const Spacer()
                ],
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bio",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                const SizedBox(height: 10),
                CupertinoTextField(
                  readOnly: true,
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
                        readOnly: true,
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
                        readOnly: true,
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
                        readOnly: true,
                        maxLines: 1,
                        maxLength: 25,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                        placeholder:
                            "Enter your phone number with country code",
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
                        readOnly: true,
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
                      IgnorePointer(
                          child: ProfileAgeDropdownButton(
                              draftUserModelNotifier: draftUserModelNotifier))
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
                      IgnorePointer(
                          child: ProfileSexDropdownButton(
                              draftUserModelNotifier: draftUserModelNotifier))
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
                        Expanded(
                          flex: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Skills & Qualifications",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              CupertinoTextField(
                                readOnly: true,
                                inputFormatters: [WordByWordInputFormatter()],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                                prefix: Icon(
                                  Icons.add,
                                  color: Colors.grey.shade500.withOpacity(0.75),
                                ),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    Colors.grey.shade400.withOpacity(0.5),
                                maxLines: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: skillsController,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 9),
                        Expanded(
                          flex: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Position title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              CupertinoTextField(
                                readOnly: true,
                                inputFormatters: [
                                  CapitalizeTextInputFormatter()
                                ],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                                prefix: Icon(
                                  Icons.add,
                                  color: Colors.grey.shade500.withOpacity(0.75),
                                ),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    Colors.grey.shade400.withOpacity(0.5),
                                maxLines: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: positionTitleController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 48,
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
                                      side: BorderSide(
                                          color: Colors.grey.shade400),
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      deleteButtonTooltipMessage:
                                          "Remove filter",
                                    );
                                  }).toList(),
                                );
                              }),
                        ),
                        const Spacer(flex: 9),
                        Expanded(
                            flex: 48,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("Job seeking status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FittedBox(
                                    child: ValueListenableBuilder(
                                        valueListenable: draftUserModelNotifier,
                                        builder: (context, _, __) {
                                          return IgnorePointer(
                                            child: CupertinoSwitch(
                                                value: draftUserModelNotifier
                                                    .value.isSeekingJob,
                                                activeColor:
                                                    Colors.greenAccent.shade700,
                                                trackColor:
                                                    Colors.grey.shade400,
                                                onChanged: (value) {
                                                  draftUserModelNotifier.value =
                                                      draftUserModelNotifier
                                                          .value
                                                          .copyWith(
                                                              isSeekingJob:
                                                                  value);
                                                }),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        );
      } else {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          children: [
            Container(
              height: 150,
              width: 150,
              alignment: Alignment.center,
              child: Row(
                children: [
                  const Spacer(),
                  HookConsumer(builder: (context, ref, child) {
                    final opacityNotifier = useValueNotifier(0.0);

                    return MouseRegion(
                        onExit: (event) {
                          opacityNotifier.value = 0.0;
                        },
                        onEnter: (event) {
                          opacityNotifier.value = 1.0;
                        },
                        child: Stack(
                          children: [
                            ProfileAvatar(radius: 75, userId: userModel.uid),
                          ],
                        ));
                  }),
                  const SizedBox(width: 25),
                  HookConsumer(builder: (context, ref, child) {
                    final opacityNotifier = useValueNotifier(0.0);

                    return MouseRegion(
                        onExit: (event) {
                          opacityNotifier.value = 0.0;
                        },
                        onEnter: (event) {
                          opacityNotifier.value = 1.0;
                        },
                        child: HeadlessCupertinoButton(
                          onPressed: () async {
                            context.showErrorFlushbar(
                                "User has no CV file uploaded");
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 2)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("CV",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 75,
                                            fontWeight: FontWeight.w900)),
                                    Icon(Icons.download,
                                        color: Colors.black, size: 25)
                                  ],
                                ),
                              ),
                              ValueListenableBuilder(
                                  valueListenable: opacityNotifier,
                                  builder: (context, opacity, child) {
                                    return AnimatedOpacity(
                                        opacity: opacity,
                                        curve: Curves.easeOut,
                                        duration:
                                            const Duration(milliseconds: 250),
                                        child: Container(
                                            width: 150,
                                            height: 150,
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.75),
                                                shape: BoxShape.circle),
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  "Download CV",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(height: 5),
                                                Icon(
                                                  Icons.file_download,
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
                  const Spacer()
                ],
              ),
            ),
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bio",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                const SizedBox(height: 10),
                CupertinoTextField(
                  readOnly: true,
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
                        readOnly: true,
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
                        readOnly: true,
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
                        readOnly: true,
                        maxLines: 1,
                        maxLength: 25,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w600),
                        placeholder:
                            "Enter your phone number with country code",
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
                        readOnly: true,
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
                      IgnorePointer(
                          child: ProfileAgeDropdownButton(
                              draftUserModelNotifier: draftUserModelNotifier))
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
                      IgnorePointer(
                          child: ProfileSexDropdownButton(
                              draftUserModelNotifier: draftUserModelNotifier))
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
                        Expanded(
                          flex: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Skills & Qualifications",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              CupertinoTextField(
                                readOnly: true,
                                inputFormatters: [WordByWordInputFormatter()],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                                prefix: Icon(
                                  Icons.add,
                                  color: Colors.grey.shade500.withOpacity(0.75),
                                ),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    Colors.grey.shade400.withOpacity(0.5),
                                maxLines: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: skillsController,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 9),
                        Expanded(
                          flex: 48,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Position title",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              CupertinoTextField(
                                readOnly: true,
                                inputFormatters: [
                                  CapitalizeTextInputFormatter()
                                ],
                                style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w600),
                                prefix: Icon(
                                  Icons.add,
                                  color: Colors.grey.shade500.withOpacity(0.75),
                                ),
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                cursorColor:
                                    Colors.grey.shade400.withOpacity(0.5),
                                maxLines: 1,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                controller: positionTitleController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 48,
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
                                      side: BorderSide(
                                          color: Colors.grey.shade400),
                                      labelStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                      deleteButtonTooltipMessage:
                                          "Remove filter",
                                    );
                                  }).toList(),
                                );
                              }),
                        ),
                        const Spacer(flex: 9),
                        Expanded(
                            flex: 48,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text("Job seeking status",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 16)),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: FittedBox(
                                    child: ValueListenableBuilder(
                                        valueListenable: draftUserModelNotifier,
                                        builder: (context, _, __) {
                                          return IgnorePointer(
                                            child: CupertinoSwitch(
                                                value: draftUserModelNotifier
                                                    .value.isSeekingJob,
                                                activeColor:
                                                    Colors.greenAccent.shade700,
                                                trackColor:
                                                    Colors.grey.shade400,
                                                onChanged: (value) {
                                                  draftUserModelNotifier.value =
                                                      draftUserModelNotifier
                                                          .value
                                                          .copyWith(
                                                              isSeekingJob:
                                                                  value);
                                                }),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 60),
          ],
        );
      }
    }, error: (e, st) {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        children: [
          Container(
            height: 150,
            width: 150,
            alignment: Alignment.center,
            child: Row(
              children: [
                const Spacer(),
                HookConsumer(builder: (context, ref, child) {
                  final opacityNotifier = useValueNotifier(0.0);

                  return MouseRegion(
                      onExit: (event) {
                        opacityNotifier.value = 0.0;
                      },
                      onEnter: (event) {
                        opacityNotifier.value = 1.0;
                      },
                      child: Stack(
                        children: [
                          ProfileAvatar(radius: 75, userId: userModel.uid),
                        ],
                      ));
                }),
                
                const Spacer()
              ],
            ),
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Bio",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
              const SizedBox(height: 10),
              CupertinoTextField(
                readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                      readOnly: true,
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
                    IgnorePointer(
                      child: ProfileAgeDropdownButton(
                          draftUserModelNotifier: draftUserModelNotifier),
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
                    const Text("Sex",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 16)),
                    const SizedBox(height: 10),
                    IgnorePointer(
                      child: ProfileSexDropdownButton(
                          draftUserModelNotifier: draftUserModelNotifier),
                    )
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
                      Expanded(
                        flex: 48,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Skills & Qualifications",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 16)),
                            const SizedBox(height: 10),
                            CupertinoTextField(
                              readOnly: true,
                              inputFormatters: [WordByWordInputFormatter()],
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600),
                              prefix: Icon(
                                Icons.add,
                                color: Colors.grey.shade500.withOpacity(0.75),
                              ),
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor:
                                  Colors.grey.shade400.withOpacity(0.5),
                              maxLines: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              controller: skillsController,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(flex: 9),
                      Expanded(
                        flex: 48,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Position title",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 16)),
                            const SizedBox(height: 10),
                            CupertinoTextField(
                              readOnly: true,
                              inputFormatters: [CapitalizeTextInputFormatter()],
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600),
                              prefix: Icon(
                                Icons.add,
                                color: Colors.grey.shade500.withOpacity(0.75),
                              ),
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.center,
                              cursorColor:
                                  Colors.grey.shade400.withOpacity(0.5),
                              maxLines: 1,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              controller: positionTitleController,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 48,
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
                                    side:
                                        BorderSide(color: Colors.grey.shade400),
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                    deleteButtonTooltipMessage: "Remove filter",
                                  );
                                }).toList(),
                              );
                            }),
                      ),
                      const Spacer(flex: 9),
                      Expanded(
                          flex: 48,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("Job seeking status",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: FittedBox(
                                  child: ValueListenableBuilder(
                                      valueListenable: draftUserModelNotifier,
                                      builder: (context, _, __) {
                                        return IgnorePointer(
                                          child: CupertinoSwitch(
                                              value: draftUserModelNotifier
                                                  .value.isSeekingJob,
                                              activeColor:
                                                  Colors.greenAccent.shade700,
                                              trackColor: Colors.grey.shade400,
                                              onChanged: (value) {
                                                draftUserModelNotifier.value =
                                                    draftUserModelNotifier.value
                                                        .copyWith(
                                                            isSeekingJob:
                                                                value);
                                              }),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      );
    }, loading: () {
      return const Center(
        child: SpinKitRing(
          size: 20,
          lineWidth: 3,
          duration: Duration(milliseconds: 500),
          color: Colors.white,
        ),
      );
    });
  }
}
