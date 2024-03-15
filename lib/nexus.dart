import 'package:flutter/material.dart';
import 'package:lovelacevault/models/resource.dart';
import 'package:lovelacevault/pages/chatbot/minerva.dart';
import 'package:lovelacevault/pages/home/home.dart';
import 'package:lovelacevault/pages/library/bookshelf.dart';
import 'package:lovelacevault/pages/library/work_detail.dart';
import 'package:lovelacevault/pages/ui/profile.dart';
import 'package:lovelacevault/pages/ui/settings.dart';
import 'package:lovelacevault/pages/works/editor.dart';
import 'package:lovelacevault/pages/works/workspace.dart';
import 'package:lovelacevault/theme/theme.dart';
import 'package:lovelacevault/widgets/citation/citation_popup.dart';
import 'package:provider/provider.dart';

class Nexus extends StatefulWidget {
  const Nexus({super.key});

  @override
  State<Nexus> createState() => _NexusState();
}

class _NexusState extends State<Nexus> {
  //-------------------
  // Variables
  //-------------------
  int _selectedIndex = 0;
  late TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    //-----------------
    // Screen Navigator
    //-----------------
    final List<Widget> screens = [
      //-----
      //  0
      //-----
      Home(
        showWork: () {
          setState(() {
            _selectedIndex = 3;
          });
        },
        showSettings: () {
          setState(() {
            _selectedIndex = 4;
          });
        },
      ),
      //-----
      //  1
      //-----
      Workspace(
        addWork: () {
          setState(() {
            _selectedIndex = 5;
          });
        },
      ),
      //-----
      //  2
      //-----
      Bookshelf(),
      //-----
      //  3
      //-----
      WorkDetail(),
      //-----
      //  4
      //-----
      Profile(),
      //-----
      //  5
      //-----
      Editor(goBack: () {
        setState(() {
          _selectedIndex = 1;
        });
      }, showPopUp: () async {
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return CitationPopup();
          },
        );
      }),
      //-----
      //  6
      //-----
      Minerva(),
      //-----
      //  7
      //-----
      Settings()
    ];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //-----------------------------------------------------
      // In this case, the AppBar will be done in each screen
      // to specify the buttons and title
      //-----------------------------------------------------
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        //color: actualTheme.colorScheme.secondary,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        shadowColor: actualTheme.colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 6;
                });
              },
              icon: const Icon(Icons.calendar_month),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.calendar_month),
              color: Colors.white,
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                icon: const Icon(Icons.list),
                color: Colors.white,
              ),
            ),
             IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 4;
                });
              },
              icon: const Icon(Icons.calendar_month),
              color: Colors.white,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //Boom, here you have a bottomnavbar with the centered buttom!!
        onPressed: () {
          setState(() {
            _selectedIndex = 0;
          });
        },
        //backgroundColor: actualTheme.colorScheme.onPrimary,
        elevation: 5,
        shape: const CircleBorder(),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //-------------------
  // SHORTCUT NAVIGATOR
  //-------------------
  void _navigateToScreen(String route) {
    Navigator.pushNamed(context, route);
  }

  Future<Resource?> _selectResource() async {
    // Implement logic to open dialog and select resource
    // For example, use showDialog with a ListView of resources
    return null; // Return the selected resource or null if not selected
  }

  String _formatCitation(Resource resource) {
    // Implement logic to format citation according to chosen style
    // For example, construct the citation string based on resource fields
    return '${resource.author} (${resource.year}). ${resource.title}.';
  }

  void _insertCitation(String citation) {
    // Get current cursor position
    final int cursorPosition = _controller.selection.baseOffset;

    // Insert citation at current cursor position
    final String textBeforeCursor =
        _controller.text.substring(0, cursorPosition);
    final String textAfterCursor = _controller.text.substring(cursorPosition);

    // Set text with citation inserted at cursor position
    _controller.text = '$textBeforeCursor $citation $textAfterCursor';

    // Set cursor position after the inserted citation
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: cursorPosition + citation.length + 1),
    );
  }
}
