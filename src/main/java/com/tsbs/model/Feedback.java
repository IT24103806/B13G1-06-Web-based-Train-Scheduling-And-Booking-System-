package com.tsbs.model;

import java.time.LocalDateTime;

public class Feedback {
    private long feedbackId;
    private int userId;
    private String subject;
    private String message;
    private int rating;
    private String category;
    private String status; // NEW, REVIEWED, ARCHIVED
    private LocalDateTime createdAt;

    public Feedback() {}

    public Feedback(long feedbackId, int userId, String subject, String message, String status, LocalDateTime createdAt) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.subject = subject;
        this.message = message;
        this.status = status;
        this.createdAt = createdAt;
    }

    public Feedback(long feedbackId, int userId, String subject, String message, int rating, String category, String status, LocalDateTime createdAt) {
        this.feedbackId = feedbackId;
        this.userId = userId;
        this.subject = subject;
        this.message = message;
        this.rating = rating;
        this.category = category;
        this.status = status;
        this.createdAt = createdAt;
    }

    public long getFeedbackId() { return feedbackId; }
    public void setFeedbackId(long feedbackId) { this.feedbackId = feedbackId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}


