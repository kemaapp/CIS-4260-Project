package edu.cpp.backend.entity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import javax.persistence.*;

@Entity
@Table(name="course")
@Data
public class Course {
    @ManyToOne
    @JoinColumn(name = "department_id")
    @JsonIgnore
    private Department department;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    //many courses can belong to one department

    private String number;
    private String title;
    private String description;
}