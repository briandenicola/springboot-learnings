package tech.bjdazure.entity;

import java.util.UUID;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Coffee {
	@Id
	private String id;
	private String name;

	public Coffee() {
		this.id = UUID.randomUUID().toString();
	}

	public Coffee(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public Coffee(String name) {
		this(UUID.randomUUID().toString(), name);
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setId() {
		this.id = UUID.randomUUID().toString();
	}

	public void setId(String id) {
		this.id = id;
	}
}