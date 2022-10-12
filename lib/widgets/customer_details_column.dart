import 'package:flutter/material.dart';
import 'package:proxy_design_pattern/models/customer_details.dart';
import 'package:proxy_design_pattern/widgets/customer_info_group.dart';

class CustomerDetailsColumn extends StatelessWidget {
  final CustomerDetails customerDetails;

  const CustomerDetailsColumn({
    required this.customerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomerInfoGroup(
          label: 'E-mail',
          text: customerDetails.email,
        ),
        const SizedBox(height: 12.0),
        CustomerInfoGroup(
          label: 'Position',
          text: customerDetails.position,
        ),
        const SizedBox(height: 12.0),
        CustomerInfoGroup(
          label: 'Hobby',
          text: customerDetails.hobby,
        ),
      ],
    );
  }
}
