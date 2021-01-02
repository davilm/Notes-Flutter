import 'package:flutter/material.dart';
import 'package:notes/models/note_model.dart';
import 'package:intl/intl.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen>
    with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;

  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        // height: 120.0,
        height: 260,
        width: 165.0,
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index
              ? Color(0xFF417BFB)
              : Color(0xFFF6F7FB),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 10.0)
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Color(0xFFAFB4C6),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildetailedCard(
    int index,
    String title,
    String content,
    DateTime date,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Color(0xFFF5F7FB),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    _timeFormatter.format(date),
                    style: TextStyle(
                      color: Color(0xFFAFB4C6),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.0),
              Text(
                content,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    _dateFormatter.format(date),
                    style: TextStyle(
                      color: Color(0xFFAFB4C6),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF417BFB),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 56),
          child: Visibility(
            visible: false,
            child: AppBar(),
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 40.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/user.png'),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Text(
                    'Jenny Breaks',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(width: 20.0);
                  }
                  return _buildCategoryCard(
                    index - 1,
                    categories.keys.toList()[index - 1],
                    categories.values.toList()[index - 1],
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Color(0xFFAFB4C6),
                  indicatorColor: Color(0xFF417BFB),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 4.0,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Notes',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Important',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Performed',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Expanded(
              child: TabBarView(
                children: [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      var title = notes[index].title;
                      var content = notes[index].content;
                      var date = notes[index].date;
                      return _buildetailedCard(index, title, content, date);
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      var title = important[index].title;
                      var content = important[index].content;
                      var date = important[index].date;
                      return _buildetailedCard(index, title, content, date);
                    },
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      var title = performed[index].title;
                      var content = performed[index].content;
                      var date = performed[index].date;
                      return _buildetailedCard(index, title, content, date);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
