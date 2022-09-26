import 'package:booking_app/features/hotels/presentation/app_cubit/cubit.dart';
import 'package:booking_app/features/hotels/presentation/app_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/utils/injection/injection_container.dart';
import '../../../../../../core/widget/custom_text_form_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = 'SearchScreen';
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocProvider(
      create: (context) => AppCubit(sl(), sl()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            backgroundColor:Colors.transparent,
            title: const Text('Search'),
            centerTitle: true,
          ),
          body: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CustomFormField(
                    controller: searchController,
                    onFieldSubmitted: (String name) {
                      AppCubit.get(context).getSearch(name: name);
                    },
                    hintText: 'Search',
                    prefix: const Icon(Icons.search),
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'enter text to search';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 130,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(fit: StackFit.expand, children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.network(
                                        'https://images.unsplash.com/photo-1615460549969-36fa19521a4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGhvdGVsfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 180,
                                      top: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppCubit.get(context)
                                              .searchHotels![index]
                                              .name!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.place_outlined,
                                              color: Colors.grey,
                                            ),
                                            Text(
                                              'Sharm Al Sheikh',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xffFFD700),
                                            ),
                                            Text(
                                              '4.7(150+)',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text.rich(
                                          TextSpan(
                                              text: '\$69.99',
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: '/night',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        FontAwesomeIcons.bookmark,
                                        color: Colors.grey,
                                        size: 20,
                                      )),
                                ),
                              ]),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount:  AppCubit.get(context)
                              .searchHotels!.length),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
