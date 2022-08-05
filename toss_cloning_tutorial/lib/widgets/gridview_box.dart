import 'package:flutter/material.dart';
import 'package:toss_cloning_tutorial/const/gridview_box_info.dart';
import 'package:toss_cloning_tutorial/theme/app_colors.dart';
import 'package:toss_cloning_tutorial/utils/helper_widgets.dart';

class GridViewBox extends StatefulWidget {
  const GridViewBox({Key? key, required this.gridViewBoxInfoList}) : super(key: key);

  final List<GridViewBoxInfo> gridViewBoxInfoList;

  @override
  State<GridViewBox> createState() => _GridViewBoxState();
}

class _GridViewBoxState extends State<GridViewBox> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const int crossAxisCount = 3;
    const double itemHeight = 125;
    final double itemWidth = size.width / crossAxisCount;
    
    return GridView.builder(
              shrinkWrap: true,
              itemCount: widget.gridViewBoxInfoList.length,
              controller: ScrollController(keepScrollOffset: false),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: (itemWidth / itemHeight),
                  crossAxisCount: crossAxisCount),
              itemBuilder: (_, index) {
                final gridViewBox = widget.gridViewBoxInfoList[index];
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                      color: AppColors.homeBackground,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          gridViewBox.bankIcon,
                          addVerticalSpace(10),
                          Text(gridViewBox.bankName),
                        ]),
                  ),
                );
              });
        
  }
}