// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class simpletile extends StatefulWidget {
  final String name;
  final String role;
  final bool isSelected;
  final VoidCallback onTap;
  simpletile({
    Key? key,
    required this.name,
    required this.role,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<simpletile> createState() => _simpletileState();
}

class _simpletileState extends State<simpletile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                10), // Adjust the value to change the roundness of the corners
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(widget.name),
                  Text(widget.role),
                ],
              ),
              CircleAvatar(
                radius: 5,
                backgroundColor: widget.isSelected
                    ? Colors.blue
                    : Colors.grey,
              ),
            ],
          )),
    );
  }
}
