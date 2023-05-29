class UnicosPaginationViewModel {
  final int start;
  final int end;
  final int current;

  UnicosPaginationViewModel({
    required this.start,
    required this.end,
    required this.current,
  })  : assert(start <= end),
        assert(start > 0),
        assert(current >= start && current <= end);

  factory UnicosPaginationViewModel.paging({
    required int total,
    required int current,
    bool isLoadMore = false,
  }) {
    if (current == 1 && !isLoadMore) {
      return UnicosPaginationViewModel(
        start: total <= 0 ? 0 : 1,
        end: total <= 0 ? 0 : 1,
        current: current,
      );
    }

    List<int> indexs = List.generate(total, (index) => index + 1);
    final endIndex = current + 4 >= total ? total - 1 : current + 4;
    final currentIndexs = indexs.sublist(endIndex - 4, endIndex + 1);

    return UnicosPaginationViewModel(
      start: currentIndexs.first,
      end: currentIndexs.last,
      current: current,
    );
  }
}
