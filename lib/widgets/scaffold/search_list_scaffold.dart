import 'package:flutter/material.dart';
import 'package:mediflow_bloc/constant/app_constant.dart';
import 'package:mediflow_bloc/constant/color.dart';

class SearchListScaffold extends StatelessWidget {
  final void Function(String)? onQueryChanged;
  final String title;
  final Widget child;
  const SearchListScaffold({
    super.key,
    this.onQueryChanged,
    this.title = '',
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 88.0,
            child: Padding(
              padding: const EdgeInsets.all(kDefaultSpacing),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Material(
                      elevation: 2.5,
                      shadowColor: kShadowColor,
                      borderRadius: BorderRadius.circular(kSmallBorderRadius),
                      clipBehavior: Clip.hardEdge,
                      child: TextFormField(
                        onChanged: onQueryChanged,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: kWhite,
                          border: InputBorder.none,
                          hintText: 'Search',
                          contentPadding: EdgeInsets.only(
                            left: 20.0,
                            right: 40.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    right: 10.0,
                    top: 13.5,
                    child: Icon(Icons.search),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
