import 'package:JobSearch/model/provider/auth/auth_notifier.dart';
import 'package:JobSearch/view/shared/auth_dialog_sign_in_tab.dart';
import 'package:JobSearch/view/shared/auth_dialog_sign_up_tab.dart';
import 'package:JobSearch/view/shared/filled_cupertino_button.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AuthDialog extends HookConsumerWidget {
  const AuthDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mailNotifier = useValueNotifier<String?>(null);
    final passwordNotifier = useValueNotifier<String?>(null);
    final nameNotifier = useValueNotifier<String?>(null);
    final surnameNotifier = useValueNotifier<String?>(null);
    final heightNotifier = useState(300.0);
    final _tabController = useTabController(initialLength: 2);
    ref.listen(authNotifierProvider, (prev, next) {
      next.when(data: (_data) {
        context.loaderOverlay.hide();
      }, error: (e, st) {
        context.loaderOverlay.hide();
      }, loading: () {
        context.loaderOverlay.show();
      });
    });
    useEffect(() {
      // ignore: prefer_function_declarations_over_variables
      final tabListener = () {
        if (_tabController.index == 1) {
          heightNotifier.value = 500;
        } else {
          heightNotifier.value = 300;
        }
      };
      _tabController.addListener(tabListener);
      return () {
        _tabController.removeListener(tabListener);
      };
    }, []);
    return Dialog(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: 400,
        height: heightNotifier.value,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: LayoutBuilder(builder: (context, constraints) {
                return TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.grey.shade300,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: _tabController.index == 0
                                ? Colors.black
                                : Colors.black45),
                      ),
                    ),
                    Tab(
                      child: Text("Sign up",
                          style: TextStyle(
                              color: _tabController.index == 1
                                  ? Colors.black
                                  : Colors.black45)),
                    ),
                  ],
                );
              }),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TabBarView(
                  controller: _tabController,
                  children:  [
                    // Sign In Tab Content
                    SignInTab(mailNotifier: mailNotifier,passwordNotifier: passwordNotifier,),
                    // Sign Up Tab Content
                    SignUpTab(nameNotifier: nameNotifier,surnameNotifier: surnameNotifier,mailNotifier: mailNotifier,passwordNotifier: passwordNotifier,)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilledCupertinoButton(
                  borderRadius: BorderRadius.zero,
                  onPressed: () {
                    if (_tabController.index == 0) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .signInWithMailAndPassword(email: mailNotifier.value,password: passwordNotifier.value);
                    } else {
                      ref
                          .read(authNotifierProvider.notifier)
                          .signUpWithMailAndPassword(email: mailNotifier.value,password: passwordNotifier.value,name: nameNotifier.value,surname: surnameNotifier.value);
                    }
                  },
                  height: 30,
                  width: double.maxFinite,
                  fillColor: Colors.blueAccent.shade700,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    )
                  ],
                  child: Text(_tabController.index == 0 ? "Sign in" : "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600))),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GoogleAuthButton(
                onPressed: () {
                  ref.read(authNotifierProvider.notifier).signInWithGoogle();
                },
                style: AuthButtonStyle(
                  borderRadius: 0,
                  splashColor: Colors.grey.shade200,
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  iconSize: 15,
                  height: 30,
                  width: double.maxFinite,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
