import 'package:faker/faker.dart';
import 'package:proxy_design_pattern/models/customer_details.dart';
import 'package:proxy_design_pattern/proxy/icustomer_details_service.dart';

/// Creates customer detail and implements
/// [ICustomerDetailsService].
///
/// The real customer details service.
class CustomerDetailsService implements ICustomerDetailsService {
  @override
  Future<CustomerDetails> getCustomerDetails(String id) {
    return Future.delayed(const Duration(seconds: 1), () {
      final email = faker.internet.email();
      final hobby = faker.sport.name();
      final position = faker.job.title();

      return CustomerDetails(id, email, hobby, position);
    });
  }
}
