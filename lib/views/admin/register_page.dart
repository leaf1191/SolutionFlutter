import 'package:emergency_mate/viewmodels/admin/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if(context.watch<RegisterViewModel>().test == null){
      return const Scaffold(
        body: SafeArea(
            child: Center(child: CircularProgressIndicator())
        ),
      );
    }

    final test = context.watch<RegisterViewModel>().test!;
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: test.length,
          itemBuilder: (context, i){
            return GestureDetector(
              onTap: (){
                Navigator
                    .pushNamed(context, '/admin/insert')
                    .then((value) => context.read<RegisterViewModel>().testFunction());
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                child: Text(test[i].toString()),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int i) {
            return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Divider()
            );
          },
        ),
      ),
    );
  }
}
