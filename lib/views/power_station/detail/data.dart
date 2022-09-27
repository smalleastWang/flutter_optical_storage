import 'dart:convert';

String statisticEchartsOption(List<Map<String, Object>> data) {
  String keys = jsonEncode(data.map((i) => i['key']).toList());
  String chargeds = jsonEncode(data.map((i) => i['charged']).toList());
  String dischargeds = jsonEncode(data.map((i) => i['discharged']).toList());
  return '''
    {
      title: {
        text: '月充放电量统计',
        // subtext: 'Fake Data'
      },
      color: ['#4CAF50', '#2196F3'],
      legend: {
        bottom: 18,
        data: ['充电量', '放电量']
      },
      calculable: true,
      xAxis: [
        {
          type: 'category',
          data: $keys
        }
      ],
      yAxis: [
        {
          type: 'value'
        }
      ],
      series: [
        {
          name: '充电量',
          type: 'bar',
          data: $chargeds,
        },
        {
          name: '放电量',
          type: 'bar',
          data: $dischargeds,
        }
      ]
    }
  ''';
}