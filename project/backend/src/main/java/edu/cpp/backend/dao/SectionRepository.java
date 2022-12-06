package edu.cpp.backend.dao;
import edu.cpp.backend.entity.Section;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;

@CrossOrigin("http://localhost:4200")

public interface SectionRepository extends JpaRepository<Section, Long>{
}
