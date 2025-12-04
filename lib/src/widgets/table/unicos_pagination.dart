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

  /// Generates the list of page numbers to display in the sliding window.
  ///
  /// This is much more efficient than generating a list from 1 to [total]
  /// and then taking a sublist.
  List<int> _getPageNumbers() {
    // Show a maximum of 5 page numbers in the window
    const int pagesToShow = 5;

    // If there are 5 or fewer total pages, just show all of them.
    if (total <= pagesToShow) {
      return List.generate(total, (index) => index + 1);
    }

    // Calculate start and end pages for the sliding window
    int startPage = current - 2;
    int endPage = current + 2;

    // Adjust window if it's near the start
    if (startPage <= 0) {
      startPage = 1;
      endPage = min(pagesToShow, total);
    }

    // Adjust window if it's near the end
    if (endPage > total) {
      endPage = total;
      startPage = max(1, total - pagesToShow + 1);
    }

    // Create the list of pages
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  @override
  Widget build(BuildContext context) {
    List<int> indexs = _getPageNumbers();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: indexs.last == total ? false : current > 2,
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
            itemCount: indexs.length,
          ),
        ),
        Visibility(
          visible: indexs.last == total ? false : current < total - 2,
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
