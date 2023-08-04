import 'package:chat_pl/app/common/util/exports.dart';
import 'package:chat_pl/app/data/models/sample_question_model/sample_question_model.dart';
import 'package:flutter/material.dart';

class SampleQuestionWidget extends StatelessWidget {
  final SampleQuestionModel? question;
  const SampleQuestionWidget({
    Key? key,
    this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question?.category ?? '',
          style: AppTextStyle.text16BlackW400.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: question?.questions?.length ?? 0,
          separatorBuilder: (_, index) => SizedBox(height: 6.h),
          itemBuilder: (_, index) => Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: 10.borderRadius,
            ),
            child: Text(
              question?.questions?[index] ?? '',
              style: AppTextStyle.text14BlackW400.copyWith(
                color: AppColors.textHintColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
