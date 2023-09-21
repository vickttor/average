import 'package:average/constants.dart';
import 'package:average/models/activity.dart';
import 'package:average/screens/home/components/homework_list.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ActivityPopupForm extends StatefulWidget {
  const ActivityPopupForm({
    super.key,
    required this.focusNode,
    required this.addActivity,
  });

  final FocusNode focusNode;
  final ActivityCallBack addActivity;

  @override
  State<ActivityPopupForm> createState() => _ActivityPopupFormState();
}

class _ActivityPopupFormState extends State<ActivityPopupForm> {
  final _formKey = GlobalKey<FormState>();
  final activityTextFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    activityTextFieldController.dispose();
    super.dispose();
  }

  void closeBottomModalSheet() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 6.0,
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: const BoxDecoration(
                color: Color(grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
            ),
            TextFormField(
              controller: activityTextFieldController,
              focusNode: widget.focusNode,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira um nome';
                }
                return null;
              },
              cursorColor: const Color(black),
              cursorRadius: const Radius.circular(16.0),
              style: const TextStyle(
                color: Color(black),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              decoration: const InputDecoration(
                label: Text("Nome da atividade"),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                labelStyle: TextStyle(color: Color(black)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(grey), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(grey), width: 2.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(danger), width: 2.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(grey), width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    closeBottomModalSheet();
                  },
                  child: const Text(
                    "cancelar",
                    style: TextStyle(
                      color: Color(black),
                      fontFamily: "Poppins",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 24.0),
                TextButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      Activity activity = Activity(
                        label: activityTextFieldController.text,
                        score: 0,
                        id: uuid.v4(),
                      );

                      widget.addActivity(activity);

                      closeBottomModalSheet();
                    }
                  },
                  child: const Text(
                    "salvar",
                    style: TextStyle(
                      color: Color(success),
                      fontFamily: "Poppins",
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
