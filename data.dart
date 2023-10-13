import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ujiassigment/formulir.dart';

class data extends StatefulWidget {
  data({super.key});

  @override
  State<data> createState() => _data();
}

class _data extends State<data> {
  bool? isChecked = false;
  bool? isPhoneInputed = false;
  bool? verifyClicked = false;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController personalIDController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  List<Map<String, dynamic>> userDataList = [];

  @override
  void initState() {
    super.initState();

    // Listen to changes in the text field
    phoneController.addListener(() {
      // Render the view again
      setState(() {});
    });
  }

  void _showDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (date != null) {
      setState(() {
        dateController.text = DateFormat.yMMMd().format(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          'PERSONAL FORM',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => formulir(
                            userDataList: [],
                          )),
                );
              },
              child: const Image(
                image: AssetImage('images/icon.png'),
                width: 32,
                height: 32,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ! fullname
                const Text('Full Name', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: fullnameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter Full Name',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                //! Email
                const Text('Email', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Enter Email',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                //! phone
                const Text('Phone', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width) / 1.5,
                      child: TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          suffixIcon:
                              verifyClicked! && phoneController.text.isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.check_circle,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    )
                                  : null,
                          hintText: 'Enter You Phone Number',
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: phoneController.text.isEmpty
                            ? null
                            : () {
                                setState(() {
                                  verifyClicked = true;
                                });
                              },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(90, 50),
                          elevation: 0.0,
                          alignment: Alignment.center,
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                4.0), // Adjust the radius as needed
                            side: const BorderSide(
                              color:
                                  Colors.blue, // Change the border color
                              width: 2.0, // Adjust the border width
                            ),
                          ),
                        ),
                        child: const Text('Verify'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),

                //! Id Number
                const Text('Personal ID Number', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: personalIDController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Personal ID Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                //! Address
                const Text('Address', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: addressController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Enter You Address',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),

                //! chose a Date
                const Text('Chose a Date', textAlign: TextAlign.start),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: dateController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Chose a Date',
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      activeColor: const Color(0xff4A3DE5),
                      onChanged: (newboolean) {
                        setState(() {
                          isChecked = newboolean;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    const Expanded(
                      child: Text(
                          'Data yang telah diisi sudah benar dan valid'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(MediaQuery.of(context).size.width, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          4.0), // Adjust the radius as needed
                    ),
                  ),
                  onPressed: isChecked!
                      ? () {
                          Map<String, dynamic> userData = {
                            'Full Name': fullnameController.text,
                            'Email': emailController.text,
                            'Phone': phoneController.text,
                            'Personal ID Number': personalIDController.text,
                            'Address': addressController.text,
                            'Date': dateController.text,
                          };
                          userDataList.add(userData);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => formulir(
                                userDataList: userDataList,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}