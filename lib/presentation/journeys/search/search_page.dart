import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/blocs/search/search_bloc.dart';
import 'package:news_app/presentation/journeys/search/search_bar.dart';
import 'package:news_app/presentation/journeys/search/search_results.dart';

class SearchPage extends StatefulWidget {
  final BuildContext providerContext;
  SearchPage({Key key, @required this.providerContext}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  SearchBloc get searchPageBloc =>
      BlocProvider.of<SearchBloc>(widget.providerContext);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      cubit: searchPageBloc,
      builder: (context, state) {
        print("State : ${state.currentTextFieldText}");
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                    top: 15.0,
                    bottom: 10.0,
                  ),
                  child: Container(
                    height: 50.0,
                    child: Row(
                      children: [
                        Container(
                          width: 50.0,
                          child: IconButton(
                              icon: Icon(EvaIcons.arrowIosBackOutline),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Expanded(
                          child: SearchBar(
                            searchBloc: searchPageBloc,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchResults(
                        searchState: state,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
