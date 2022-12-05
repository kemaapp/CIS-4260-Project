package edu.cpp.backend.dao;

import edu.cpp.backend.entity.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
@RepositoryRestResource(collectionResourceRel = "Department", path = "department")

public interface DepartmentRepository extends JpaRepository<Department, Long>{
}
