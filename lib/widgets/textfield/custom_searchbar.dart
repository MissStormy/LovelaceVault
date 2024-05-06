import 'package:flutter/material.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomSearchBar extends StatefulWidget {
  final void Function(String) onSearch;

  const CustomSearchBar({
    required this.onSearch,
    Key? key,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey.shade200,
      ),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              style: TextStyle(color: actualTheme.colorScheme.onError),
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                hintStyle: TextStyle(color: actualTheme.colorScheme.onError),
                
              ),
              onSubmitted: widget.onSearch,
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onSearch(_searchController.text);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
