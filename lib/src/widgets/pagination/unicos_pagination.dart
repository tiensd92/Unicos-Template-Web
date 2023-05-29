import 'package:flutter/material.dart';
import 'package:unicos_template/unicos_template.dart';

class UnicosPagination extends StatelessWidget {
  final UnicosPaginationViewModel viewModel;

  const UnicosPagination({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFB9BBBD),
            ),
          ),
          child: UnicosDrawable.prevIcon.svg(),
        ),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFB9BBBD),
            ),
          ),
          child: Row(
            children:
                List.generate(viewModel.end - viewModel.start + 1, (index) {
              final value = viewModel.start + index;

              if (value == viewModel.current) {
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
                onTap: () {},
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
        const SizedBox(width: 10),
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: const Color(0xFFB9BBBD),
            ),
          ),
          child: UnicosDrawable.nextIcon.svg(),
        ),
      ],
    );
  }
}
