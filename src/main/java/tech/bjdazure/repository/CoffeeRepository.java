package tech.bjdazure.repository;

import tech.bjdazure.entity.*;

import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface CoffeeRepository extends CrudRepository<Coffee, String> {}