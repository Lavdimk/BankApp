import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'transaction_data.dart';
import 'transaction.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DateTime? selectedDate; 
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3), 
      ),
    );
  }

  void _showDataPicker() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2025),
    );

    if (selected != null) {
      setState(() {
        selectedDate = selected;
      });
    }
  }

  double totalCredit = 1200.0;
  double totalDebit = 900.0;
  double totalBalance = 300.0; 

  void updateCredit(double amount) {
    setState(() {
      totalCredit += amount;
      totalBalance += amount;
    });
  }

  void updateDebit(double amount) {
    setState(() {
      totalDebit += amount;
      totalBalance -= amount;
    });
  }

  bool isAllFieldsFilled() {
    
    final euroValue = euroController.text;
    final descriptionValue = descriptionController.text;
    final selectedDateValue = selectedDate;


    if (euroValue.isEmpty ||
        descriptionValue.isEmpty ||
        selectedDateValue == null) {
      return false; 
    }

   
    return true;
  }

  final TextEditingController euroController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
   
    euroController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool isCreditSelected = true; 
  @override
  Widget build(BuildContext context) {
    Color creditColor = isCreditSelected ? Colors.green : Colors.grey;
    Color debitColor = isCreditSelected ? Colors.grey : Colors.red;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade200,
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 216,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Total Balance",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.00, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$$totalBalance",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 26.00,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        cardCredit(
                            totalCredit.toString()), 
                        cardDebit(
                            totalDebit.toString()), 
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Transaction",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 28.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(
                Icons.euro,
                size: 25,
                
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: euroController,
                    decoration: const InputDecoration(
                      hintText: "0",
                      border: InputBorder.none, 
                      contentPadding:
                          EdgeInsets.all(16), 
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ], 
                    keyboardType: TextInputType
                        .number,
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(
                Icons.description,
                size: 25,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        16), 
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: "Enter description",
                      border: InputBorder.none, 
                      contentPadding:
                          EdgeInsets.all(16), 
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Icon(
                Icons.moving_sharp, 
                size: 25,
              ),
              
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing:
                      2, 
                  children: [
                    const SizedBox(width: 10),
                    ChoiceChip(
                      label: const Text("Credit"),
                      selected: isCreditSelected,
                      onSelected: (isSelected) {
                        setState(() {
                          isCreditSelected = isSelected;
                        });
                      },
                      selectedColor:
                          creditColor, 
                      backgroundColor: Colors
                          .grey, 
                    ),
                    const SizedBox(
                        width: 10), 
                    ChoiceChip(
                      label: const Text("Debit"),
                      selected: !isCreditSelected,
                      onSelected: (isSelected) {
                        setState(() {
                          isCreditSelected = !isSelected;
                        });
                      },
                      selectedColor:
                          debitColor, 
                      backgroundColor: Colors
                          .grey, 
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () => _showDataPicker(),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
            child: Row(
              children: [
                const Icon(Icons.date_range, size: 25),
                const SizedBox(width: 15),
                Text(
                  selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" 
                      : "Date",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50, 
            child: ElevatedButton(
              onPressed: () {
                if (isAllFieldsFilled()) {
                 
                  double euroValue = 0.0;
                  String descriptionValue = '';
                  bool isCredit = true; 
                  DateTime? selectedDateValue;

                  
                  final euroText = euroController.text;

                  if (euroText.isNotEmpty) {
                    euroValue = double.tryParse(euroText) ?? 0.0;
                  } 

                  descriptionValue = descriptionController.text;
                  isCredit = isCreditSelected;
                  selectedDateValue = selectedDate;

                  final newTransaction = Transaction(
                    isCredit: isCredit,
                    amount: euroValue,
                    description: descriptionValue,
                    date: selectedDateValue ?? DateTime.now(),
                  );

                  
                  transactionData.addTransaction(newTransaction);

                  
                  if (isCredit) {
                    updateCredit(euroValue);
                  } else {
                    updateDebit(euroValue);
                  }

                  _showSnackbar("Transaction added successfully!");
                } else {
                  _showSnackbar("Please fill in all required fields.");
                }
              },
              child: const Text("Add"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardCredit(String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(7.0),
          margin: const EdgeInsets.only(
            right: 8,
          ),
          child: Icon(
            Icons.arrow_downward,
            size: 28,
            color: Colors.green[700],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Credit",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget cardDebit(String value) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(7.0),
          margin: const EdgeInsets.only(
            right: 8,
          ),
          child: Icon(
            Icons.arrow_upward,
            size: 28,
            color: Colors.red[700],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Debit",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ],
    );
  }
}
