import 'package:favorite_places_app/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleControler = TextEditingController();

  void _savePlace(){
    final enteredText = _titleControler.text;
    if ( enteredText.isEmpty) {
      return;
    }

     ref.read(userPlacesProvider.notifier).addPlace(enteredText);
     Navigator.of(context).pop();

  }

  @override
  void dispose() {
    _titleControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Place")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color:Theme.of(context).colorScheme.onBackground),
              controller: _titleControler,
              decoration: InputDecoration(labelText: " Title"),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: () {}, child: Text('Add Place')),
          ],
        ),
      ),
    );
  }
}
