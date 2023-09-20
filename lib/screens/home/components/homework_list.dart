import 'package:average/constants.dart';
import 'package:flutter/material.dart';

class HomeworkList extends StatefulWidget {
  const HomeworkList({super.key});

  @override
  State<HomeworkList> createState() => _HomeworkListState();
}

class _HomeworkListState extends State<HomeworkList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HomeWorkHeaderList(),
            const SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    cursorColor: Color(black),
                    cursorRadius: Radius.circular(16.0),
                    style: TextStyle(
                      color: Color(black),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                    decoration: InputDecoration(
                      label: Text("Trabalho 01"),
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
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_outline,
                    size: 32,
                    color: Color(danger),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeWorkHeaderList extends StatelessWidget {
  const HomeWorkHeaderList({
    super.key,
  });

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
          onPressed: () {},
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(black)),
            padding: MaterialStatePropertyAll(EdgeInsets.all(12.0)),
          ),
          icon: const Icon(Icons.add, color: Color(white), size: 24.0),
          label: const Text(
            "Novo Campo",
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
