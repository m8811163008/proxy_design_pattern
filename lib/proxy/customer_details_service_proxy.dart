import 'package:proxy_design_pattern/models/customer_details.dart';
import 'package:proxy_design_pattern/proxy/customer_details_service.dart';
import 'package:proxy_design_pattern/proxy/icustomer_details_service.dart';

/// Contains the cache (dictionary object) and sends the request
/// to the real [CustomerDetailsService] only if the customer
/// details object is not available in the cache.
///
/// A specific implementation of [ICustomerDetailsService]
/// interface- a proxy for the real customer details service.
/// Before making a call to the customer details service, the
/// proxy service checks weather the customer details are already
/// fetched and saved in the cache. If yest, the customer details
/// object is returned from the cache, otherwise, a request is
/// sent to the real customer service and its value is saved to
/// the cache and returned.
class CustomerDetailsServiceProxy implements ICustomerDetailsService {
  final ICustomerDetailsService service;
  final Map<String, CustomerDetails> customerDetailsCache = {};
  CustomerDetailsServiceProxy(this.service);

  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    if (customerDetailsCache.containsKey(id)) {
      return customerDetailsCache[id]!;
    }
    final customerDetails = await service.getCustomerDetails(id);
    customerDetailsCache[id] = customerDetails;
    return customerDetails;
  }
}
