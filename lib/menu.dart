import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MenuPage extends StatefulWidget {
  final FlutterTts flutterTts;
  final Map<String, String>? selectedVoice;
  final double pitch;
  final double rate;
  final Function(Map<String, String>?, double, double) onSettingsChanged;

  MenuPage({
    required this.flutterTts,
    this.selectedVoice,
    required this.pitch,
    required this.rate,
    required this.onSettingsChanged,
  });

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Map<String, String>? selectedVoice;
  late double pitch;
  late double rate;
  List<dynamic> voices = [];

  @override
  void initState() {
    super.initState();
    selectedVoice = widget.selectedVoice;
    pitch = widget.pitch;
    rate = widget.rate;
    _getVoices();
  }

  Future<void> _getVoices() async {
    List<dynamic> allVoices = await widget.flutterTts.getVoices;
    voices = allVoices.where((voice) => voice['locale'] == 'en-US').toList();

    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Settings'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedVoice != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.volume_up, color: Colors.blue),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: Text(
                          'Selected Voice: ${selectedVoice!['name'] ?? 'Unknown'}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Text("Select Voice:"),
            Container(
              width: double.infinity,
              height: 400.0, // Increased height for better visibility
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: voices.length,
                itemBuilder: (context, index) {
                  final voice = voices[index];
                  return ListTile(
                    title: Text('Voice ${index + 1}'), // Display index-based label
                    subtitle: voice['locale'] != null ? Text(voice['locale']!) : null,
                    onTap: () {
                      setState(() {
                        selectedVoice = Map<String, String>.from(voice);
                      });
                    },
                    selected: selectedVoice == voice,
                    tileColor: selectedVoice == voice ? Colors.blue[50] : null,
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            Text("Pitch: ${pitch.toStringAsFixed(1)}"),
            Slider(
              value: pitch,
              onChanged: (value) {
                setState(() {
                  pitch = value;
                });
              },
              min: 0.5,
              max: 2.0,
              divisions: 15,
              label: pitch.toStringAsFixed(1),
            ),
            SizedBox(height: 16.0),
            Text("Speech Rate: ${rate.toStringAsFixed(1)}"),
            Slider(
              value: rate,
              onChanged: (value) {
                setState(() {
                  rate = value;
                });
              },
              min: 0.2,
              max: 2.0,
              divisions: 18,
              label: rate.toStringAsFixed(1),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  widget.onSettingsChanged(selectedVoice, pitch, rate);
                  Navigator.pop(context);
                },
                child: Text("Save Settings"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}