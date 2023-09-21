import 'package:average/constants.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context, VoidCallback onConfirm, String message) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "cancelar",
      style: TextStyle(
        color: Color(black),
        fontFamily: "Poppins",
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text(
      "excluir",
      style: TextStyle(
        color: Color(danger),
        fontFamily: "Poppins",
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
      onConfirm();
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Remover Atividade"),
    content: Text(
      message,
      style: const TextStyle(
        color: Color(black),
        fontFamily: "Poppins",
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
