import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:travel_list/common/common_export.dart';

class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: n150,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).colorScheme.surface,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    textColor: Theme.of(context).colorScheme.primaryContainer,
                    title: const Text(location),
                    subtitle: const Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text('Exact location'),
                      ],
                    ),
                    trailing: const CircleAvatar(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: n10),
                    child: SearchTextField(),
                  )
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(manutdStars),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(n20)),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ListTile(
                              title: Text(
                                'Travel title',
                                style: getBoldStyle(
                                  fontSize: n20,
                                  color: white,
                                ),
                              ),
                              subtitle: Text(
                                'To decorate an image asset in Flutter, you can use the Container widget to wrap.',
                                style: getLightStyle(color: white),
                              ),
                              trailing: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline),
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Platform.isAndroid
            //     ?
            showMaterialModalBottomSheet(
              bounce: true,
              context: context,
              builder: (context) => Container(),
            );
            // : showCupertinoModalBottomSheet(
            //     context: context,
            //     builder: (context) => Container(),
            //   );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
