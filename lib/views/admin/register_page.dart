import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/admin/register_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/admin/insert_viewmodel.dart';
import 'insert_info.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerViewModel = context.read<RegisterViewModel>();
    final registerWatch = context.watch<RegisterViewModel>();

    if(registerWatch.noWaitList == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    final test = context.watch<RegisterViewModel>().noWaitList!;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background_img.jpg'),
                  fit: BoxFit.fill
              )
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
                child: BasicAppBar(
                  title: '미등록자 목록',
                ),
              ),
              Expanded(child: ListView.builder(
                itemCount: registerWatch.noWaitList?.length ?? 0,
                itemBuilder: (context, i){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChangeNotifierProvider(create: (BuildContext context) => InsertViewModel(registerWatch.noWaitList?[i]['email']),
                          child: const InsertInfo()))).then((_) => registerViewModel.getAllUserInfo());
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: BasicButton(
                        width: double.infinity,
                        height: 100,
                        color: MAIN_COLOR,
                        child: Row(
                          children: [
                            Expanded(child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Text('${i+1}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
                            )),
                            Container(
                                margin: const EdgeInsets.symmetric(vertical: 30),
                                child: const VerticalDivider(color: MAIN_COLOR,)
                            ),
                            Expanded(flex: 5,child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(child: Align(alignment: Alignment.centerLeft,child: Text('G-mail',style: TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 18),))),
                                Expanded(flex: 2,child: Text('${registerWatch.noWaitList?[i]['email']}',style: const TextStyle(color: Colors.grey,fontSize: 18),)),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
