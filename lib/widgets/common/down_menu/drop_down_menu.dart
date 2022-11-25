import 'package:flutter/material.dart';

import 'menu_controller.dart';
import 'widgets/menu_list.dart';

/// 下拉选择  所有的头维护一个下拉组件 组件内部child更新
class DropDownMenu extends StatefulWidget {
  /// 下拉组件数组
  final List<MenuList> children;

  /// 下拉组件高度
  final double height;

  /// 下拉时间
  final int milliseconds;
  final MenuController menuController;

  const DropDownMenu(
      {Key? key,
      required this.children,
      this.height = 200,
      this.milliseconds = 100,
      required this.menuController})
      : super(key: key);

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // 控制器

  late Animation<double> animation; // 动画抽象类
  late CurvedAnimation cure; // 动画运行的速度轨迹 速度的变化

  bool isShowShadow = false; // true 显示下拉菜单 false 隐藏下拉菜单

  @override
  void initState() {
    super.initState();
    //vsync TickerProvider参数 创建Ticker 为了防止动画消耗不必要的资源
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.milliseconds)); //2s
    cure = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    // 高度变化
    setAnimation(widget.height);
    widget.menuController.addListener(() {
      double itemlength = widget.children[widget.menuController.index].filterList.length.toDouble();
      setAnimation(itemlength * 40 + 6);
      if (widget.menuController.isShow) {
        // 显示
        _controller.forward();
      } else {
        _controller.reverse();
      }
      // 刷新筛选数据
      setState(() {});
    });
  }

  setAnimation(double height) {
    setState(() {
      animation = Tween(begin: 0.0, end: height).animate(cure)
      // 动画执行监听
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          // 动画反向执行完毕
          if (!widget.menuController.isShow) {
            setState(() {
              isShowShadow = false;
            });
          }
        } else if (status == AnimationStatus.forward) {
          // 动画正向执行完毕
          setState(() {
            isShowShadow = true;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.menuController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isShowShadow ? double.infinity : null,
      child: Column(
        children: [
          _MenuBuilder(
            animation: animation,
            child: widget.children[widget.menuController.index],
          ),
          isShowShadow
              ? Expanded(
                  child: InkWell(
                  child: AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black
                              .withOpacity(animation.value / (widget.height * 3)),
                        );
                      }),
                  onTap: () {
                    widget.menuController.hide();
                  },
                ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

/// 下拉组件
class _MenuBuilder extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const _MenuBuilder({required this.animation, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Container(
          color: Colors.white,
          height: animation.value,
          child: child,
        );
      }
    );
  }
}
