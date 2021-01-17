using CustomerService.Models;
using Dapr;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace CustomerService.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CustomerController : ControllerBase
    {
        private readonly ILogger<CustomerController> _logger;

        public CustomerController(ILogger<CustomerController> logger)
        {
            _logger = logger;
        }

        [HttpPost]
        public IActionResult AddCustomer(Customer customer)
        {
            _logger.LogInformation($"AddCustomer called for customer with Id {customer.Id}.");

            var result = new
            {
                Info = $"Customer with Id {customer.Id} succesfully added."
            };

            return Ok(result);
        }


        [HttpPost("customercreated")]
        [Topic("pubsub", "customer-events")]
        public IActionResult CustomerCreated(Customer customer)
        {
            _logger.LogInformation($"CustomerCreated event received from topic 'customer-events' for customer with Id {customer.Id}.");

            return Ok();
        }
    }
}
