import 'package:flutter/material.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  String searchText = '';
  bool isUpperCase = false;

  void updateSearchText(String value) {
    setState(() {
      searchText += value;
    });
  }

  void backspace() {
    if (searchText.isNotEmpty) {
      setState(() {
        searchText = searchText.substring(0, searchText.length - 1);
      });
    }
  }

  void toggleCase() {
    setState(() {
      isUpperCase = !isUpperCase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black, size: 35),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 20, bottom: 220),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      searchText.isEmpty
                          ? 'Where you want to explore'
                          : searchText,
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text('Popular destinations'),
                SizedBox(height: 20),
                _buildDestination('Danang, Vietnam'),
                SizedBox(height: 10),
                _buildDestination('Ho Chi Minh, Vietnam'),
                SizedBox(height: 10),
                _buildDestination('Venice, Italy'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomKeyboard(
              onTextInput: updateSearchText,
              onBackspace: backspace,
              onToggleCase: toggleCase,
              isUpperCase: isUpperCase,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestination(String name) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 1),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(name),
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback onToggleCase;
  final bool isUpperCase;

  // ignore: use_super_parameters
  const CustomKeyboard({
    Key? key,
    required this.onTextInput,
    required this.onBackspace,
    required this.onToggleCase,
    required this.isUpperCase,
  }) : super(key: key);

  void _textInputHandler(String text) => onTextInput.call(text);

  Widget _buildKey(String label,
      {double? width, Color color = Colors.white, VoidCallback? onTap}) {
    return Expanded(
      flex: width != null ? width.toInt() : 1,
      child: KeyboardKey(
        label: label,
        onTap: onTap ?? () => _textInputHandler(label),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: (isUpperCase ? 'QWERTYUIOP' : 'qwertyuiop')
                .split('')
                .map((e) => _buildKey(e))
                .toList(),
          ),
          Row(
            children: (isUpperCase ? 'ASDFGHJKL' : 'asdfghjkl')
                .split('')
                .map((e) => _buildKey(e))
                .toList(),
          ),
          Row(
            children: [
              _buildKey('⇧',
                  width: 1.5, color: Color(0xFFE5E7EB), onTap: onToggleCase),
              ...(isUpperCase ? 'ZXCVBNM' : 'zxcvbnm')
                  .split('')
                  .map((e) => _buildKey(e))
                  // ignore: unnecessary_to_list_in_spreads
                  .toList(),
              _buildKey('⌫',
                  width: 1.5, color: Color(0xFFE5E7EB), onTap: onBackspace),
            ],
          ),
          Row(
            children: [
              _buildKey('123', width: 1.5, color: Color(0xFFE5E7EB)),
              _buildKey('😊', width: 1.5, color: Color(0xFFE5E7EB)),
              _buildKey(' ', width: 5),
              _buildKey('Search', width: 2, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class KeyboardKey extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  // ignore: use_super_parameters
  const KeyboardKey({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _KeyboardKeyState createState() => _KeyboardKeyState();
}

class _KeyboardKeyState extends State<KeyboardKey> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: Container(
        height: 50,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: _isPressed ? widget.color.withOpacity(0.7) : widget.color,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child:
            Center(child: Text(widget.label, style: TextStyle(fontSize: 16))),
      ),
    );
  }
}
