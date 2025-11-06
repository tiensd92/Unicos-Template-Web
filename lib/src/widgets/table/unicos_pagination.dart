part of 'table.dart';

class UnicosPagination extends StatelessWidget {
  final int total;
  final int current;
  final ValueChanged<int>? onToPage;
  final VoidCallback? onToStart;
  final VoidCallback? onToEnd;

  const UnicosPagination({
    super.key,
    this.total = 1,
    this.current = 1,
    this.onToPage,
    this.onToEnd,
    this.onToStart,
  });

  @override
  Widget build(BuildContext context) {
    final start = max(0, current >= total - 2 ? total - 4 : current - 2);
    final end = min(current == 1 ? 4 : current + 2, total);
    List<int> indexs = List.generate(
      total,
      (index) => index + 1,
    ).sublist(start, end);
    final itemCount = indexs.length;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: current > 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: _buildActionButton(
              child: UnicosDrawable.prevIcon.svg(),
              callback: onToStart,
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFB9BBBD)),
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final value = indexs[index];

              if (value == current) {
                return _buildPageButton(value);
              }

              return _buildPageButton(
                value,
                callback: () {
                  onToPage?.call(value);
                },
              );
            },
            itemCount: itemCount,
          ),
        ),
        Visibility(
          visible: current < total - 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: _buildActionButton(
              child: UnicosDrawable.nextIcon.svg(),
              callback: onToEnd,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton({required Widget child, VoidCallback? callback}) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: callback,
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFB9BBBD)),
        ),
        child: child,
      ),
    );
  }

  Widget _buildPageButton(int page, {VoidCallback? callback}) {
    if (callback == null) {
      return Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF00A389),
        ),
        child: Text(
          page.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          ),
        ),
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: callback,
      child: SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: Text(
            page.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF464255),
            ),
          ),
        ),
      ),
    );
  }
}

class UnicosTablePagination {
  final int total;
  final int current;
  final ValueChanged<int>? onToPage;
  final VoidCallback? onToStart;
  final VoidCallback? onToEnd;

  UnicosTablePagination({
    required this.total,
    required this.current,
    this.onToPage,
    this.onToStart,
    this.onToEnd,
  });
}
