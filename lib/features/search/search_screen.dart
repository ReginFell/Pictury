import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pictury/core/ui/base/base_bloc_provider.dart';
import 'package:pictury/features/gallery/gallery_screen.dart';
import 'package:pictury/features/search/search_bloc.dart';
import 'package:pictury/features/search/search_event.dart';
import 'package:pictury/features/search/search_view_state.dart';

class SearchScreen extends StatelessWidget {
  static const String route = "/search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: _buildAppBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Add your category"),
      backgroundColor: Colors.grey.withOpacity(0.5),
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context) {
    return BaseBlocProvider<SearchBloc, SearchViewState>(
      bloc: SearchBloc(),
      builder: (context, model) {
        print(model.currentState.query);

        return Container(
          child: Column(
            children: [
              PlatformTextField(
                onChanged: (text) =>
                    model.dispatch(SearchQueryChangedEvent(text)),
              ),
              Expanded(child: GalleryScreen(model.currentState.query))
            ],
          ),
        );
      },
    );
  }
}
