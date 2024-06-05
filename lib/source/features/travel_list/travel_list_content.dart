import 'package:flutter/material.dart';

import '../../../common/common_export.dart';

class TravelListContent extends StatefulWidget {
  const TravelListContent({
    super.key,
  });

  @override
  State<TravelListContent> createState() => _TravelListContentState();
}

class _TravelListContentState extends State<TravelListContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

