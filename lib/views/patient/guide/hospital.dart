import 'package:emergency_mate/colors/colors.dart';
import 'package:emergency_mate/viewmodels/patient/guide/hospital_viewmodel.dart';
import 'package:emergency_mate/widgets/app_bar.dart';
import 'package:emergency_mate/widgets/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GuideHospital extends StatelessWidget {
  const GuideHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hospitalViewModel = context.watch<HospitalViewModel>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
                height: 60,
                child: BackAppBar(title: '병원 안내',back: 'Home',color: MAIN_COLOR,)
            ),
            Expanded(flex: 8,child: Column(
              children: [
                const Expanded(flex: 2,child: Center(child: Text('원내 시설 위치',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
                Expanded(child: hospitalViewModel.currentIdx == null?
                const Text('층을 선택해주세요.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),) :
                Text('${hospitalViewModel.floors[hospitalViewModel.currentIdx!]}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25))),
                Expanded(flex: 12,child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xffC1EBFF),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: hospitalViewModel.currentIdx == null?
                  const Center(child: Text('층을 선택해주세요.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)) :
                  Image.asset('assets/guide/map.jpg'),
                )),
              ],
            )),
            Expanded(flex: 3,child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 80),
                  itemCount: 8,
                  itemBuilder: (context, i){
                    if(hospitalViewModel.currentIdx == i){
                      return Container(
                        margin: const EdgeInsets.all(5),
                        child: BasicButton(
                          width: 100,
                          color: MAIN_COLOR,
                          backgroundColor: MAIN_COLOR,
                          child: Center(child: Text('${hospitalViewModel.floors[i]}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: (){
                        hospitalViewModel.setIndex(i);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: BasicButton(
                          width: 100,
                          color: MAIN_COLOR,
                          child: Center(child: Text('${hospitalViewModel.floors[i]}',style: const TextStyle(color: MAIN_COLOR,fontWeight: FontWeight.bold,fontSize: 20),)),
                        ),
                      ),
                    );
                  }
              ),
            )),
          ],
        ),
      ),
    );
  }
}