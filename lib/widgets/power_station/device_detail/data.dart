

import 'dart:convert';

String historyEchartsOption(List<Map<String, Object>> data) {
  return '''
    {
      dataset: {
        dimensions: ['key', 'val'],
        source: ${jsonEncode(data)},
      },
      color: ['#3398DB'],
      grid: {
        left: '0%',
        right: '0%',
        bottom: '5%',
        top: '7%',
        height: '85%',
        containLabel: true,
      },
      xAxis: [{
        name: '实时功率',
        type: 'category',
        axisLine: {
          lineStyle: {
            color: 'black'
          },
          onZero: false
        }
      }],
      yAxis: {
        type: 'value',
        scale: true,
        min: -5,
        max: 10,
        axisLine: {
          lineStyle: {
            color: 'black',
            show: false
          },
          onZero: false
        },
        axisTick: {
          show: false
        }
      },
      series: [{
        type: 'bar',
      }],
    }
  ''';
}