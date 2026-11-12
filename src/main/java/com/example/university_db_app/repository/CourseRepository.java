package com.example.university_db_app.repository;

import com.example.university_db_app.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CourseRepository extends JpaRepository<Course, Long> {

    Optional<Course> findByCode(String code);

    // WHERE credits >= ?
    List<Course> findByCreditsGreaterThanEqual(Integer credits);

    List<Course> findByTitleContainingIgnoreCase(String text);

    // two relationships deep: Course -> lecturer -> name (SQL JOIN is generated for you)
    List<Course> findByLecturer_Name(String lecturerName);

    // three levels: Course -> lecturer -> department -> name (two JOINs)
    List<Course> findByLecturer_Department_Name(String departmentName);
}
