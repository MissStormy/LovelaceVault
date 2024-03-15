import 'package:flutter/material.dart';
import 'package:lovelacevault/models/resource.dart'; // Import your resource model

class CitationPopup extends StatefulWidget {
  @override
  _CitationPopupState createState() => _CitationPopupState();
}

class _CitationPopupState extends State<CitationPopup> {
  String _selectedCitationStyle = 'APA 7';
  String _searchQuery = '';
  Resource resource = new Resource();
  List<Resource> _searchResults = []; // Define Resource model based on your database

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Citation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search for a resource...',
            ),
          ),
          DropdownButton<String>(
            value: _selectedCitationStyle,
            items: <String>['APA 7', 'ISO 690'] // Add more citation styles as needed
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedCitationStyle = newValue!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () async {
              // Call a function to search for resources in the database
              List<Resource> results = await resource.searchResources(_searchQuery);
              setState(() {
                _searchResults = results;
              });
            },
            child: Text('Search'),
          ),
          // Display search results here
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index].title),
                  subtitle: Text(_searchResults[index].author),
                  onTap: () {
                    // Call a function to format the citation
                    String formattedCitation =
                        _formatCitation(_searchResults[index], _selectedCitationStyle);
                    // Insert the formatted citation into the current file being edited
                    _insertCitation(formattedCitation);
                    Navigator.pop(context); // Close the popup
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _formatCitation(Resource resource, String citationStyle) {
    // Implement logic to format citation according to chosen style
    // For example, construct the citation string based on resource fields
    return '${resource.author} (${resource.year}). ${resource.title}.';
  }

  void _insertCitation(String citation) {
    // You can implement this method based on your specific use case
    // For example, you might want to pass the citation back to the editor
    // via a callback function, if the editor is a separate widget.
  }
}
