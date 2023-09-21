import 'package:average/models/activity.dart';
import 'package:average/screens/home/components/footer.dart';
import 'package:average/screens/home/components/header.dart';
import 'package:average/screens/home/components/homework_list.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Activity> activities;

  @override
  void initState() {
    super.initState();

    Activity work1 = Activity(label: "TR1", score: 0.0, id: uuid.v4());
    Activity work2 = Activity(label: "TR2", score: 0.0, id: uuid.v4());
    Activity work3 = Activity(label: "TR3", score: 0.0, id: uuid.v4());
    Activity work4 = Activity(label: "P1", score: 0.0, id: uuid.v4());

    activities = [work1, work2, work3, work4];
  }

  void addActivity(Activity activity) {
    setState(() {
      activities.add(activity);
    });
  }

  void deleteActivity(Activity activity) {
    setState(() {
      activities.removeWhere((element) => element.id == activity.id);
    });
  }

  void updateActivityScore(double score, String activityId) {
    setState(() {
      activities = activities.map((activity) {
        if (activity.id == activityId) activity.updateScore(score);
        return activity;
      }).toList();
    });
  }

  double getAverage() {
    double sum = 0;

    activities.toList().forEach((activity) {
      sum += activity.score;
    });

    if (activities.isEmpty) return 0;

    return sum / activities.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                // Footer to Calculate Average
                Positioned.fill(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Header
                        const HomeHeader(),
                        // HomeWorks Lists
                        ActivityList(
                          activities: activities,
                          addActivity: addActivity,
                          deleteActivity: deleteActivity,
                          updateActivityScore: updateActivityScore,
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  width: constraints.maxWidth,
                  bottom: 0,
                  child: HomeFooter(
                    average: getAverage(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
