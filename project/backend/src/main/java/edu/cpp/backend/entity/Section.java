package edu.cpp.backend.entity;

import lombok.Data;
import javax.persistence.*;

@Entity
@Table(name="section")
@Data

public class Section {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne(targetEntity = Course.class)
    @JoinColumn(name = "course_id", nullable = false)

    private Long number;
    private Long year;
    private String semester;

}