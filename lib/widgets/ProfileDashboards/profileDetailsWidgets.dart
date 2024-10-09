import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends StatelessWidget {
  final Function()? onTap;
  final Widget? widget;
  final String? username;
  final String? lastname;
  final String? email;
  final String? number;
  const UserDetails({
    Key? key,
    this.onTap,
    this.widget,
    this.username,
    this.email,
    this.number,
    this.lastname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 22.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(children: [
          const SizedBox(
            width: 10.0,
          ),
          Container(
            color: Colors.transparent,
            height: 65.0,
            width: 65.0,
            child: widget,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    username ?? "",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    lastname ?? "",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Container(
                width: 250,
                color: Colors.transparent,
                child: Text(
                  email ?? "",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Text(
                number ?? "",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 15.0,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
