package com.greatlearning.customermanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.customermanagement.entity.Customer;
import com.greatlearning.customermanagement.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/list")
	public String customersList(Model model) {
		List<Customer> customers = customerService.findAll();
		model.addAttribute("Customers", customers);
		return "customers-list";
	}

	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		Customer customer = new Customer();
		model.addAttribute("Customer", customer);
		return "customer-form";
	}

	@RequestMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("custId") int id, Model model) {
		Customer customer = new Customer();
		customer = customerService.findById(id);
		model.addAttribute("Customer", customer);
		return "customer-form";
	}

	@PostMapping("/save")
	public String saveCustomer(@RequestParam("custId") int cid, @RequestParam("firstName") String fName,
			@RequestParam("lastName") String lName, @RequestParam("emailId") String emailid) {

		System.out.println(cid);
		Customer customer;

		
		if (cid != 0) {
			//update customer record
			customer = customerService.findById(cid);
			customer.setFirstName(fName);
			customer.setLastName(lName);
			customer.setEmailId(emailid);
		} else {
			//add customer record
			customer = new Customer(fName, lName, emailid);
		}
		customerService.save(customer);

		return "redirect:/customer/list";
	}

	@RequestMapping("/delete")
	public String deleteCustomer(@RequestParam("custId") int cid) {
		customerService.deleteById(cid);
		return "redirect:/customer/list";
	}

}
