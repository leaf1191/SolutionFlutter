import 'package:emergency_mate/viewmodels/admin/admin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: context.read<AdminViewModel>().exitTapTwice,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              IconButton(
                onPressed: () { Navigator.pushNamed(context, '/admin/register'); },
                icon: const Icon(Icons.add_box_outlined),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisExtent: 180),
                    itemCount: 10,
                    itemBuilder: (context, i){
                      return Container(
                        margin: const EdgeInsets.all(5),
                        color: Colors.blue,
                        child: Center(child: Text('$i')),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
