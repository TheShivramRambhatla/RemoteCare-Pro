
import 'package:care_connect/resources/components/custom_back_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationManuallyView extends StatefulWidget {
  const LocationManuallyView({super.key});

  @override
  State<LocationManuallyView> createState() => _LocationManuallyViewState();
}

class _LocationManuallyViewState extends State<LocationManuallyView> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  String varQuary = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Row(
          children: [
            Spacer(),
            CustomBackButtonWidget(),
          ],
        ),
        title: Text(
          "Enter Your Location",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _searchController,
              onChanged: (query) {
                varQuary = query;
                _search(query);
                // UtilsClass.getPlacesList(query.toLowerCase().trim())
                //     .then((value) {
                //   log(value.toString());
                // });
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(CupertinoIcons.search),
                  suffixIcon: IconButton(
                    icon: Icon(
                      CupertinoIcons.clear_circled,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () {
                      setState(() {
                        _searchResults.clear();
                        varQuary = '';
                        _searchController.clear();
                      });
                    },
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                CupertinoIcons.paperplane_fill,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "Use my current location",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Search Results",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).disabledColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {},
                    title: Row(
                      children: [
                        Icon(
                          CupertinoIcons.paperplane_fill,
                          color: Theme.of(context).primaryColor,
                          size: 16.0,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          varQuary,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(_searchResults[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _search(String query) {
    // In a real app, you would perform an actual search here
    // For this example, we'll use a simple list of results
    setState(() {
      _searchResults =
          List.generate(10, (index) => 'Result ${index + 1} for "$query"');
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
