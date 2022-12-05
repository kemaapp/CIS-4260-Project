package edu.cpp.backend.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import javax.persistence.*;

@Entity
@Table(name="course")
@Data
public class Course {
    @JsonIgnore
    private Department department;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    //many courses can belong to one department
    @ManyToOne(targetEntity = Department.class)
    @JoinColumn(name = "department_id", nullable = false)

    private String number;
    private String title;
    private String description;
}