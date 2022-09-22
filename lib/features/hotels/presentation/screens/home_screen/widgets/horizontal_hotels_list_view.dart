import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalHotelsListView extends StatelessWidget {
  const HorizontalHotelsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){},
            child: Container(
              width: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                      'https://c4.wallpaperflare.com/wallpaper/354/717/152/moonlight-table-for-two-on-a-beach-brown-wooden-table-and-chair-setting-wallpaper-preview.jpg',
                      fit: BoxFit.fill
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.bookmark,
                          color: Colors.white,
                          size: 25,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,bottom: 30,),
                    child: Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text(
                            'Hotel Royal Sea Crown',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const [
                              Icon(Icons.place_outlined,
                                color: Colors.white,
                              ),
                              Text('Sharm Al Sheikh',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: 10,
      ),
    );
  }
}