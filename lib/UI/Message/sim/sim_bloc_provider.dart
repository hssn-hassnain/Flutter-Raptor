import 'package:flutter/widgets.dart';
import 'sim_bloc.dart';

class SimCardsBlocProvider extends InheritedWidget {
  SimCardsBlocProvider({this.simCardBloc, @required Widget child})
      : assert(child != null),
        super(child: child);

  final SimCardsBloc simCardBloc;

  static SimCardsBloc of(BuildContext context) {
    // final provider = context.inheritFromWidgetOfExactType(SimCardsBlocProvider);
    // if (provider != null) {
    //   return (provider as SimCardsBlocProvider).simCardBloc;
    // }
//-----------In newer version useing this tune up 
       final provider = context.dependOnInheritedWidgetOfExactType<SimCardsBlocProvider>();
    // (SimCardsBlocProvider);
    if (provider != null) {
      return provider.simCardBloc;
  }
    return null;
  }

  @override
  bool updateShouldNotify(SimCardsBlocProvider old) {
    return simCardBloc != old.simCardBloc;
  }
}
