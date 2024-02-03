import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/basic_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<AdminViewModel>().exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background_img.png'),
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
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 180,crossAxisSpacing: 10),
                      itemCount: 9,
                      itemBuilder: (context, i){
                        return Container(
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
                                  Expanded(child: Text('김정은',style: const TextStyle(fontWeight: FontWeight.bold),)),
                                  Expanded(child: Text('생년월일',style: const TextStyle(fontWeight: FontWeight.bold,color: MAIN_COLOR),)),
                                  Expanded(child: Text('24.02.03',style: const TextStyle(fontWeight: FontWeight.bold),)),
                                  Expanded(flex: 3,child: Row(
                                    children: [
                                      Expanded(
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
                                      const SizedBox(width: 5,),
                                      Expanded(
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
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
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
