part of 'nav_bar.dart';

class UnicosNavBarItem {
  final Widget icon;
  final Widget? iconActive;
  final String label;

  UnicosNavBarItem({required this.label, required this.icon, this.iconActive});
}

const double _kNavBarItemHeight = 60;

class _UnicosNavBarItem extends StatelessWidget {
  final Widget icon;
  final Widget? iconActive;
  final String label;
  final bool selected;
  final VoidCallback? onSelected;

  const _UnicosNavBarItem({
    required this.icon,
    this.iconActive,
    required this.label,
    this.selected = false,
    Key? key,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navBarTheme = Theme.of(context).extension<UnicosNavBarTheme>()!;

    return InkWell(
      onTap: () {
        if (selected) {
          return;
        }

        onSelected?.call();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 34, top: 16, bottom: 26),
        child: Row(
          children: [
            selected ? iconActive ?? icon : icon,
            const SizedBox(width: 17),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: selected
                    ? navBarTheme.activeTextStyle
                    : navBarTheme.textStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
