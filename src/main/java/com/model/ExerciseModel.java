package com.model;

public class ExerciseModel {
    private int exerciseId;
    private Integer patientId; // nullable to allow generic or patient-linked exercises
    private String exerciseName;
    private String focusArea;
    private String description;
    private String videoUrl;

    public ExerciseModel() {}

    public ExerciseModel(int exerciseId, Integer patientId, String exerciseName, String focusArea, String description, String videoUrl) {
        this.exerciseId = exerciseId;
        this.patientId = patientId;
        this.exerciseName = exerciseName;
        this.focusArea = focusArea;
        this.description = description;
        this.videoUrl = videoUrl;
    }

    public int getExerciseId() {
        return exerciseId;
    }

    public void setExerciseId(int exerciseId) {
        this.exerciseId = exerciseId;
    }

    public Integer getPatientId() {
        return patientId;
    }

    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    public String getExerciseName() {
        return exerciseName;
    }

    public void setExerciseName(String exerciseName) {
        this.exerciseName = exerciseName;
    }

    public String getFocusArea() {
        return focusArea;
    }

    public void setFocusArea(String focusArea) {
        this.focusArea = focusArea;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
