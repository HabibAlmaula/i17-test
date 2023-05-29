import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i17_coding_test/pages/bloc/main_bloc.dart';
import 'package:i17_coding_test/pages/custom_form_field.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: _inputController,
                      isRemovable: true,
                      onChange: (query)=> (query.isEmpty) ? ,
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    SizedBox(
                      height: 300,
                      child: GridView.builder(
                          itemCount: 4,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 4 / 1,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemBuilder: (context, index) {
                            final data = index + 1;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: InkWell(
                                      child: Center(
                                        child: Text(
                                          "$data",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                      onTap: () => context.read<MainBloc>().add(
                                          OnButtonClicked(
                                              input: _inputController.text))),
                                ),
                              ),
                            );
                          }),
                    ),
                    if (state.result.isNotEmpty) const Text("Result:"),
                    if (state.result.isNotEmpty)
                      Text("${state.result.map((e) => e.toString())}")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
