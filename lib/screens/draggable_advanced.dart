import 'package:drag_and_drop/data/data.dart';
import 'package:drag_and_drop/widgets/draggable_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../utils.dart';

class DraggableAdvancedPage extends StatefulWidget {
  @override
  _DraggableAdvancedPageState createState() => _DraggableAdvancedPageState();
}

class _DraggableAdvancedPageState extends State<DraggableAdvancedPage> {
  final List<Animal> all = allAnimals;
  final List<Animal> land = [];
  final List<Animal> air = [];

  final double size = 150;

  void removeAll(Animal toRemove) {
    all.removeWhere((animal) => animal.name == toRemove.name);
    land.removeWhere((animal) => animal.name == toRemove.name);
    air.removeWhere((animal) => animal.name == toRemove.name);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Draggable"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  buildTarget(
                    context,
                    text: 'All',
                    animals: all,
                    acceptTypes: AnimalType.values,
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      all.add(data);
                    }),
                  ),
                ],
              ),
              Column(
                children: [
                  buildTarget(
                    context,
                    text: 'Animals',
                    animals: land,
                    acceptTypes: [AnimalType.land],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      land.add(data);
                    }),
                  ),
                ],
              ),
              Column(
                children: [
                  buildTarget(
                    context,
                    text: 'Birds',
                    animals: air,
                    acceptTypes: [AnimalType.air],
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      air.add(data);
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget buildTarget(
    BuildContext context, {
    required String text,
    required List<Animal> animals,
    required List<AnimalType> acceptTypes,
    required DragTargetAccept<Animal> onAccept,
  }) =>
      SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * .8,
          child: Column(
            children: [
              IgnorePointer(child: Center(child: buildText(text))),
              Container(
                width: 150,
                height: 600,
                child: DragTarget<Animal>(
                  builder: (context, candidateData, rejectedData) =>
                      SingleChildScrollView(
                    child: Column(
                      children: [
                        IgnorePointer(child: Center(child: buildText(text))),
                        ...animals
                            .map((animal) => DraggableWidget(animal: animal))
                            .toList(),
                        // IgnorePointer(child: Center(child: buildText(text))),
                      ],
                    ),
                  ),
                  onWillAccept: (data) => true,
                  onAccept: (data) {
                    if (acceptTypes.contains(data.type)) {
                      print("good");
                    } else {
                      print("bad");
                    }

                    onAccept(data);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildText(String text) => Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            blurRadius: 12,
          )
        ]),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
