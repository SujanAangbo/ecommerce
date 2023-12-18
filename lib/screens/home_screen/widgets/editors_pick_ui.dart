import 'package:flutter/material.dart';

import '../../../constants/app_text_style.dart';
import '../../../constants/constants.dart';
import '../../../data/editor_category.dart';

class EditorsPickUI extends StatelessWidget {
  const EditorsPickUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "EDITOR'S PICK",
          style: AppTextStyle.titleTextStyle,
        ),
        const SizedBox(
          height: Constants.defaultPadding / 2,
        ),
        Text(
          "Problems trying to resolve\nthe conflict between",
          textAlign: TextAlign.center,
          style: AppTextStyle.subtitleTextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: Constants.defaultPadding * 2,
        ),
        ListView.builder(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: editorCatogory.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return EditorsPickCard(index: index);
          },
        ),
      ],
    );
  }
}

class EditorsPickCard extends StatelessWidget {
  int index;
  EditorsPickCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      height: index < 2 ? 500 : 240,
      width: 325,
      alignment:
          Alignment.lerp(Alignment.bottomLeft, Alignment.bottomCenter, 0.3),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(editorCatogory[index]['image']!),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        // height: 50,
        // width: 170,
        color: Colors.white,
        child: Text(
          editorCatogory[index]['category']!.toUpperCase(),
          style: AppTextStyle.titleTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
