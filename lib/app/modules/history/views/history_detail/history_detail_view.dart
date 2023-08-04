import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/models/history_model/history_model.dart';
import 'package:chat_pl/app/modules/chat/views/widgets/exports.dart';
import 'package:chat_pl/app/modules/history/controllers/history_controller.dart';
import 'package:chat_pl/app/modules/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailView extends GetView<HistoryController> {
  final HistoryModel? history;
  const HistoryDetailView({Key? key, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String datetime = DateTime.fromMillisecondsSinceEpoch(
      history?.timestamp ?? 0,
    ).formatDMYformatDMYHHmm;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: BaseAppBarWidget(
        title: Strings.historyAppBar,
        backgroundColor: AppColors.primaryColor,
        textColor: AppColors.whiteColor,
        backbuttonColor: AppColors.whiteColor,
        actions: [
          IconButton(
            icon: AppImages.svg(AppImages.icDeleteFilled),
            iconSize: 20.sp,
            splashRadius: 20.sp,
            onPressed: () => controller.deleteHistory(history),
          ),
        ],
      ),
      body: BaseContainerWidget(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Text(
                      datetime,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.text12BlackW400.copyWith(
                        color: AppColors.blackColor.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    MessageViewWidget(
                      msg: history?.question ?? '',
                      isUser: true,
                    ),
                    SizedBox(height: 10.h),
                    MessageViewWidget(
                      msg: history?.answer ?? '',
                      isUser: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 26.h),
            BaseButtonWidget(
              text: Strings.share,
              prefixIcon: AppImages.icShare,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
