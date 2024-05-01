import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:med_eg/services/get_all_medicines.dart';

class SearchBarForMedicines extends StatefulWidget {
  final void Function(String) onMedicineSelected;

  const SearchBarForMedicines({Key? key, required this.onMedicineSelected}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SearchBarForMedicines> {
  late TextEditingController controller;
  List<String> medicines = [];

  
void fetchMedicinesList() async {
    // Simulating fetching medicines list
    medicines=await GetAllMedicineService().GetAllMedicines(context);
  }

  @override
  void initState() {
    super.initState();
    fetchMedicinesList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Autocomplete(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              } else {
                return medicines.where((word) => word.toLowerCase().contains(textEditingValue.text.toLowerCase()));
              }
            },
            optionsViewBuilder: (context, Function(String) onSelected, options) {
              return Material(
                elevation: 4,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);

                    return ListTile(
                      title: Text(option.toString()),
                      onTap: () {
                        onSelected(option.toString());
                        widget.onMedicineSelected(option.toString()); // Notify Test widget of selected medicine
                      },
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: options.length,
                ),
              );
            },
            fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
              this.controller = controller;

              return TextField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: kPrimaryColor),
                  ),
                  hintText: "Search for medicine",
                  prefixIcon: Icon(Icons.search),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
