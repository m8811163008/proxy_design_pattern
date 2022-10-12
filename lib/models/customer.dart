import 'package:faker/faker.dart';
import 'package:proxy_design_pattern/models/customer_details.dart';

/// Stores information about the customer.
///
/// On of its properties [CustomerDetails] which stores
/// additional data about the customer e.g. its email, hobby and
/// position.
class Customer {
  late final String id;
  late final String name;
  CustomerDetails? details;

  Customer() {
    id = faker.guid.guid();
    name = faker.person.name();
  }
}
