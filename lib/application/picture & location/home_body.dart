import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    double width = mediaQuery.width;
    double height = mediaQuery.height;
    String result = "";
    /*String type = '';*/
    /* File? image;*/
    HomeBloc homeBloc = context.read<HomeBloc>();

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is InformationNotCompleted) {
          Fluttertoast.showToast(msg: 'pleas get location ');
        }
        if (state is HomeGetLocationFailed) {
          Fluttertoast.showToast(msg: state.errorMessage);
        } else if (state is HomeFailed) {
          Fluttertoast.showToast(msg: state.errorMessage);
        } else if (state is HomeCompleted) {
          result = state.result;

          /*image = null;*/
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        /*if (state is ShowImageInScreen) {
          image = state.imageFile;
        }*/

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              result != "" ? Text(result) : const Text('_____'),

              /*(image == null)
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.asset(
                          'assets/image_not.jpg',
                          width: width / 2,
                        ),
                      ),
                    )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image.file(
                          image!,
                          width: width / 2,
                        ),
                      ),
                    ),*/
              SizedBox(
                height: height * 0.3,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    homeBloc.add(GetPicture(/*type: type*/));
                  },
                  child: SizedBox(
                    width: width * 0.3,
                    child: const Text(
                      'Get location',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              /*   ElevatedButton(
                onPressed: () {
                  type = 'QR';
                  homeBloc.add(GetPicture(type: type));
                },
                child: SizedBox(
                  width: width * 0.3,
                  child: const Text(
                    'take picture QR',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),*/
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        );
      },
    );
  }
}
