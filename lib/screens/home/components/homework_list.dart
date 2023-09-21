import 'package:average/constants.dart';
import 'package:average/models/activity.dart';
import 'package:average/screens/home/components/activity_form.dart';
import 'package:average/screens/home/components/alert.dart';
import 'package:flutter/material.dart';

typedef ActivityCallBack = Function(Activity);

// List
class ActivityList extends StatelessWidget {
  const ActivityList({
    super.key,
    required this.activities,
    required this.addActivity,
    required this.deleteActivity,
    required this.updateActivityScore,
  });

  final List<Activity> activities;
  final ActivityCallBack addActivity;
  final ActivityCallBack deleteActivity;
  final Function(double, String) updateActivityScore;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
        bottom: 134.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ActivityHeaderList(addActivity: addActivity),
          const SizedBox(height: 16.0),
          ...activities.map(
            (activity) => ScoreInput(
              key: Key(activity.id.toString()),
              activity: activity,
              onChanged: updateActivityScore,
              onDelete: deleteActivity,
            ),
          )
        ],
      ),
    );
  }
}

// Input
class ScoreInput extends StatefulWidget {
  final Activity activity;
  final Function(double, String) onChanged;
  final ActivityCallBack onDelete;

  const ScoreInput({
    super.key,
    required this.activity,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  State<ScoreInput> createState() => _ScoreInputState();
}

class _ScoreInputState extends State<ScoreInput> {
  final scoreInputController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    scoreInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: TextField(
              controller: scoreInputController,
              keyboardType: TextInputType.number,
              onChanged: (value) => {
                widget.onChanged(
                    double.tryParse(value) ?? 0.0, widget.activity.id),
              },
              cursorColor: const Color(black),
              cursorRadius: const Radius.circular(16.0),
              style: const TextStyle(
                color: Color(black),
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                label: Text(widget.activity.label),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                labelStyle: const TextStyle(color: Color(black)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(grey), width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(color: Color(grey), width: 2.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            onPressed: () {
              showAlertDialog(context, () {
                widget.onDelete(widget.activity);
              }, "Tem certeza que deseja remover a atividade \"${widget.activity.label}\"?");
            },
            color: const Color(danger),
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            icon: const Icon(
              Icons.delete_outline_rounded,
              size: 32,
              color: Color(danger),
            ),
          )
        ],
      ),
    );
  }
}

// Header

class ActivityHeaderList extends StatefulWidget {
  final ActivityCallBack addActivity;

  const ActivityHeaderList({super.key, required this.addActivity});

  @override
  State<ActivityHeaderList> createState() => _ActivityHeaderListState();
}

class _ActivityHeaderListState extends State<ActivityHeaderList> {
  late FocusNode newActivityTextFieldFocusNode;

  @override
  void initState() {
    super.initState();

    newActivityTextFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    newActivityTextFieldFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Notas",
          style: TextStyle(
            fontSize: 24.0,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w900,
            color: Color(black),
          ),
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              barrierColor: const Color(black).withOpacity(0.5),
              enableDrag: true,
              useSafeArea: true,
              isScrollControlled: true,
              elevation: 4.0,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: ActivityPopupForm(
                    addActivity: widget.addActivity,
                    focusNode: newActivityTextFieldFocusNode,
                  ),
                );
              },
            );

            newActivityTextFieldFocusNode.requestFocus();
          },
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(black)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(12.0)),
          ),
          icon: const Icon(Icons.add, color: Color(white), size: 24.0),
          label: const Text(
            "Novo Atividade",
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: "Balsamiq_Sans",
              fontWeight: FontWeight.w400,
              color: Color(white),
            ),
          ),
        ),
      ],
    );
  }
}
