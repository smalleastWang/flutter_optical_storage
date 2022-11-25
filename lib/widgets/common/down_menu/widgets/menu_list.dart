import 'package:flutter/material.dart';
import '../index.dart';

///支持 单选、多选列表
/// 2级列表单选、多选

enum Choose {
  single, // 单选
  multi // 多选
}

/// 示例 下拉组件
class MenuList extends StatefulWidget {
  /// 筛选数据
  final List<DownMenuItemModel> filterList;

  /// 选择回调
  final Function(int index)? onTap;

  /// 自定义item
  final Widget? itemWidget;

  /// 选择控制器
  final MenuController menuController;

  /// 下拉菜单index
  final int index;

  final Choose choose;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const MenuList(
      {Key? key,
      required this.filterList,
      this.onTap,
      this.itemWidget,
      required this.menuController,
      required this.index,
      this.choose = Choose.single,
      this.margin,
      this.padding})
      : super(key: key);

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {

  _handleSelect(int index) {
    return () {
      widget.menuController.changeTitle(widget.index, widget.filterList[index].name);
      setState(() {
        for (int i = 0; i < widget.filterList.length; i++) {
          if (i == index) {
            widget.filterList[i].isSelect = true;
          } else {
            widget.filterList[i].isSelect = false;
          }
        }
      });
      if (widget.onTap != null) widget.onTap!(index);
    };
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.6,//宽度
              color: Colors.grey.withOpacity(.4), //边框颜色
            )
          )
        ),
        margin: widget.margin ?? const EdgeInsetsDirectional.only(top: 2),
        padding: widget.padding ?? const EdgeInsetsDirectional.only(bottom: 5, start: 15, end: 15),
        child: Stack(
          children: [
            GridView.builder(
              // physics: const BouncingScrollPhysics(),
              itemCount: widget.filterList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //设置列数
                crossAxisCount: 1,
                //设置横向间距
                crossAxisSpacing: 10,
                //设置主轴间距
                // mainAxisSpacing: 5,
                // 宽高比
                childAspectRatio: 9,
              ),
              itemBuilder: (context, index) {
                bool isSelect = widget.filterList[index].isSelect;
                if (widget.choose == Choose.single) {
                  return InkWell(
                    onTap: _handleSelect(index),
                    child: widget.itemWidget ?? Container(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.filterList[index].name ?? "",
                            style: TextStyle(color: isSelect == true ? Theme.of(context).primaryColor : const Color(0xff666666)),
                          ),
                          isSelect ? Icon(Icons.check, color: Theme.of(context).primaryColor) : const SizedBox.shrink(),
                        ],
                      )
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Text(
                                widget.filterList[index].name ?? "",
                                style: TextStyle(color: widget.filterList[index].isSelect == true ? Theme.of(context).primaryColor : const Color(0xffacacac))
                            ),
                            onTap: () {
                              setState(() {
                                widget.filterList[index].isSelect = !(widget.filterList[index].isSelect);
                              });
                            },
                          )
                        ),
                        SizedBox(
                          height: 20,
                          child: Checkbox(
                            value: widget.filterList[index].isSelect,
                            onChanged: (v) {
                              setState(() {
                                widget.filterList[index].isSelect = !(widget.filterList[index].isSelect);
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
            Visibility(
              visible: widget.choose == Choose.multi,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 44,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 102,
                        child: ElevatedButton(
                          child: const Text("重置"),
                          onPressed: () {
                            setState(() {
                              for (var data in widget.filterList) {
                                data.isSelect = false;
                              }
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 229,
                        child: ElevatedButton(
                          child: const Text("确定"),
                          onPressed: () {
                            String title = "";
                            for (var data in widget.filterList) {
                              if (data.isSelect == true) {
                                title += "${data.name},";
                              }
                            }

                            widget.menuController
                                .changeTitle(widget.index, title);
                            if (widget.onTap != null) widget.onTap!(0);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
