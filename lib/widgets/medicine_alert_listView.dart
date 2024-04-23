import 'package:flutter/material.dart';
import 'package:med_eg/models/MedicineAlertModel.dart';
import 'package:med_eg/services/get_MedicineALerts.dart';
import 'package:med_eg/widgets/custom_MedicineAlertCard.dart';

class MedicineAlertLisView extends StatelessWidget {
  const MedicineAlertLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180,
        child: FutureBuilder<List<MedicineAlertModel>>(
          future: GetAllAlertsService().GetAllAlerts(context),
          builder: (BuildContext context,
              AsyncSnapshot<List<MedicineAlertModel>> snapshot) {
            if (snapshot.hasData) {
              List<MedicineAlertModel> alerts = snapshot.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: alerts.length,
                  itemBuilder: (context, index) {
                    return MedicineAlertCard(alert: alerts[index],);
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
