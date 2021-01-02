class Note {
  String title;
  String content;
  DateTime date;

  Note({this.title, this.content, this.date});
}

final Map<String, int> categories = {
  'Notes': 6,
  'Work': 0,
  'Home': 5,
  'Complete': 3,
};

final List<Note> notes = [
  Note(
    title: 'Cooking',
    content: 'Prepare dinner for tonight\'s meeting.',
    date: DateTime(2019, 10, 10, 8, 30),
  ),
  Note(
    title: 'Walk with dog',
    content: 'Walk on the street with my favorite dog.',
    date: DateTime(2019, 10, 10, 10, 00),
  ),
];

final List<Note> important = [
  Note(
    title: 'Travel',
    content: 'Buy airplane ticket through Kayak for \$318.38.',
    date: DateTime(2019, 10, 11, 7, 15),
  ),
  Note(
    title: 'Walk with dog',
    content: 'Walk on the street with my favorite dog.',
    date: DateTime(2019, 10, 10, 18, 00),
  ),
];

final List<Note> performed = [
  Note(
    title: 'Race on Saturday',
    content: 'Don\'t forget wake up earlier Saturday.',
    date: DateTime(2019, 10, 13, 12, 00),
  ),
  Note(
    title: 'Cleanin\' Out My Closet',
    content: 'Cleaning my closet on Sunday morning.',
    date: DateTime(2019, 10, 13, 12, 30),
  ),
];
