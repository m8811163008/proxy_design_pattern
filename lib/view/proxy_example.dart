import 'package:flutter/material.dart';
import 'package:proxy_design_pattern/models/customer.dart';
import 'package:proxy_design_pattern/proxy/customer_details_service.dart';
import 'package:proxy_design_pattern/proxy/customer_details_service_proxy.dart';
import 'package:proxy_design_pattern/proxy/icustomer_details_service.dart';
import 'package:proxy_design_pattern/widgets/customer_details_dialog.dart';

/// Initialises and contains the proxy object of the real customer
/// details service.
///
/// When a user selects the option to see more details about the
/// customer, the dialog window appears and loads details about
/// the customer. If the details objects is already stored
/// inside the cache, the proxy service returns that object
/// instantly. Otherwise, a request is send to the real customer
/// details service and the details object is returned from there.
class ProxyExample extends StatefulWidget {
  const ProxyExample({Key? key}) : super(key: key);

  @override
  State<ProxyExample> createState() => _ProxyExampleState();
}

class _ProxyExampleState extends State<ProxyExample> {
  final ICustomerDetailsService _customerDetailsServiceProxy =
      CustomerDetailsServiceProxy(CustomerDetailsService());
  final List<Customer> _customerList = List.generate(10, (_) => Customer());
  void _showCustomerDetails(Customer customer) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return CustomerDetailsDialog(
          service: _customerDetailsServiceProxy,
          customer: customer,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Press on the list tile to see more information about the customer',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            for (var customer in _customerList)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      customer.name[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: const Icon(Icons.info_outline),
                  title: Text(customer.name),
                  onTap: () => _showCustomerDetails(customer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
