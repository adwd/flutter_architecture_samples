import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_sample/models/models.dart';
import 'package:redux_sample/selectors/selectors.dart';
import 'package:redux_sample/presentation/stats_counter.dart';

class Stats extends StatelessWidget {
  Stats({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return new StatsCounter(
          numActive: vm.numActive,
          numCompleted: vm.numCompleted,
        );
      },
    );
  }
}

class _ViewModel {
  final int numCompleted;
  final int numActive;

  _ViewModel({@required this.numCompleted, @required this.numActive});

  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(
      numActive: numActiveSelector(todosSelector(store.state)),
      numCompleted: numCompletedSelector(todosSelector(store.state)),
    );
  }
}
