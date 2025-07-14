import 'package:claryft_components/claryft_components.dart';
import 'package:flutter/material.dart';

class PaginationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final ValueChanged<int> onPageChanged;
  final int visiblePageCount;

  const PaginationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.visiblePageCount = 5,
  });

  List<int> getVisiblePages() {
    int half = (visiblePageCount / 2).floor();

    int start = currentPage - half;
    int end = currentPage + half;

    if (start < 1) {
      end += (1 - start);
      start = 1;
    }

    if (end > totalPages) {
      start -= (end - totalPages);
      end = totalPages;
    }

    start = start < 1 ? 1 : start;

    return List.generate(end - start + 1, (index) => start + index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = getVisiblePages();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          tooltip: 'Previous page',
          onPressed: currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
        ),
        ...pages.map((page) {
          final isActive = page == currentPage;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: isActive ? AppColors.primaryColor : null,
                foregroundColor: isActive ? AppColors.whiteColor : AppColors.blackColor.withValues(alpha: 0.7),
                minimumSize: const Size(40, 36),
              ),
              onPressed: () => onPageChanged(page),
              child: Text('$page'),
            ),
          );
        }),
        IconButton(
          icon: const Icon(Icons.chevron_right_rounded),
          onPressed: currentPage < totalPages ? () => onPageChanged(currentPage + 1) : null,
        ),
      ],
    );
  }
}
