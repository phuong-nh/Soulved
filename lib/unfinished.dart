import 'package:chalie_youthon/models/challenge.dart';
import 'package:chalie_youthon/models/task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UnfinishedScreen extends StatelessWidget {
  const UnfinishedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: unfinished(),
    );
  }
}

Widget unfinished() {
  return Center(
    child: Container(
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Unfinished screen",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    ),
  );
}

Image defaultImage() {
  return Image.asset('assets/images/testhealthchallenge.jpg');
}

String imageLink(String name) {
  return "https://firebasestorage.googleapis.com/v0/b/frontliners-chalie.appspot.com/o/images%2F" +
      name +
      "?alt=media";
}

List<Challenge> testChallenges() {
  final List<Challenge> current = [];
  var test = Challenge(
    name: 'Học yêu bản thân cùng Chalie',
    description:
        'Nhu cầu chăm sóc sức khoẻ của các thanh thiếu niên hiện nay vẫn chưa được xem như là sự ưu tiên đặc biệt trong cuộc sống. Điều này là dễ hiểu bởi đơn giản nhu cầu sống của giới trẻ khá đa dạng và yêu cầu dành nhiều thời gian cho công việc hơn là sức khoẻ. Vậy tại bạn lại phải đánh mất bản thân giữa bộn bề đó? Challenge “Học yêu bản thân cùng Chalie” chính là chiếc công tắc của chế độ nghỉ ngơi mỗi ngày của bạn, giúp bạn tìm lại chính bản thân mình. Đến với các thử thách này, bạn sẽ hiểu rõ hơn về sự quan trọng của sức khỏe, tìm thấy mục tiêu sống của bản thân và ngoài ra  bạn sẽ thấy bản thân mình tốt hơn, đặc biệt là cơ thể, sức khoẻ và tinh thần sẽ thay đổi một cách rõ rệt.',
    creator: 'Frontliners',
    length: 7,
    tag: 'Sức khỏe',
    id: 1,
    rating: 9,
    doing: true,
    image: 'fb7.jpg',
    finisher: 1256,
    current: 2,
  );
  Day day;
  day = Day(
    name: "Chuẩn bị",
    finished: true,
  );
  day.tasks.add(Task(
    name: 'Điều chỉnh ăn uống',
    description:
        'Xem xét và điều chỉnh chế độ ăn uống trong ngày hợp lý và đủ dinh dưỡng',
    point: 10,
    finished: true,
  ));
  test.days.add(day);
  day = Day(
    name: "Vận động",
    finished: true,
  );
  day.tasks.add(Task(
    name: 'Chạy bộ / Đạp xe',
    description: 'Chạy bộ/đạp xe trong khoảng 1 - 2 tiếng',
    point: 10,
    finished: true,
  ));
  test.days.add(day);
  day = Day(
      name: "Ăn uống 🥗",
      finished: false,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ullamcorper eu risus ut aliquam. Donec egestas tortor sed erat ornare, vel egestas neque ultricies. Sed quis ante scelerisque, malesuada est sed, volutpat velit.");
  day.tasks.add(Task(
    name: 'Nấu ăn',
    description:
        'Tự mình xuống bếp làm bữa ăn thật ngon. Ngon tới mức mà bạn không thể cưỡng lại việc ăn, bất chấp toàn bộ công sức giảm béo của bạn, khiến bạn phải chạy xuống bếp để làm thêm một đĩa nữa để ăn đêm =))',
    point: 10,
    finished: false,
  ));
  test.days.add(day);
  day = Day(
    name: "Giấc ngủ",
    finished: false,
  );
  day.tasks.add(Task(
    name: 'Ngủ đủ giấc',
    description: 'Đi ngủ vào lúc 9-10h tối và thức dậy lúc 6-7h.',
    point: 10,
    finished: false,
  ));
  test.days.add(day);
  day = Day(
    name: "Ngăn nắp",
    finished: false,
  );
  day.tasks.add(Task(
    name: 'Sắp xếp lại',
    description: 'Dành ra 1 giờ dọn dẹp căn phòng của mình',
    point: 10,
    finished: false,
  ));
  test.days.add(day);
  day = Day(
    name: "Tịnh tâm",
    finished: false,
  );
  day.tasks.add(Task(
    name: 'Thư giãn',
    description: 'Relax chính mình bằng việc ngắm một cảnh đẹp bạn yêu thích',
    point: 10,
    finished: false,
  ));
  test.days.add(day);
  day = Day(
    name: "Hồi ức",
    finished: false,
  );
  day.tasks.add(Task(
    name: 'Ghi nhật kí',
    description: 'Viết nhật ký về những gì bạn trải qua ngày hôm nay',
    point: 10,
    finished: false,
  ));
  test.days.add(day);
  current.add(test);
  return current;
}
