import 'package:flutter/material.dart';

void main() => runApp(const SubsidyApp());

class SubsidyApp extends StatelessWidget {
  const SubsidyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListView(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('Government Subsidy'),
              subtitle: Text(
                  'Government provides subsidies to promote solar in residential rooftop sectors. The subsidy is only available on Residential Homes (Individual Homes & Big Apartments) for Grid Connected Solar SystemsThe state-wise list for residential sector is as follows:\n\n1.Andhra Pradesh\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n2.Arunachal Pradesh\n-\n\n3.Assam\n-\n\n4.Bihar\n40% upto 3kw\n\n5.Chhattisgarh\n40% upto 3kw\n\n6.Delhi\n30%IPGCL subsidy\n\n7.Goa\n30% by center & 20% by State upto 100kw\n\n8.Gujarat\n₹20000/kw upto 10kw\n\n9.Haryana\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n10.	Himachal Pradesh\n10% or ₹4000/kw upto 10kw\n\n11.Jammu & Kashmir\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n12.Jharkhand\n40% upto 3kw\n\n13.Karnataka\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n14.Kerala\n40% for first 3kw & 20% on the remaining upto 10kw\n\n15.Madhya Pradesh\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n16.Maharashtra\n30%of the benchmark cost\n\n17.Manipur\n40% for the first 3kw\n20% for above 3kw upto 10kw\n\n18.Meghalaya\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n19.Mizoram\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n20.Nagaland\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n21.Odisha\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n22.Punjab\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n23.Rajasthan\n40% upto 3kw\n\n24.Sikkim\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n25.Tamil Nadu\n40% for the first 3kw \n20% for above 3kw upto 10kw\n\n26.Telangana\n\n27.Tripura\n\n28.Uttar Pradesh\nRs 15,000 per kW upto 10KW\n\n29.Uttarakhand\n\n30.West Bengal\n'),
            ),
          ],
        ),
      ),
    );
  }
}
