import 'package:dessert_meal_app/src/tools/state_management/mixins/vanilla_utils_mixin.dart';
import 'package:dessert_meal_app/src/tools/tools_barrel.dart';
import 'package:vanilla_state/vanilla_state.dart';

base class Presenter<State extends PresenterState> = VanillaNotifier<State>
    with BasicErrorHandlerMixin, VanillaUtilsMixin<State>;
