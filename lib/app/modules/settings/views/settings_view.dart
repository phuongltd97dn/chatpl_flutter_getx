import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/modules/settings/views/feedback/feedback_view.dart';
import 'package:chat_pl/app/modules/settings/views/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: Strings.settings),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SettingsHeaderWidget(),
          SizedBox(height: 10.h),
          SettingsMenuWidget(
            title: Strings.support,
            items: <MenuItemWidget>[
              MenuItemWidget(
                text: Strings.feedback,
                icon: AppImages.icConversation,
                onTap: () => Get.to(() => const FeedbackView()),
              ),
              MenuItemWidget(
                text: Strings.restorePurchase,
                icon: AppImages.icRestore,
                onTap: () {},
              ),
            ],
          ),
          SettingsMenuWidget(
            title: Strings.about,
            items: <MenuItemWidget>[
              MenuItemWidget(
                text: Strings.rateUs,
                icon: AppImages.icStar,
                onTap: () {},
              ),
              MenuItemWidget(
                text: Strings.termsOfUse,
                icon: AppImages.icTermsOfUse,
                onTap: () {},
              ),
              MenuItemWidget(
                text: Strings.privacyPolicy,
                icon: AppImages.icPersonWithShield,
                onTap: () {},
              ),
              MenuItemWidget(
                text: Strings.shareWithFriends,
                icon: AppImages.icShareSettings,
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
