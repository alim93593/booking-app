import 'package:booking_app/core/themes/light.dart';
import 'package:booking_app/core/widget/custom_text_form_field.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/horizontal_hotels_list_view.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/section_name.dart';
import 'package:booking_app/features/hotels/presentation/screens/home_screen/widgets/vertical_hotels_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: const [
                  SizedBox(
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/49/3f/a0/493fa0f13970ab3ef29375669f670451.jpg',
                      ),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Hello Ahmad!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Where do you want to stay?',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: CustomFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Your search field is empty';
                          }
                          return null;
                        },
                        hintText: 'Search your hotel',
                        prefix: const Icon(
                          Icons.search_rounded,
                          size: 30,
                        ),
                        textInputType: TextInputType.text,
                        controller: searchController,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.tune_outlined,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const SectionName(
                name: 'Popular Hotels',
              ),
              const SizedBox(
                height: 20,
              ),
              const HorizontalHotelsListView(),
              const SizedBox(
                height: 30,
              ),
              const SectionName(
                name: 'More Hotels',
              ),
              const SizedBox(
                height: 10,
              ),
              const VerticalHotelsListView(),
            ]),
          ),
        ),
      ),
    );
  }
}
