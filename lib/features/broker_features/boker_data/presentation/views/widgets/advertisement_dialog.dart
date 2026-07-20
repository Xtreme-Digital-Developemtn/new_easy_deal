import 'package:flutter/material.dart';
import '../../view_model/broker_data_cubit.dart';

class AdvertisementDialog extends StatelessWidget {
  AdvertisementDialog({
    super.key,
    required this.unitId,
    required this.cubit,
  });

  final dynamic unitId;
  final BrokerDataCubit cubit;

  final TextEditingController captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("إضافة إعلان"),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: captionController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "الكابشن",
                hintText: "اكتب الكابشن هنا...",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("إلغاء"),
        ),
        ElevatedButton(
          onPressed: () {
            if (captionController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("من فضلك اكتب الكابشن"),
                ),
              );
              return;
            }

            cubit.unitPublishAsAd(
              id: unitId,
              caption: captionController.text.trim(),
            );

            Navigator.pop(context);
          },
          child: const Text("إرسال"),
        ),
      ],
    );
  }
}