import 'package:apalah/components/item_data.dart';
import 'package:apalah/provider/human_provider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

class MyItem extends StatefulWidget {
  const MyItem({super.key});

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final humanProvider = Provider.of<HumanProvider>(context);
    final humans = humanProvider.humans;

    return Scaffold(
      body: ListView.builder(
        itemCount: humans.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemClicked(
                          humanData: humans[index],
                        ),
                      ));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                    humans[index].image,
                  )),
                  title: Text(humans[index].name),
                  subtitle: Text(humans[index].description),
                  trailing: InkWell(
                    child: !humans[index].check
                        ? const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Iconsax.save_add,
                              color: Colors.grey,
                            ),
                          )
                        : const Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Iconsax.save_minus),
                          ),
                    onTap: () {
                      humanProvider.toggleCheck(index);
                    },
                  ),
                ),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
