import 'package:flutter/material.dart';
import 'package:flutter_architecture_samples/flutter_architecture_samples.dart';
import 'package:inherited_widget_sample/models.dart';

class FilterButton extends StatelessWidget {
  final PopupMenuItemSelected<VisibilityFilter> onSelected;
  final VisibilityFilter activeFilter;
  final bool isActive;

  FilterButton({this.onSelected, this.activeFilter, this.isActive, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultStyle = theme.textTheme.body1;
    final activeStyle = theme.textTheme.body1.copyWith(
      color: theme.accentColor,
    );

    return new AnimatedOpacity(
      opacity: isActive ? 1.0 : 0.0,
      duration: new Duration(milliseconds: 150),
      child: new PopupMenuButton<VisibilityFilter>(
        key: ArchSampleKeys.filterButton,
        tooltip: ArchSampleLocalizations.of(context).filterTodos,
        onSelected: onSelected,
        itemBuilder: (BuildContext context) {
          return <PopupMenuItem<VisibilityFilter>>[
            new PopupMenuItem<VisibilityFilter>(
              key: ArchSampleKeys.allFilter,
              value: VisibilityFilter.all,
              child: new Text(
                ArchSampleLocalizations.of(context).showAll,
                style: activeFilter == VisibilityFilter.all
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem<VisibilityFilter>(
              key: ArchSampleKeys.activeFilter,
              value: VisibilityFilter.active,
              child: new Text(
                ArchSampleLocalizations.of(context).showActive,
                style: activeFilter == VisibilityFilter.active
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
            new PopupMenuItem<VisibilityFilter>(
              key: ArchSampleKeys.completedFilter,
              value: VisibilityFilter.completed,
              child: new Text(
                ArchSampleLocalizations.of(context).showCompleted,
                style: activeFilter == VisibilityFilter.completed
                    ? activeStyle
                    : defaultStyle,
              ),
            ),
          ];
        },
        icon: new Icon(Icons.filter_list),
      ),
    );
  }
}
