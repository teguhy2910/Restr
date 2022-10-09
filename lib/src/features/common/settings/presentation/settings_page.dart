import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restr/src/constants/constants.dart';
import 'package:restr/src/features/scheduling/application/scheduling_controller.dart';
import 'package:restr/src/shared/helper/helper.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h20,
              Text(
                'Settings',
                style: AppThemes.headline2,
              ),
              Gap.h20,
              ListTile(
                title: Text(
                  'Scheduling Restaurants',
                  style: AppThemes.text1,
                ),
                trailing: Consumer(
                  builder: (context, ref, _) {
                    final scheduled = ref.watch(schedulingProvider);
                    return Switch.adaptive(
                      value: scheduled,
                      onChanged: (value) async {
                        if (Platform.isIOS) {
                          customDialog(context);
                        } else {
                          ref
                              .read(schedulingProvider.notifier)
                              .scheduledRestaurants(value);
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
