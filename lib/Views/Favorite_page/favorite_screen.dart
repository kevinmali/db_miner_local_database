import 'package:db_miner_local_database/Helper/data_base.dart';
import 'package:db_miner_local_database/utils/Model/database_model.dart';
import 'package:flutter/material.dart';

class favorite_page extends StatelessWidget {
  const favorite_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: FutureBuilder(
        future: DB_helper.db.viewcategory(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<category>? categotydata = snapshot.data;
            return ListView.builder(
                itemCount: categotydata?.length,
                itemBuilder: (context, i) {
                  return Container(
                    height: 120,
                    width: 220,
                    child: Column(
                      children: [
                        Text("${categotydata?[i].quote}"),
                        Text("${categotydata?[i].id}"),
                      ],
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
