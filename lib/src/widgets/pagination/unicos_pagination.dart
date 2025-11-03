import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

part 'unicos_pagination.uimodel.dart';

class UnicosPagination extends StatelessWidget {
  final UnicosPaginationUIModel model;
  final ValueChanged<int>? onToPage;

  const UnicosPagination({super.key, required this.model, this.onToPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: model.current != model.start,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFB9BBBD)),
              ),
              child: UnicosDrawable.prevIcon.svg(),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFB9BBBD)),
          ),
          child: Row(
            children: List.generate(model.end - model.start + 1, (index) {
              final value = model.start + index;

              if (value == model.current) {
                return Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFF00A389),
                  ),
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                );
              }

              return InkWell(
                onTap: onToPage != null && value != model.current
                    ? () {
                        onToPage?.call(value);
                      }
                    : null,
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF464255),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        Visibility(
          visible: model.current != model.end,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFB9BBBD)),
              ),
              child: UnicosDrawable.nextIcon.svg(),
            ),
          ),
        ),
      ],
    );
  }
}
