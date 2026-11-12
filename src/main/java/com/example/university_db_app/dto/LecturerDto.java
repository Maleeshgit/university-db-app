package com.example.university_db_app.dto;

import com.example.university_db_app.model.Lecturer;

public record LecturerDto(String name, String email, String department) {

    public static LecturerDto from(Lecturer lecturer) {
        return new LecturerDto(
            lecturer.getName(),
            lecturer.getEmail(),
            lecturer.getDepartment().getName()
        );
    }
}
