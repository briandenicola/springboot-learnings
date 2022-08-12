package tech.bjdazure.repository;

import tech.bjdazure.entities.Aircraft;
import tech.bjdazure.repository.AircraftRepository;

import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;

@Repository
public interface AircraftRepository extends CrudRepository<Aircraft, String> {}