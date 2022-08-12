package tech.bjdazure.controller;

import tech.bjdazure.entity.Coffee;
import tech.bjdazure.repository.CoffeeRepository;

import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/coffees")
class CoffeeController {
	private final CoffeeRepository coffeeRepository;

	public CoffeeController(CoffeeRepository coffeeRepository) {

		this.coffeeRepository = coffeeRepository; 

		this.coffeeRepository.saveAll(List.of(
			new Coffee("Americano"),
			new Coffee("Cappuccino"),
			new Coffee("Latte")
		));
	}

	@GetMapping
	Iterable<Coffee> getCoffees() {
		return coffeeRepository.findAll();
	}

	@GetMapping("/{id}")
	Optional<Coffee> getCoffeesById(@PathVariable String id) {
		return coffeeRepository.findById(id);
	}

	@PostMapping
	Coffee postCoffee(@RequestBody Coffee coffee) {
		return coffeeRepository.save(coffee);
	}

	@PutMapping("/{id}")
	ResponseEntity<Coffee> putCoffee(@PathVariable String id, @RequestBody Coffee coffee) {
		
		if(!coffeeRepository.existsById(id)) {
			return new ResponseEntity<>(coffeeRepository.save(coffee), HttpStatus.CREATED);
		}
		else {
			coffee.setId(id);
			return new ResponseEntity<>(coffeeRepository.save(coffee), HttpStatus.OK);
		}
	}

	@DeleteMapping("/{id}")
	void deleteCoffee(@PathVariable String id) {
    	coffeeRepository.deleteById(id);
	}
}