package tech.bjdazure.controller;

import tech.bjdazure.entity.Coffee;
import java.util.List;
import java.util.Optional;
import java.util.ArrayList;

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
class RestApiDemoController {
	private List<Coffee> coffees = new ArrayList<>();

	public RestApiDemoController() {
		coffees.addAll(List.of(
			new Coffee("Americano"),
			new Coffee("Cappuccino"),
			new Coffee("Latte")
		));
	}

	@GetMapping
	Iterable<Coffee> getCoffees() {
		return coffees; 
	}

	@GetMapping("/{id}")
	Optional<Coffee> getCoffeesById(@PathVariable String id) {
		for (Coffee c: coffees) {
			if( c.getId().equals(id)) {
				return Optional.of(c);
			}
		}

		return Optional.empty();
	}

	@PostMapping
	Coffee postCoffee(@RequestBody Coffee coffee) {
		if( coffee.getId() == null ){
			coffee.setId();
		}
		coffees.add(coffee);
		return coffee;
	}

	@PutMapping("/{id}")
	Coffee putCoffee(@PathVariable String id, @RequestBody Coffee coffee) {
		int coffeeIndex = -1;

		for (Coffee c: coffees) {
			if (c.getId().equals(id)) {
				coffeeIndex = coffees.indexOf(c);
				coffees.set(coffeeIndex, coffee);
			}
		}

		if( coffee.getId() == null ){
			coffee.setId(id);
		}

		return (coffeeIndex == -1) ? postCoffee(coffee) : coffee;
	}

	@DeleteMapping("/{id}")
	void deleteCoffee(@PathVariable String id) {
    	coffees.removeIf(c -> c.getId().equals(id));
	}
}