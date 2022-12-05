package edu.cpp.backend.dao;
import edu.cpp.backend.entity.Section;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SectionRepository extends JpaRepository<Section, Long>{
}
