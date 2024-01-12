import 'package:flutter/material.dart';

class TodoCardHorizontal extends StatelessWidget {
  final String TodoTeamTitle;
  final String TodoTeamJoinMember;
  final String TodoTeamTotalMember;
  final String iconText;
  final Color backgroundColor;
  final String TodoTeamCategory;

  const TodoCardHorizontal({
    super.key,
    required this.TodoTeamTitle,
    required this.TodoTeamJoinMember,
    required this.TodoTeamTotalMember,
    required this.iconText,
    required this.backgroundColor,
    required this.TodoTeamCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: backgroundColor,
                  child: Center(
                    child: Text(iconText,
                        style: const TextStyle(
                          fontSize: 30,
                        )),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TodoTeamTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.people),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          '$TodoTeamJoinMember/$TodoTeamTotalMember',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6EEF2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        right: 4.0,
                        top: 3.0,
                        bottom: 3.0,
                      ),
                      child: Text(
                        TodoTeamCategory,
                        style: const TextStyle(
                            color: Color(0xff0065B2),
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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

class TodoCardVertical extends StatelessWidget {
  final String TodoTeamTitle;
  final String TodoTeamJoinMember;
  final String TodoTeamTotalMember;
  final String iconText;
  final Color backgroundColor;
  final String TodoTeamCategory;

  const TodoCardVertical({
    super.key,
    required this.TodoTeamTitle,
    required this.TodoTeamJoinMember,
    required this.TodoTeamTotalMember,
    required this.iconText,
    required this.backgroundColor,
    required this.TodoTeamCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFE8E8E8), width: 1)),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: 200,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                  ),
                  child: Center(
                      child: Text(iconText,
                          style: const TextStyle(
                            fontSize: 30,
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TodoTeamTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.people),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.0),
                            child: Text(
                              '$TodoTeamJoinMember/$TodoTeamTotalMember',
                              overflow: TextOverflow.ellipsis,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6EEF2),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 4.0,
                            right: 4.0,
                            top: 3.0,
                            bottom: 3.0,
                          ),
                          child: Text(
                            TodoTeamCategory,
                            style: const TextStyle(
                                color: Color(0xff0065B2),
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class TodoCardImageHorizontal extends StatelessWidget {
  final String TodoTeamTitle;
  final String TodoTeamJoinMember;
  final String TodoTeamTotalMember;
  final String iconText;
  final Color backgroundColor;
  final String TodoTeamCategoroy;

  const TodoCardImageHorizontal({
    super.key,
    required this.TodoTeamTitle,
    required this.TodoTeamJoinMember,
    required this.TodoTeamTotalMember,
    required this.iconText,
    required this.backgroundColor,
    required this.TodoTeamCategoroy,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(0, 0.5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    'https://t1.daumcdn.net/cfile/tistory/246DCA37587F28C108',
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TodoTeamTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.people),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Text(
                          '$TodoTeamJoinMember/$TodoTeamTotalMember',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6EEF2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        right: 4.0,
                        top: 3.0,
                        bottom: 3.0,
                      ),
                      child: Text(
                        TodoTeamCategoroy,
                        style: const TextStyle(
                            color: Color(0xff0065B2),
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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

class TodoCardImageVertical extends StatelessWidget {
  final String TodoTeamTitle;
  final String TodoTeamJoinMember;
  final String TodoTeamTotalMember;
  final String iconText;
  final Color backgroundColor;
  final String TodoTeamCategoroy;

  const TodoCardImageVertical({
    super.key,
    required this.TodoTeamTitle,
    required this.TodoTeamJoinMember,
    required this.TodoTeamTotalMember,
    required this.iconText,
    required this.backgroundColor,
    required this.TodoTeamCategoroy,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE8E8E8), width: 1)),
          child: Column(
            children: [
              Container(
                height: 160,
                width: 240,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://t1.daumcdn.net/cfile/tistory/246DCA37587F28C108',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TodoTeamTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.people),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Text(
                            '$TodoTeamJoinMember/$TodoTeamTotalMember',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6EEF2),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 4.0,
                          right: 4.0,
                          top: 3.0,
                          bottom: 3.0,
                        ),
                        child: Text(
                          TodoTeamCategoroy,
                          style: const TextStyle(
                              color: Color(0xff0065B2),
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RankingCardWidget extends StatelessWidget {
  final String nickname;
  final int consecutiveDay;
  final int rank;

  const RankingCardWidget({
    super.key,
    required this.nickname,
    required this.consecutiveDay,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$rank. $nickname',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  Flexible(child: Container()),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text('+$consecutiveDay',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTodoCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String time;
  final String category;
  final String color;

  const MyTodoCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.time,
    required this.category,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(7.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Text(content,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(date,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(time,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text(category,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
