import 'package:date_format/date_format.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';


class DataUtils {
 
  ///1.获取从某一天开始到某一天结束的所有的中间日期，例如输入 startTime:2019:07:31  endTime:2019:08:31  就会返回所有的中间天数。
  ///startTime和endTime格式如下都可以
  ///使用:    List<String> mdata=DataUtils.instance.getTimeBettwenStartTimeAndEnd(startTime:"2019-07-11",endTime:"2019-08-29",format:"yyyy年MM月dd");
  ///结果:[2019年07月11, 2019年07月12, 2019年07月13, 2019年07月14, 2019年07月15, 2019年07月16, 2019年07月17, 2019年07月18, 2019年07月19, 2019年07月20, 2019年07月21, 2019年07月22, 2019年07月23, 2019年07月24, 2019年07月25, 2019年07月26, 2019年07月27, 2019年07月28, 2019年07月29, 2019年07月30, 2019年07月31, 2019年08月01, 2019年08月02, 2019年08月03, 2019年08月04, 2019年08月05, 2019年08月06, 2019年08月07, 2019年08月08, 2019年08月09, 2019年08月10, 2019年08月11, 2019年08月12, 2019年08月13, 2019年08月14, 2019年08月15, 2019年08月16, 2019年08月17, 2019年08月18, 2019年08月19, 2019年08月20, 2019年08月21, 2019年08月22, 2019年08月23, 2019年08月24, 2019年08月25, 2019年08月26, 2019年08月27, 2019年08月28, 2019年08月29]
  static List<String> getTimeBettwenStartTimeAndEnd({startData = DateTime, endData = DateTime, format = String}) {
    var mDataList = <String>[];
    //记录往后每一天的时间搓，用来和最后一天到做对比。这样就能知道什么时候停止了。
    int allTimeEnd = 0;
    //记录当前到个数(相当于天数)
    int currentFlag = 0;
    var mothFormatFlag = DateFormat(format);
    while (endData.millisecondsSinceEpoch > allTimeEnd) {
      allTimeEnd = startData.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000;
      var dateTime = DateTime.fromMillisecondsSinceEpoch(startData.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000);
      String nowMoth = mothFormatFlag.format(dateTime);
      mDataList.add(nowMoth);
      currentFlag++;
    }
    return mDataList;
  }
 
  ///传入starTime格式 2012-02-27 13:27:00 或者 "2012-02-27等....
  ///dayNumber：从startTime往后面多少天你需要输出
  ///formart:获取到的日期格式。"yyyy年MM月dd" "yyyy-MM-dd" "yyyy年" "yyyy年MM月" "yyyy年\nMM月dd"  等等
  ///使用：DataUtils.instance.getTimeStartTimeAndEnd(startTime:"2019-07-11",dayNumber:10,format:"yyyy年MM月dd");
  ///结果:[2019年07月11, 2019年07月12, 2019年07月13, 2019年07月14, 2019年07月15, 2019年07月16, 2019年07月17, 2019年07月18, 2019年07月19, 2019年07月20, 2019年07月21]
  static List<String> getTimeStartTimeAndEnd({startData = DateTime, dayNumber = int, format = String}) {
    var mDataList = <String>[];
    //记录当前到个数(相当于天数)
    int currentFlag = 0;
    var mothFormatFlag = DateFormat(format ?? 'yyyy-MM-dd');
    while (dayNumber >= currentFlag) {
      var dateTime = DateTime.fromMillisecondsSinceEpoch(startData.millisecondsSinceEpoch + currentFlag * 24 * 60 * 60 * 1000);
      String nowMoth = mothFormatFlag.format(dateTime);
      mDataList.add(nowMoth);
      currentFlag++;
    }
    return mDataList;
  }
  ///格式化时间戳
  ///timeSamp:毫秒值
  ///format:"yyyy年MM月dd hh:mm:ss"  "yyy😄MM👌dd  hh🙅MM🐶dd" "yyyy:MM:dd"......
  ///结果： 2019😄08👌04  02🙅08🐶02
  static String getFormartData(int timeSamp, String? format){
    var dataFormart = DateFormat(format ?? 'yyyy-MM-dd');
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timeSamp);
    String formartResult = dataFormart.format(dateTime);
    return formartResult;
  }

  ///获取某一个月的第一天。
  static String getStartMoth(DateTime date, {format = 'yyyy-MM-dd'}) {
    var dataFormart= DateFormat(format);
    DateTime dateTimeeee = DateTime(date.year, date.month);
    String formartResult = dataFormart.format(dateTimeeee);
    return formartResult;
  }
  ///获取某一个月的最后一天。
  static String getEndMoth(DateTime startData, {format = 'yyyy-MM-dd'}) {
    var dataFormart= DateFormat(format);
    var dateTime = DateTime.fromMillisecondsSinceEpoch(startData.millisecondsSinceEpoch);
    var dataNextMonthData = DateTime(dateTime.year,dateTime.month + 1, 1);
    int nextTimeSamp=dataNextMonthData.millisecondsSinceEpoch-24 * 60 * 60 * 1000;
    //取得了下一个月1号码时间戳
    DateTime dateTimeeee = DateTime.fromMillisecondsSinceEpoch(nextTimeSamp);
    String formartResult = dataFormart.format(dateTimeeee);
    return formartResult;
  }
}

String formatToYearStr([DateTime? date]) {
  return formatDate(date ?? DateTime.now(), ['yyyy']);
}
String formatToMonthStr([DateTime? date]) {
  return formatDate(date ?? DateTime.now(), ['yyyy', '-', 'mm']);
}
String formatToDayStr([DateTime? date]) {
  return formatDate(date ?? DateTime.now(), ['yyyy', '-', 'mm', '-', 'dd']);
}
String formatToTimeStr([DateTime? date]) {
  return formatDate(date ?? DateTime.now(), ['yyyy', '-', 'mm', '-', 'dd', ' ', 'hh', ':', 'mm', ':', 'ss']);
}
 
 
//      ///使用：
//      //获取两个时间段之间的所有的日期
//     List<String> mdata=DataUtils.instance.getTimeBettwenStartTimeAndEnd(startTime:"2019-07-11",endTime:"2019-08-29",format:"yyyy年MM月dd");
//     print(mdata.toString());
//     //获取从那一天开始的之后多少天之内的所有日期
//     List<String>mdates=DataUtils.instance.getTimeStartTimeAndEnd(startTime:"2019-07-11",dayNumber:10,format:"yyyy年MM月dd");
//     print(mdates);
//     //通过时间戳来获取自己想要格式的日期。
//     DataUtils.instance.getFormartData(timeSamp:new DateTime.now().millisecondsSinceEpoch+3 * 24 * 60 * 60 * 1000,format:"yyy😄MM👌dd  hh🙅MM🐶ss");
//      //获取某一个月的最后一天。传入的是时间戳(微妙)
//     String datad=DataUtils.instance.getEndMoth(timeSamp:new DateTime.now().millisecondsSinceEpoch-180 * 24 * 60 * 60 * 1000,format:"yyyy年MM月dd hh:MM:ss");
//     print(datad);
//      //获取某一个月的最后一天。传入的是日期（微妙）
//     String mothData=DataUtils.instance.getEndMothFor(mothFormart:"2019-02-11",format:"yyy年MM月dd hh😄MM⏲️:ss");
//     print(mothData);
//     