package com.test;

import com.dao.ExerciseDao;
import com.model.ExerciseModel;

public class TestInsert {
    public static void main(String[] args) {
        ExerciseDao dao = new ExerciseDao();
        ExerciseModel exercise = new ExerciseModel();
        exercise.setPatientId(1);
        exercise.setExerciseName("Test");
        exercise.setFocusArea("Test");
        exercise.setDescription("Test");
        exercise.setVideoUrl("Test");
        boolean success = dao.insertExercise(exercise);
        System.out.println("Success: " + success);
    }
}
