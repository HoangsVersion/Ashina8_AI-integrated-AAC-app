import 'package:flutter/material.dart';
import 'models.dart';
import 'item_details_page.dart';

class CommunicationGrid extends StatelessWidget {
  final Function(String) onTapCallback;
  final Function(String) onSubItemTap;

  CommunicationGrid({
    required this.onTapCallback,
    required this.onSubItemTap,
  });

  final List<GridItem> gridItems = [
    GridItem(text: 'I', color: Colors.blue[300]!, imagePath: 'assets/images/i.png'),
    GridItem(text: 'Yes', color: Colors.green[400]!, imagePath: 'assets/images/yes.png'),
    GridItem(text: 'No', color: Colors.red[400]!, imagePath: 'assets/images/no.png'),


    GridItem(text: 'Thank you', color: Colors.yellow[300]!, imagePath: 'assets/images/thank you.png'),
    GridItem(text: 'Please', color: Colors.green[600]!, imagePath: 'assets/images/please.png'),
    GridItem(text: 'Need', color: Colors.orange[700]!, imagePath: 'assets/images/need.png'),
    GridItem(text: 'Need bathroom', color: Colors.lightBlue[400]!, imagePath: 'assets/images/need bathroom.png'),
    GridItem(text: 'Need help', color: Colors.red[300]!, imagePath: 'assets/images/need help.png'),

    GridItem(
      text: 'Emotions',
      color: Colors.purple[300]!,
      imagePath: 'assets/images/happy.png',
      subItems: [
        GridItem(text: 'Like', color: Colors.green[200]!, imagePath: 'assets/images/like.png'),
        GridItem(text: 'Dislike', color: Colors.red[700]!, imagePath: 'assets/images/angry.png'),
        GridItem(text: 'Bored', color: Colors.grey[400]!, imagePath: 'assets/images/bored.png'),
        GridItem(text: 'Confused', color: Colors.orange[300]!, imagePath: 'assets/images/confused.png'),
        GridItem(text: 'Angry', color: Colors.red[800]!, imagePath: 'assets/images/frustrated.png'),
        GridItem(text: 'Funny', color: Colors.yellow[600]!, imagePath: 'assets/images/funny.png'),
        GridItem(text: 'Happy', color: Colors.orange[300]!, imagePath: 'assets/images/happy.png'),
        GridItem(text: 'Hurt', color: Colors.red[300]!, imagePath: 'assets/images/hurt.png'),
        GridItem(text: 'Sad', color: Colors.blue[800]!, imagePath: 'assets/images/sad.png'),
        GridItem(text: 'Worried', color: Colors.blue[300]!, imagePath: 'assets/images/worried.png'),
        GridItem(text: 'Not sure', color: Colors.grey[500]!, imagePath: 'assets/images/not sure.png'),
      ],
    ),
    GridItem(
      text: 'Actions',
      color: Colors.blue[300]!,
      imagePath: 'assets/images/play.png',
      subItems: [
        GridItem(text: 'Think', color: Colors.blue[200]!, imagePath: 'assets/images/thinking.png'),
        GridItem(text: 'Bring', color: Colors.blue[500]!, imagePath: 'assets/images/bring.png'),
        GridItem(text: 'Clean up', color: Colors.blue[600]!, imagePath: 'assets/images/clean up.png'),
        GridItem(text: 'Draw', color: Colors.blue[700]!, imagePath: 'assets/images/draw.png'),
        GridItem(text: 'Set up', color: Colors.blue[800]!, imagePath: 'assets/images/set up.png'),
        GridItem(text: 'Listen', color: Colors.blue[400]!, imagePath: 'assets/images/listen.png'),
        GridItem(text: 'Play', color: Colors.blue[500]!, imagePath: 'assets/images/play.png'),
        GridItem(text: 'Rest', color: Colors.blue[200]!, imagePath: 'assets/images/rest.png'),
        GridItem(text: 'Sit', color: Colors.blue[300]!, imagePath: 'assets/images/sit.png'),
        GridItem(text: 'Stand', color: Colors.blue[600]!, imagePath: 'assets/images/stand.png'),
        GridItem(text: 'Write', color: Colors.blue[700]!, imagePath: 'assets/images/write.png'),
        GridItem(text: 'Wash', color: Colors.blue[400]!, imagePath: 'assets/images/wash.png'),
        GridItem(text: 'Wait', color: Colors.blue[300]!, imagePath: 'assets/images/wait.png'),
      ],
    ),
    GridItem(text: 'Next', color: Colors.deepPurple[300]!, imagePath: 'assets/images/next.png'),
    GridItem(text: 'Then', color: Colors.orange[300]!, imagePath: 'assets/images/then.png'),

    GridItem(
      text: 'Fruit',
      color: Colors.orange[600]!,
      imagePath: 'assets/images/fruit.png',
      subItems: [
        GridItem(text: 'Fruit', color: Colors.orange[500]!, imagePath: 'assets/images/fruit.png'),
        GridItem(text: 'Apple', color: Colors.red[500]!, imagePath: 'assets/images/apple.png'),
        GridItem(text: 'Banana', color: Colors.yellow[700]!, imagePath: 'assets/images/banana.png'),
        GridItem(text: 'Pear', color: Colors.green[500]!, imagePath: 'assets/images/pear.png'),
      ],
    ),

    GridItem(
      text: 'Vegetables',
      color: Colors.green[700]!,
      imagePath: 'assets/images/vegetable.png', // Make sure you have an image for this
      subItems: [
        GridItem(text: 'Vegetable', color: Colors.green[600]!, imagePath: 'assets/images/vegetable.png'),
        GridItem(text: 'Broccoli', color: Colors.green[500]!, imagePath: 'assets/images/broccoli.png'),
        GridItem(text: 'Beans', color: Colors.green[400]!, imagePath: 'assets/images/beans.png'),
        GridItem(text: 'Cabbage', color: Colors.green[300]!, imagePath: 'assets/images/cabbage.png'),
      ],
    ),

    GridItem(
      text: 'Body Parts',
      color: Colors.pink[200]!,
      imagePath: 'assets/images/arm.png',
      subItems: [
        GridItem(text: 'Arm', color: Colors.brown[300]!, imagePath: 'assets/images/arm.png'),
        GridItem(text: 'Ear', color: Colors.pink[200]!, imagePath: 'assets/images/ear.png'),
        GridItem(text: 'Eye', color: Colors.blue[200]!, imagePath: 'assets/images/eye.png'),
        GridItem(text: 'Finger', color: Colors.pink[300]!, imagePath: 'assets/images/finger.png'),
        GridItem(text: 'Foot', color: Colors.pink[400]!, imagePath: 'assets/images/foot.png'),
        GridItem(text: 'Hand', color: Colors.pink[300]!, imagePath: 'assets/images/hand.png'),
        GridItem(text: 'Leg', color: Colors.pink[500]!, imagePath: 'assets/images/leg.png'),
        GridItem(text: 'Mouth', color: Colors.red, imagePath: 'assets/images/mouth.png'),
        GridItem(text: 'Nose', color: Colors.pink[200]!, imagePath: 'assets/images/nose.png'),
        GridItem(text: 'Teeth', color: Colors.white, imagePath: 'assets/images/teeth.png'),
        GridItem(text: 'Toe', color: Colors.pink[400]!, imagePath: 'assets/images/toe.png'),
      ],
    ),
    GridItem(
      text: 'Animals',
      color: Colors.orange,
      imagePath: 'assets/images/dog.png',
      subItems: [
        GridItem(text: 'Animal', color: Colors.brown[600]!, imagePath: 'assets/images/animal.png'),
        GridItem(text: 'Bird', color: Colors.blue[400]!, imagePath: 'assets/images/bird.png'),
        GridItem(text: 'Cat', color: Colors.orange[700]!, imagePath: 'assets/images/cat.png'),
        GridItem(text: 'Dog', color: Colors.brown[600]!, imagePath: 'assets/images/dog.png'),
        GridItem(text: 'Lizard', color: Colors.green[500]!, imagePath: 'assets/images/lizard.png'),
        GridItem(text: 'Snake', color: Colors.green[800]!, imagePath: 'assets/images/snake.png'),
      ],
    ),
    GridItem(
      text: 'Weather',
      color: Colors.blue[700]!,
      imagePath: 'assets/images/sunny.png',
      subItems: [
        GridItem(text: 'Cloudy', color: Colors.grey[500]!, imagePath: 'assets/images/cloudy.png'),
        GridItem(text: 'Cold', color: Colors.blue[200]!, imagePath: 'assets/images/cold.png'),
        GridItem(text: 'Hot', color: Colors.red[700]!, imagePath: 'assets/images/hot.png'),
        GridItem(text: 'Dry', color: Colors.orange[300]!, imagePath: 'assets/images/dry.png'),
        GridItem(text: 'Wet', color: Colors.blue[300]!, imagePath: 'assets/images/wet.png'),
        GridItem(text: 'Rainy', color: Colors.blue[600]!, imagePath: 'assets/images/rainy.png'),
        GridItem(text: 'Sunny', color: Colors.yellow[700]!, imagePath: 'assets/images/sunny.png'),
        GridItem(text: 'Windy', color: Colors.grey[400]!, imagePath: 'assets/images/windy.png'),
      ],
    ),
    GridItem(
      text: 'Food',
      color: Colors.red[800]!,
      imagePath: 'assets/images/bread.png',
      subItems: [
        GridItem(text: 'Bread', color: Colors.orange[500]!, imagePath: 'assets/images/bread.png'),
        GridItem(text: 'Cake', color: Colors.pink[300]!, imagePath: 'assets/images/cake.png'),
        GridItem(text: 'Candy', color: Colors.red[500]!, imagePath: 'assets/images/candy.png'),
        GridItem(text: 'Cereal', color: Colors.yellow[600]!, imagePath: 'assets/images/cereal.png'),
        GridItem(text: 'Cheese', color: Colors.yellow[800]!, imagePath: 'assets/images/cheese.png'),
        GridItem(text: 'Chips', color: Colors.orange[600]!, imagePath: 'assets/images/chips.png'),
        GridItem(text: 'Cookies', color: Colors.brown[700]!, imagePath: 'assets/images/Cookies.png'),
        GridItem(text: 'Juice', color: Colors.orange[400]!, imagePath: 'assets/images/juice.png'),
        GridItem(text: 'Meat', color: Colors.red[600]!, imagePath: 'assets/images/meat.png'),
        GridItem(text: 'Milk', color: Colors.white, imagePath: 'assets/images/milk.png'),
        GridItem(text: 'Rice', color: Colors.white, imagePath: 'assets/images/Rice.png'),
        GridItem(text: 'Sandwich', color: Colors.brown[500]!, imagePath: 'assets/images/sandwich.png'),
      ],
    ),
    GridItem(
      text: 'Clothing',
      color: Colors.pink[400]!,
      imagePath: 'assets/images/shirts.png',
      subItems: [
        GridItem(text: 'Dress', color: Colors.pink[300]!, imagePath: 'assets/images/dress.png'),
        GridItem(text: 'Hat', color: Colors.red[300]!, imagePath: 'assets/images/hat.png'),
        GridItem(text: 'Jacket', color: Colors.blue[500]!, imagePath: 'assets/images/jacket.png'),
        GridItem(text: 'Pants', color: Colors.blue[700]!, imagePath: 'assets/images/pants.png'),
        GridItem(text: 'Shirts', color: Colors.blue[400]!, imagePath: 'assets/images/shirts.png'),
        GridItem(text: 'Shoes', color: Colors.brown[800]!, imagePath: 'assets/images/shoes.png'),
        GridItem(text: 'Skirt', color: Colors.pink[200]!, imagePath: 'assets/images/skirt.png'),
        GridItem(text: 'Socks', color: Colors.white, imagePath: 'assets/images/socks.png'),
        GridItem(text: 'Sweater', color: Colors.red[400]!, imagePath: 'assets/images/sweater.png'),
      ],
    ),

    GridItem(
      text: 'School',
      color: Colors.cyan[800]!,
      imagePath: 'assets/images/work.png',
      subItems: [
        GridItem(text: 'Work', color: Colors.amber[800]!, imagePath: 'assets/images/work.png'),
        GridItem(text: 'Math', color: Colors.blueGrey[300]!, imagePath: 'assets/images/math.png'),
        GridItem(text: 'Book', color: Colors.brown[700]!, imagePath: 'assets/images/book.png'),
        GridItem(text: 'Paper', color: Colors.grey[300]!, imagePath: 'assets/images/paper.png'),
        GridItem(text: 'Read', color: Colors.deepPurple[300]!, imagePath: 'assets/images/read.png'),
        GridItem(text: 'Story', color: Colors.lime[800]!, imagePath: 'assets/images/story.png'),
      ],
    ),
    GridItem(text: 'Home', color: Colors.brown[500]!, imagePath: 'assets/images/home.png'),
    GridItem(text: 'Music', color: Colors.purple[600]!, imagePath: 'assets/images/music.png'),
    GridItem(text: 'Tablet', color: Colors.blueGrey[600]!, imagePath: 'assets/images/tablet.png'),
    GridItem(text: 'Tape', color: Colors.teal[800]!, imagePath: 'assets/images/tape.png'),
    GridItem(text: 'Treat', color: Colors.pink[400]!, imagePath: 'assets/images/treat.png'),
    GridItem(text: 'Computer', color: Colors.blueGrey[500]!, imagePath: 'assets/images/computer.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          GridItem item = gridItems[index];
          return GestureDetector(
            onTap: () {
              if (item.subItems.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ItemDetailsPage(gridItem: item, onSubItemTap: onSubItemTap),
                  ),
                );
              } else {
                onTapCallback(item.text);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        item.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    item.text,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
