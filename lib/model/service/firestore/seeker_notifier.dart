import 'package:JobSearch/model/data/user_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final seekerSkillsListProvider =
    NotifierProvider.autoDispose<SeekerSkillsListNotifier, List<String>>(
        SeekerSkillsListNotifier.new);

class SeekerSkillsListNotifier extends AutoDisposeNotifier<List<String>> {
  @override
  build() {
    return [];
  }

  void add(List<String> value) {
    state = [...state, ...value];
  }

  void remove(String value) {
    state = [...state]..remove(value);
  }
}




class SeekerNotifier extends AsyncNotifier<List<UserModel>> {
  @override
  FutureOr<> build() {
    return ;
  }
}