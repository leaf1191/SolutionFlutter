import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:emergency_mate/viewmodels/admin/check_viewmodel.dart';
import 'package:emergency_mate/views/admin/check_info.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../widgets/basic_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final adminViewModel = context.read<AdminViewModel>();
    final adminWatch = context.watch<AdminViewModel>();

    return WillPopScope(
      onWillPop: adminViewModel.exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_img.jpg'),
                    fit: BoxFit.fill
                ),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: RightWidgetAppBar(
                      onTap: (){
                        Navigator.pushNamed(context, '/admin/register');
                      },
                      widget: Column(
                        children: [
                          Expanded(child: Image.asset('assets/wait/add.png')),
                          const Expanded(child: Center(child: Text('추가',style: TextStyle(color: MAIN_COLOR),)))
                        ],
                      ),
                    title: '환자 대기 목록',
                    color: MAIN_COLOR,
                  ),
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () async{
                              try{
                                await adminViewModel.signOutAndDeleteDB();
                                // ignore: use_build_context_synchronously
                                Navigator.pushNamedAndRemoveUntil(context, '/intro/title', ModalRoute.withName('/'));
                              } catch(e){
                                Fluttertoast.showToast(msg: '로그아웃 실패');
                              }
                            },
                            child: Container(
                                width: 100,
                                height: 30,
                                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: MAIN_COLOR, width: 2),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Center(
                                    child: Text(
                                      '로그아웃',
                                      style: TextStyle(
                                          color: MAIN_COLOR, fontWeight: FontWeight.bold),
                                    ))),
                          ),
                        ),
                      ),
                      SliverGrid.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 180,crossAxisSpacing: 10),
                          itemCount: adminWatch.waitUsers.length,
                          itemBuilder: (context, i){
                            var userData = adminWatch.waitUsers[i].data();
                            if(!userData['callPatient']){
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => CheckInfoViewModel(userData['email'], i),
                                    child: const CheckInfo(),
                                  )));
                                },
                                child: Container(
                                  margin: (i%2 == 0)? const EdgeInsets.fromLTRB(20, 10, 0, 10) : const EdgeInsets.fromLTRB(0, 10, 20, 10),
                                  child: BasicButton(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: MAIN_COLOR,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(child: Text('${i+1}.',style: const TextStyle(fontWeight: FontWeight.bold),)),
                                          Expanded(child: Text('${userData['name']}',style: const TextStyle(fontWeight: FontWeight.bold),)),
                                          const Expanded(child: Text('생년월일',style: TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)),
                                          Expanded(child: Text('${userData['date']}',style: const TextStyle(fontWeight: FontWeight.bold),)),
                                          Expanded(flex: 3,child: Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () async{
                                                    await adminViewModel.callByAdmin(userData['email']);
                                                  },
                                                  child: BasicButton(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    color: MAIN_COLOR,
                                                    child: Column(
                                                      children: [
                                                        Expanded(child: Align(
                                                          alignment: Alignment.bottomCenter,
                                                          child: Container(
                                                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                                              child: Image.asset('assets/admin/call.png')
                                                          ),
                                                        ),),
                                                        const Expanded(child: Align(
                                                            alignment: Alignment.topCenter,
                                                            child: Text('호출',style: TextStyle(color: MAIN_COLOR),))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () async{
                                                    await adminViewModel.deleteUser(userData['email']);
                                                  },
                                                  child: BasicButton(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    color: MAIN_COLOR,
                                                    child: Column(
                                                      children: [
                                                        Expanded(child: Align(
                                                          alignment: Alignment.bottomCenter,
                                                          child: Container(
                                                              margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                                              child: Image.asset('assets/admin/trash.png')
                                                          ),
                                                        ),),
                                                        const Expanded(child: Align(
                                                            alignment: Alignment.topCenter,
                                                            child: Text('삭제',style: TextStyle(color: MAIN_COLOR),))),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeNotifierProvider(create: (context) => CheckInfoViewModel(userData['email'], i),
                                    child: const CheckInfo(),
                                  )));
                                },
                                child: Container(
                                  margin: (i%2 == 0)? const EdgeInsets.fromLTRB(20, 10, 0, 10) : const EdgeInsets.fromLTRB(0, 10, 20, 10),
                                  child: BasicButton(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: WARNING_COLOR,
                                    backgroundColor: WARNING_COLOR,
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(child: Text('${i+1}.',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                              Expanded(child: Text('${userData['name']}',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                              const Expanded(child: Text('생년월일',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                              Expanded(child: Text('${userData['date']}',style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                                              Expanded(flex: 3,child: GestureDetector(
                                                onTap: () async{
                                                  await adminViewModel.checkCallByPatient(userData['email']);
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(color: WARNING_COLOR,width: 2),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            offset: const Offset(0, 3),
                                                            color: Colors.black.withOpacity(0.5),
                                                            blurRadius: 3
                                                        )
                                                      ]
                                                  ),
                                                  child: const Center(child: Text('호출 확인',style: TextStyle(color: WARNING_COLOR,fontSize: 15),)),
                                                ),
                                              )),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 50),
                                            height: 50,
                                            child: Image.asset('assets/admin/just_siren.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }

                          }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}