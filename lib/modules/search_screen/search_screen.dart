import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/search_screen/searchcard.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:intl/intl.dart';

import '../../shared/variables.dart';

class TrainsScreen extends StatelessWidget {
  const TrainsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeScreenCubit cubit = HomeScreenCubit.get(context);
          return Scaffold(
            appBar: bar(
              context: context,
              text: '',
              morelist: false,
            ),
            body: Container(
              color: colortheme.lightPurple,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text('$from to $to',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: colortheme.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                          DateFormat.yMMMEd()
                              .format(DateTime.parse(depart))
                              .toString(),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colortheme.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colortheme.white,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(width * .1),
                            topEnd: Radius.circular(width * .1),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.08,
                        ),
                        child: ConditionalBuilder(
                          condition: state is GetTrainsSuccessState,
                          builder: (context) {
                            if (cubit.searchedTrains.length > 0) {
                              return SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 35, right: 20),
                                      child: Text(
                                          '${cubit.searchedTrains.length} Trains Found',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              )),
                                    ),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: ((context, index) {
                                        return SearchCard(
                                          context: context,
                                          time: cubit.searchedTrains[index]
                                                  ['train']['Timetable'][
                                              cubit.searchedTrains[index]
                                                  ['fromindex']],
                                          trainNUM: cubit.searchedTrains[index]
                                              ['train']['trainNum'],
                                          train: cubit.searchedTrains[index]
                                              ['train'],
                                        );
                                      }),
                                      itemCount: cubit.searchedTrains.length,
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Center(
                                child: Text('NO Trains Found',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: colortheme.lightPurple)),
                              );
                            }
                          },
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator(
                            color: colortheme.lightPurple,
                          )),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
