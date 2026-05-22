import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rememvoca/Screen/folder/folder_screen.dart';
import 'package:rememvoca/Shares/Container.dart';

class item extends StatelessWidget {
  final Function(int) onTabChange;
  const item({super.key, required this.onTabChange});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            //
            Expanded(
              child: boxContainer(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => onTabChange(1),
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEDFE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.folder_outlined,
                          color: Color(0xFF534AB7),
                          size: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "3",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            // box 2
            Expanded(
              child: boxContainer(
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAEEDA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFBA7517),
                        size: 20,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "7",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: boxContainer(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Icon(
                            Icons.settings,
                            color: Color(0xFF534AB7),
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Khác", style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Thông tin quản lí nằm ở trang Folder/Admin",
                          style: TextStyle(
                            color: Color(0xFFC0C0C0),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // quản lý folder
                    GestureDetector(
                      onTap: () => onTabChange(1),
                      child: boxContainer(
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEDFE),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.folder_outlined,
                                color: Color(0xFF534AB7),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quản lý folder",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Tạo, sửa, xóa folder",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC0C0C0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 5),
                    //playlish
                    GestureDetector(
                      onTap: () => onTabChange(2),
                      child: boxContainer(
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEDFE),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.headphones,
                                color: Color(0xFF534AB7),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Playlish",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Luyện nghe",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC0C0C0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    //Admin
                    GestureDetector(
                      onTap: () => onTabChange(3),
                      child: boxContainer(
                        child: Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEDFE),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.settings,
                                color: Color(0xFF534AB7),
                                size: 20,
                              ),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Admin",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Setting accoun",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFFC0C0C0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );

    throw UnimplementedError();
  }
}
