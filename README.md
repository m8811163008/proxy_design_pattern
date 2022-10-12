# proxy_design_pattern

Provide a surrogate or placeholder for another object to control access to it.

# applicability
In this project we used caching request use-case of proxy design 
pattern.
The proxy can implement caching for recurring requests that always
yeild the same results. The proxy may use the parameters of 
requests as the cache key.

* Lazy initialization (virtual proxy)
* Access control (protection proxy)
* Local execution of a remote service (remote proxy)
* Logging requests (logging proxy)
* Caching request result (caching proxy)