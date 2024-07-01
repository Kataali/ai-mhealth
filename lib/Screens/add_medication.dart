import 'package:ai_mhealth_app/widgets/custom_elevated_button.dart';
import 'package:ai_mhealth_app/widgets/custom_textfield.dart';
import 'package:ai_mhealth_app/widgets/medication_time_card.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class AddMedicationScreen extends StatefulWidget {
  static const routeName = '/add-medication';

  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(
          title: "Add Medication",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     label: Text("Medication Name"),
                //   ),
                // ),
                CustomTextField(
                    hintText: "Medication Name", controller: nameController),
                const Divider(
                  height: 20,
                  thickness: 0.005,
                ),
                // TextFormField(
                //   decoration: const InputDecoration(
                //     label: Text("Duration"),
                //   ),
                // ),
                CustomTextField(
                    hintText: "Medication Duration",
                    controller: durationController),
                const Divider(
                  height: 45,
                  thickness: 0.005,
                ),
                Text(
                  "Timings",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: color.secondary,
                  ),
                ),
                const Divider(
                  height: 15,
                  thickness: 0.005,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                      child: MedicationTimeCard(
                        text: "Morning",
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Icon(
                                Icons.sunny,
                                color: color.secondary,
                                size: 30,
                              ),
                            ),
                            Icon(
                              Icons.cloud,
                              color: color.secondary,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                      child: MedicationTimeCard(
                        text: "Afternoon",
                        child: Icon(
                          Icons.sunny,
                          color: color.secondary,
                          size: 40,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                      },
                      child: MedicationTimeCard(
                        text: "Evening",
                        child: Icon(
                          Icons.mode_night_outlined,
                          color: color.secondary,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                  thickness: 0.005,
                ),
                CustomElevatedButton(
                  text: 'Done',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
