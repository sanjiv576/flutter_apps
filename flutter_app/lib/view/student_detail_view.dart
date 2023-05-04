import 'package:flutter/material.dart';

// enum for gender

enum GenderType {
  m('male'),
  fe('female');

  final String gender;

  const GenderType(this.gender);
}

class StudentDetailView extends StatefulWidget {
  const StudentDetailView({super.key});

  @override
  State<StudentDetailView> createState() => _StudentDetailViewState();
}

class _StudentDetailViewState extends State<StudentDetailView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  // group for gender
  GenderType _genderGroup = GenderType.m;

  // entries for city

  String? selectedCity;
  List<String> cityList = ['Kahtmandu', 'Lalitpur', 'Bhaktapur'];

  late final List<DropdownMenuEntry<String>> _cityEntries =
      <DropdownMenuEntry<String>>[];

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    for (String city in cityList) {
      _cityEntries.add(DropdownMenuEntry(label: city, value: city));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            'Student Detail Form',
          ),
          centerTitle: true,
          elevation: 3.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter first name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      hintText: 'E.g Sanjiv',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter your last name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      hintText: 'E.g Shrestha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ageController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter your age';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Age',
                      hintText: 'E.g 44',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Select gender',
                    textAlign: TextAlign.left,
                  ),
                  ListTile(
                    title: const Text(
                      'Male',
                    ),
                    leading: Radio(
                        value: GenderType.m,
                        groupValue: _genderGroup,
                        onChanged: (GenderType? value) {
                          setState(() {
                            _genderGroup = value!;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text('Female'),
                    leading: Radio(
                        value: GenderType.fe,
                        groupValue: _genderGroup,
                        onChanged: (GenderType? value) {
                          setState(() {
                            _genderGroup = value!;
                          });
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: addressController,
                    validator: (value) {
                      return value == null || value.isEmpty
                          ? 'Please, enter your address'
                          : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'E.g Putalisadak 4, Kathmandu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    minLines: 4,
                    maxLines: 8,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownMenu(
                    width: 350.0,
                    dropdownMenuEntries: _cityEntries,
                    initialSelection: cityList[0],
                    controller: cityController,
                    label: const Text('Select your city'),
                    onSelected: (value) {
                      setState(() {
                        selectedCity = value;
                      });
                      // print(selectedCity);
                    },
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text('Save Student'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/displayStudentRoute');
                      },
                      child: const Text('Display Details'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
