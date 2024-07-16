import 'package:ai_mhealth_app/Screens/add_medication.dart';
import 'package:ai_mhealth_app/providers/medication.provider.dart';
import 'package:ai_mhealth_app/widgets/medication_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.provider.dart';
import '../widgets/appbar.dart';

class MedicationReminderScreen extends StatefulWidget {
  static const routeName = '/health-reminder';
  const MedicationReminderScreen({super.key});

  @override
  State<MedicationReminderScreen> createState() =>
      _MedicationReminderScreenState();
}

class _MedicationReminderScreenState extends State<MedicationReminderScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final String username =
        Provider.of<UserData>(context, listen: false).userName;
    final provider = Provider.of<MedicationData>(context, listen: false);

    return Scaffold(


      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(
          title: "Medication Reminder",
        ),
      ),
      // backgroundColor: color.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            RichText(
              text: TextSpan(
                  text: "Hello,",
                  style: const TextStyle(
                    color: Color(0xFF27272A),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                  children: [
                    TextSpan(
                      text: "\n$username",
                      style: const TextStyle(
                        letterSpacing: 5,
                        color: Color(0xFF27272A),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ]),
              textAlign: TextAlign.left,
            ),
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: ShapeDecoration(
                color: color.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome \nTo Medication \nReminder",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: color.secondary,
                      ),
                    ),
                    Text(
                      "\n${provider.completedMedications()} of ${provider.medicationsLength} completed",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: color.secondary,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Image.asset(
                  'assets/medicine.png',
                  height: 100,
                  width: 100,
                ),
              ]),
            ),
            const Divider(
              height: 15,
              thickness: 0.005,
            ),
            Text(
              "Daily Review",
              // textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color.secondary,
              ),
            ),
            const Divider(
              height: 8,
              thickness: 0.005,
            ),
            Expanded(
              child: Consumer<MedicationData>(
                builder: (BuildContext context, MedicationData value,
                    Widget? child) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return MedicationTile(
                          name: value.getMedicationByIndex(index).name,
                          isDone: value.getMedicationByIndex(index).completed
                              ? "Completed"
                              : "In-Progress",
                          // isDone:
                          //     "${value.getMedicationByIndex(index).morining}",
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 5,
                          thickness: 0.001,
                        );
                      },
                      itemCount: value.medicationsLength);
                },
              ),
            ),
          ],
        ),
      ),
              floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddMedicationScreen.routeName);
        },
        elevation: 5,
        isExtended: true,
        shape: const CircleBorder(eccentricity: 1),
        foregroundColor: color.secondary,
        backgroundColor: color.primary,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
   );
  }
}
