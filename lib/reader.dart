import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mushaf_hafs/vertical_page.dart';

import 'data.dart';
import 'horizontal_page.dart';
import 'pageinfo.dart';

class ReaderWidget extends ConsumerWidget {
  const ReaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () => {
                  ref.read(showPageInfoProvider)
                      ? ref.read(showPageInfoProvider.notifier).state = false
                      : ref.read(showPageInfoProvider.notifier).state = true,
                },
                child: OrientationBuilder(
                  builder: (context, orientation) {
                    return orientation == Orientation.portrait
                        ? const HorizontalPage()
                        : const VerticalPage();
                  },
                ),
              ),
              const MyPageInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
