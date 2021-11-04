import 'package:blocpattern/bloc_pattern/bloc_provider.dart';
import 'package:blocpattern/bloc_pattern/dogs_query.dart';
import 'package:flutter/material.dart';
import 'package:blocpattern/functions/capitalize_string.dart';
import 'package:blocpattern/globals.dart' as globals;
import 'package:blocpattern/ui/modal_bottom_sheet.dart';


import '../api/request.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
            appBar: AppBar(
                title: const Text('TEST BLoC')
            ),

            body: Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(height: 20),
                const Text('LIST OF DOGS'),
                const SizedBox(height: 10),
                _buildPosts(BlocProvider.of<DogsQueryBloc>(context))
              ],
            )
    );
  }
  Widget _buildPosts(bloc) {
    return StreamBuilder<List<String>>(
        stream: bloc.dogsStream,
        builder: (context, snapshot) {
          print("SNAP => " + snapshot.hasData.toString());
          return snapshot.hasData ?
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  String img = globals.listUrls.isEmpty ?
                  "https://images.dog.ceo/breeds/mix/Annabelle5.jpeg"
                      : globals.listUrls[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: Image
                              .network(img,
                            fit: BoxFit.cover,
                          )
                              .image),
                      title: Text(snapshot.data![index].capitalize(),
                        style: const TextStyle(fontSize: 20),),
                      onTap: () =>
                          showModal(context, snapshot.data![index], img),
                    ),
                  );
                }, itemCount: snapshot.data!.length,
              )
          ) : const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
