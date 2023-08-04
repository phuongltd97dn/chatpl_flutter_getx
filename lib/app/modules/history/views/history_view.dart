import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/models/history_model/history_model.dart';
import 'package:chat_pl/app/modules/history/controllers/history_controller.dart';
import 'package:chat_pl/app/modules/history/views/history_detail/history_detail_view.dart';
import 'package:chat_pl/app/modules/history/views/widgets/exports.dart';
import 'package:chat_pl/app/modules/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: _buildAppBar(),
      body: BaseContainerWidget(
        padding: EdgeInsets.only(top: 26.h),
        child: Obx(() => Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.histories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        bottom: 18.h,
                      ),
                      child: Obx(() => _buildRowItem(
                            index,
                            controller.histories[index],
                          )),
                    ),
                  ),
                ),
                if (controller.isMultiSelect.value) ...[
                  _buildClearChatButton(),
                  SizedBox(height: 16.h)
                ]
              ],
            )),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return BaseAppBarWidget(
      backgroundColor: AppColors.primaryColor,
      title: Strings.historyAppBar,
      textColor: AppColors.whiteColor,
      backbuttonColor: AppColors.whiteColor,
      actions: [
        Obx(() => GestureDetector(
              onTap: () => controller.toggleMultiSelect(),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  controller.isMultiSelect.value
                      ? Strings.done
                      : Strings.select,
                  maxLines: 1,
                  style: AppTextStyle.text16BlackW400.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ))
      ],
    );
  }

  Widget _buildRowItem(int index, HistoryModel history) {
    int timestamp = history.timestamp ?? 0;
    DateTime datetime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (controller.isMultiSelect.value) ...[
          BaseCheckboxWidget(
            isSelected: history.isSelected,
            onChanged: (value) => controller.onCheckboxChanged(index, value),
          ),
          SizedBox(width: 20.w),
        ],
        Expanded(
          child: HistoryItemWidget(
            datetime: datetime.formatDMYformatDMYHHmm,
            question: history.question,
            onTap: () => Get.to(() => HistoryDetailView(history: history)),
          ),
        ),
      ],
    );
  }

  Widget _buildClearChatButton() {
    bool isDisable = controller.checkDisableButton();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: BaseButtonWidget(
        text: Strings.clearChat,
        isDisable: isDisable,
        onPressed: isDisable ? null : controller.deleteHistories,
      ),
    );
  }
}
