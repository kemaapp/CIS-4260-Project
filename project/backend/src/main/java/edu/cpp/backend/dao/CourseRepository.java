package edu.cpp.backend.dao;
import edu.cpp.backend.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin("http://localhost:4200")

public interface CourseRepository extends JpaRepository<Course, Long> {
    Page<Course> findByDepartmentId(@RequestParam("id") Long id, Pageable pageable);
    Page<Course> findByTitleContaining(@RequestParam("title") String title, Pageable pageable);
}
