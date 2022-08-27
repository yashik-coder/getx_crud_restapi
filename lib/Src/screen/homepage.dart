import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_crud_restapi/Src/constants/appcolors.dart';
import 'package:getx_crud_restapi/Src/screen/updateUserData.dart';
import 'package:getx_crud_restapi/Src/screen/userDetailsPage.dart';
import 'package:getx_crud_restapi/Src/widgets/kText.dart';

import '../controller/basecontroller.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with Basecontroller {
  void initState() {
    super.initState();
    userlistc.scrollController.addListener(() {
      if (userlistc.scrollController.position.atEdge) {
        if (userlistc.scrollController.position.pixels == 0) {
        } else {
          userlistc.loadMoreUserData();
          print('Bottom');
          print(userlistc.page.value);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    userlistc.getalluserdata(context);
    // resourceListC.getResourceListData(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: KText(
          text: 'Home Page',
          fontSize: 18,
          color: white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Get.to(SearchUserPage()),
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Obx(
        () => userlistc.user.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: green,
              ))
            : Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: ListView.builder(
                  controller: userlistc.scrollController,
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: userlistc.user.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    final userList = userlistc.user[index];

                    return GestureDetector(
                      onTap: () => Get.to(UserDetailsPage(
                        id: userList.id,
                        users: userList,
                      )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: userlistc.user.isEmpty
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Container(
                                // height: 200,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: blueGrey,
                                  // color: HexColor('${item['color']}'),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            userList.avatar,
                                            scale: 1,
                                          )),
                                      SizedBox(width: 10),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              KText(
                                                text: userList.first_name,
                                                color: white,
                                                fontSize: 18,
                                              ),
                                              KText(
                                                text: userList.last_name,
                                                color: white,
                                                fontSize: 18,
                                              ),
                                            ],
                                          ),
                                          KText(
                                            text: userList.email,
                                            color: white,
                                            fontSize: 12,
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              userlistc.deleteSingleUserData(
                                                context,
                                                id: userList.id,
                                              );
                                            },
                                            icon: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.delete,
                                                size: 25,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Get.to(UpdateUserDataPage(
                                                  id: userList.id,
                                                  users: userList));
                                            },
                                            icon: Align(
                                              alignment: Alignment.centerRight,
                                              child: Icon(
                                                Icons.edit,
                                                size: 25,
                                                color: white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
      ),
      floatingActionButton: Obx(() => userlistc.isLoading.value
          ? FloatingActionButton(
              onPressed: () {},
              child: CircularProgressIndicator(
                backgroundColor: black,
              ),
            )
          : SizedBox()),
    );
  }
}
// sizeBox20,
// Container(
//   height: 85,
//   child: ListView.builder(
//     physics: BouncingScrollPhysics(),
//     primary: false,
//     shrinkWrap: true,
//     itemCount: resourceListC.resource.length,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (BuildContext context, int index) {
//       final resourceList = resourceListC.resource[index];
//       return Padding(
//         padding: padding10,
//         child: Column(
//           children: [
//             CircleAvatar(
//               backgroundColor: HexColor(resourceList.color),
//               radius: 30,
//               child: KText(text: '${resourceList.year}'),
//             ),
//             SizedBox(height: 5),
//             KText(
//               text: resourceList.name,
//               color: black,
//               fontSize: 12,
//             ),
//           ],
//         ),
//       );
//     },
//   ),
// ),
// sizeBox10,
