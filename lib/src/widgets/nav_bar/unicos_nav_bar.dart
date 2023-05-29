part of 'nav_bar.dart';

class UnicosNavBar extends StatelessWidget {
  final List<UnicosNavBarItem> items;
  final Widget? header;

  const UnicosNavBar({
    Key? key,
    this.header,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: header,
              ),
        _UnicosNavBarItems(
          items: items,
        ),
      ],
    );
  }
}

class _UnicosNavBarItems extends StatefulWidget {
  final List<UnicosNavBarItem> items;

  const _UnicosNavBarItems({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UnicosNavBarItemsState();
}

class _UnicosNavBarItemsState extends State<_UnicosNavBarItems> {
  double _top = 0;
  int _selectedIndex = 0;
  Duration _duration = const Duration(milliseconds: 200);
  int _selectedIndexTemp = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: widget.items.map(
            (e) {
              final index = widget.items.indexOf(e);
              return _UnicosNavBarItem(
                icon: e.icon,
                label: e.label,
                iconActive: e.iconActive,
                selected: _selectedIndex == index,
                onSelected: () {
                  _selectedIndexTemp = index;
                  final count = (index - _selectedIndex).abs();

                  setState(() {
                    _duration =
                        Duration(milliseconds: count == 1 ? 100 : count * 50);
                    _top = index * _kNavBarItemHeight + index * 10;
                  });
                },
              );
            },
          ).toList(),
        ),
        AnimatedPositioned(
          left: 0,
          right: 0,
          top: _top,
          height: _kNavBarItemHeight,
          duration: _duration,
          child: const UnicosHoverNavBar(),
          onEnd: () {
            setState(() {
              _selectedIndex = _selectedIndexTemp;
            });
          },
        ),
      ],
    );
  }
}
