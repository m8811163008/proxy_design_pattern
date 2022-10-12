import 'package:proxy_design_pattern/models/customer_details.dart';
import 'package:proxy_design_pattern/proxy/customer_details_service.dart';
import 'package:proxy_design_pattern/proxy/customer_details_service_proxy.dart';

/// Defines methods for the customer details service to be
/// implemented by the [CustomerDetailsService] and its proxy
/// [CustomerDetailsServiceProxy].
abstract class ICustomerDetailsService {
  /// Sending customer details for a specific [Customer].
  Future<CustomerDetails> getCustomerDetails(String id);
}
