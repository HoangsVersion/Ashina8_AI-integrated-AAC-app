import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'communication_grid.dart';
import 'menu.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> words = [];
  String recommendedPhrase = 'Gemini Recommended Phrases';
  final FlutterTts flutterTts = FlutterTts();
  Map<String, String>? selectedVoice;
  double pitch = 1.0;
  double rate = 1.0;

  @override
  void initState() {
    super.initState();
    fetchRecommendedPhrase();
  }

  void fetchRecommendedPhrase() async {
    if (words.isEmpty) {
      setState(() {
        recommendedPhrase = 'Gemini Recommended Phrases';
      });
      return;
    }

    String sentence = words.join(' ');
    String prompt = """
    Given this corpus:
    [ 'I', 'Yes', 'No', 'Next', 'Then', 'Emotions', 'Like', 'Dislike', 'Bored', 'Confused', 'Angry', 'Funny', 'Happy', 'Sad', 'Worried', 'Not sure', 'Fruit', 'Apple', 'Banana', 'Pear', 'Body Parts', 'Arm', 'Ear', 'Eye', 'Finger', 'Foot', 'Hand', 'Leg', 'Mouth', 'Nose', 'Teeth', 'Toe', 'Animals', 'Bird', 'Cat', 'Dog', 'Lizard', 'Snake', 'Weather', 'Cloudy', 'Cold', 'Hot', 'Dry', 'Wet', 'Rainy', 'Sunny', 'Windy', 'Food', 'Bread', 'Cake', 'Candy', 'Cereal', 'Cheese', 'Chips', 'Cookies', 'Juice', 'Meat', 'Milk', 'Rice', 'Sandwich', 'Clothing', 'Dress', 'Hat', 'Jacket', 'Pants', 'Shirts', 'Shoes', 'Skirt', 'Socks', 'Sweater', 'Actions', 'Bring', 'Clean up', 'Draw', 'Set up', 'Listen', 'Play', 'Rest', 'Sit', 'Stand', 'Write', 'Wash', 'Wait', 'School', 'Work', 'Math', 'Book', 'Paper', 'Read', 'Story', 'Home', 'Please', 'Need', 'Need bathroom', 'Need help', 'Music', 'Tablet', 'Tape', 'Treat', 'Computer', 'Person','Vegetable',  'Broccoli',  'Beans', 'Cabbage']
    Complete the sentence without changing its meaning : $sentence
    You can use more than 1 word from the corpus and singular or plural forms.
    Feel free to use conjuctions like 'and', 'or', 'but', 'so', etc.
    Just return 1 single most relevant sentence and make sure the sentence is not meaningless or not the truth.
    """;


    try {
      final gemini = Gemini.instance;
      gemini.info(model: 'gemini-1.5-flash');
      final response = await gemini.text(prompt);
      setState(() {
        recommendedPhrase = response?.output ?? 'No recommendation';
      });
    } catch (e) {
      setState(() {
        recommendedPhrase = 'Error fetching recommendations';
      });
    }
  }

  void handleTap(String newWord) {
    setState(() {
      words.add(newWord);
      fetchRecommendedPhrase();  // Fetch recommendation after adding a new word
    });
  }

  void _speakWords() async {
    if (words.isNotEmpty) {
      if (selectedVoice != null) {
        await flutterTts.setVoice(selectedVoice!);
      }
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(pitch);
      await flutterTts.setSpeechRate(rate);
      await flutterTts.speak(words.join(" "));

    }
  }

  void _openSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuPage(
          flutterTts: flutterTts,
          selectedVoice: selectedVoice,
          pitch: pitch,
          rate: rate,
          onSettingsChanged: (voice, newPitch, newRate) {
            setState(() {
              selectedVoice = voice;
              pitch = newPitch;
              rate = newRate;
            });
          },
        ),
      ),
    );
  }

  void _replaceWordsWithRecommendation() {
    if (recommendedPhrase.isNotEmpty &&
        recommendedPhrase != 'No recommendation' &&
        recommendedPhrase != 'Error fetching recommendations' &&
        recommendedPhrase != 'Gemini Recommended Phrases') {
      setState(() {
        words = recommendedPhrase.split(' ');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                color: Colors.black,
                onPressed: () => _openSettings(context),
              ),
            ),
            title: const Text(
              'Ashina8',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            centerTitle: true,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.only(bottom: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          words.isEmpty ? 'Speech' : words.join(" "),
                          style: TextStyle(
                            fontSize: 17.0,
                            color: words.isEmpty ? Colors.grey : Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.volume_up),
                            color: Colors.black,
                            onPressed: _speakWords,
                          ),
                          IconButton(
                            icon: const Icon(Icons.backspace),
                            color: Colors.black,
                            onPressed: () {
                              if (words.isNotEmpty) {
                                setState(() {
                                  words.removeLast();
                                  fetchRecommendedPhrase();  // Update recommendation after removing a word
                                });
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                words.clear();
                                fetchRecommendedPhrase();  // Update recommendation after clearing words
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              margin: const EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      recommendedPhrase.isEmpty ? 'Gemini Recommended Phrases' : recommendedPhrase,
                      style: TextStyle(
                        fontSize: 17.0,
                        color: recommendedPhrase == 'Gemini Recommended Phrases' ? Colors.grey : Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.green,
                        onPressed: _replaceWordsWithRecommendation,
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        color: Colors.black,
                        onPressed: fetchRecommendedPhrase,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: CommunicationGrid(
                onTapCallback: handleTap,
                onSubItemTap: handleTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}