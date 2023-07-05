import 'package:flutter/material.dart';

class EnterShopDetails extends StatefulWidget {
  const EnterShopDetails({super.key});

  @override
  State<EnterShopDetails> createState() => _EnterShopDetailsState();
}

class _EnterShopDetailsState extends State<EnterShopDetails> {
  String dropdownValue = 'Ward';
  String dropdownValue1 = 'Municipality';
  String dropdownValue2 = 'City';
  String dropdownValue3 = 'Province';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          _shopDetailsContainer(),
          const SizedBox(
            height: 20,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                // Step 3.
                value: dropdownValue,
                // Step 4.
                items: <String>['Ward', 'Cat', 'Tiger', 'Lion']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              const SizedBox(
                width: 140,
              ),
              DropdownButton<String>(
                // Step 3.
                value: dropdownValue1,
                // Step 4.
                items: <String>['Municipality', 'Cat', 'Tiger', 'Lion']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                }).toList(),
                // Step 5.
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            // Step 3.
            value: dropdownValue2,
            // Step 4.
            items: <String>['City', 'Cat', 'Tiger', 'Lion']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 20),
                ),
              );
            }).toList(),
            // Step 5.
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue2 = newValue!;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 260,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},

              //  signIn,
              child: const Text('Proceed',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }

  _shopDetailsContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        const Text(
          'Shop',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        const Text(
          'Details',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Please enter your',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'shop details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              labelText: 'Shop Name',
              labelStyle: TextStyle(
                fontSize: 14.0,
              ),
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 187, 183, 183),
                fontSize: 10.0,
              )),
          style: const TextStyle(fontSize: 14),
        ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
              labelText: 'Shop Address',
              labelStyle: TextStyle(
                fontSize: 14.0,
              ),
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10.0,
              )),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
