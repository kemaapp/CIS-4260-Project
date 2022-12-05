package edu.cpp.backend.entity;

import lombok.Getter;
import lombok.Setter;
import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name="department")
@Getter
@Setter
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    private String code;
    private String name;

    @OneToMany(mappedBy = "department")
    private Set<Course> courses;



}
