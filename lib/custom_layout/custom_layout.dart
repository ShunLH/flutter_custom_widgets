import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_components/utils/strings.dart';

import '../utils/constants.dart';
import '../utils/dimens.dart';

class CustomLayout extends StatefulWidget {
  const CustomLayout({Key? key}) : super(key: key);

  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formation = Formations.FOUR_FOUR_TWO;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FootballPitchBackgroundView(),
          FormationView(formation: this.formation)
          // FormationViewFourFourTwo(),
          // FormationFourTowThreeOneView(),

          // FormationFourThreeThreeView(),
          // FormationThreeFourThreeView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState((){
            formation = Formations.values[Random().nextInt(Formations.values.length)];
          });
        },

      ),
    );
  }
}
class FormationView extends StatelessWidget {

  final Formations formation;
  FormationView({required this.formation});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formation),
    );
  }
  Widget _generateFormation(Formations formation){
    switch (formation){
      case Formations.FOUR_FOUR_TWO:
        return FormationViewFourFourTwo();
      case Formations.FOUR_THREE_THREE:
        return FormationFourThreeThreeView();
      case Formations.FOUR_TWO_THREE_ONE:
        return FormationFourTowThreeOneView();
      case Formations.THREE_FOUR_THREE:
        return FormationThreeFourThreeView();
    }
  }
}


class FormationViewFourFourTwo extends StatelessWidget {
  const FormationViewFourFourTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationFourTowThreeOneView extends StatelessWidget {
  const FormationFourTowThreeOneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          PlayerView(isGoalKeeper: false,),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationFourThreeThreeView extends StatelessWidget {
  const FormationFourThreeThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FormationThreeFourThreeView extends StatelessWidget {
  const FormationThreeFourThreeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          PlayerView(
            isGoalKeeper: true,
          ),
        ],
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  const FootballPitchBackgroundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        IMG_FOOTBALL_PITCH,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final bool isGoalKeeper;

  PlayerView({this.isGoalKeeper = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: MARGIN_XLARGE,
          height: MARGIN_XLARGE,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
            color: (this.isGoalKeeper) ? Colors.yellow : Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
