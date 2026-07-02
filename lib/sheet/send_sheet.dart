// C. OPENS SEARCHABLE SEND-TO-CONNECTION DRAWER PANEL
import 'package:flutter/material.dart';

void openSendSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    builder: (context) => SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          const SizedBox(height: 12),
          Text('Send post', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade800)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFFEDF3F8), borderRadius: BorderRadius.circular(4)),
              child: const TextField(
                decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search connections', border: InputBorder.none),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                leading:  CircleAvatar(
                  backgroundColor: Colors.blueGrey,),
                title: const Text('Alexie', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                trailing: TextButton(onPressed: () => Navigator.pop(context), child: const Text('Send')),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}