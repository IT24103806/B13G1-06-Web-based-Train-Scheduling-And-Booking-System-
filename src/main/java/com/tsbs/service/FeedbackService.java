package com.tsbs.service;

import com.tsbs.dao.FeedbackDAO;
import com.tsbs.dao.UserDAO;
import com.tsbs.model.Feedback;
import com.tsbs.model.User;

import java.util.List;
import java.util.Map;

/**
 * Service class for Feedback Management
 * Handles business logic for feedback operations
 */
public class FeedbackService {
    
    private final FeedbackDAO feedbackDAO;
    private final UserDAO userDAO;
    
    public FeedbackService() {
        this.feedbackDAO = new FeedbackDAO();
        this.userDAO = new UserDAO();
    }
    
    /**
     * Submit feedback
     * @param userId User ID
     * @param subject Feedback subject
     * @param message Feedback message
     * @param rating Rating (1-5)
     * @param category Feedback category
     * @return true if submission successful, false otherwise
     */
    public boolean submitFeedback(int userId, String subject, String message, int rating, String category) {
        if (userId <= 0 || subject == null || message == null || category == null ||
            subject.trim().isEmpty() || message.trim().isEmpty() || category.trim().isEmpty()) {
            return false;
        }
        
        // Validate rating
        if (rating < 1 || rating > 5) {
            return false;
        }
        
        // Validate user exists
        User user = userDAO.getUserById(userId);
        if (user == null) {
            return false;
        }
        
        // Validate message length
        if (message.trim().length() < 10 || message.trim().length() > 1000) {
            return false;
        }
        
        // Validate subject length
        if (subject.trim().length() < 5 || subject.trim().length() > 200) {
            return false;
        }
        
        return feedbackDAO.createFeedback(userId, subject.trim(), message.trim(), rating, category.trim());
    }
    
    /**
     * Get feedback by ID
     * @param feedbackId Feedback ID
     * @return Feedback object if found, null otherwise
     */
    public Feedback getFeedbackById(int feedbackId) {
        if (feedbackId <= 0) {
            return null;
        }
        return feedbackDAO.getFeedbackById(feedbackId);
    }
    
    /**
     * Get all feedback
     * @return List of all feedback
     */
    public List<Feedback> getAllFeedback() {
        return feedbackDAO.getAllFeedback();
    }
    
    /**
     * Get feedback by user
     * @param userId User ID
     * @return List of feedback submitted by the user
     */
    public List<Feedback> getFeedbackByUser(int userId) {
        if (userId <= 0) {
            return null;
        }
        return feedbackDAO.getFeedbackByUser(userId);
    }
    
    /**
     * Get feedback by category
     * @param category Feedback category
     * @return List of feedback in the category
     */
    public List<Feedback> getFeedbackByCategory(String category) {
        if (category == null || category.trim().isEmpty()) {
            return null;
        }
        return feedbackDAO.getFeedbackByCategory(category.trim());
    }
    
    /**
     * Get feedback by rating
     * @param rating Rating (1-5)
     * @return List of feedback with the rating
     */
    public List<Feedback> getFeedbackByRating(int rating) {
        if (rating < 1 || rating > 5) {
            return null;
        }
        return feedbackDAO.getFeedbackByRating(rating);
    }
    
    /**
     * Get recent feedback
     * @param limit Number of recent feedback to retrieve
     * @return List of recent feedback
     */
    public List<Feedback> getRecentFeedback(int limit) {
        if (limit <= 0) {
            return null;
        }
        return feedbackDAO.getRecentFeedback(limit);
    }
    
    /**
     * Update feedback
     * @param feedbackId Feedback ID
     * @param subject New subject
     * @param message New message
     * @param rating New rating
     * @param category New category
     * @return true if update successful, false otherwise
     */
    public boolean updateFeedback(int feedbackId, String subject, String message, int rating, String category) {
        if (feedbackId <= 0 || subject == null || message == null || category == null ||
            subject.trim().isEmpty() || message.trim().isEmpty() || category.trim().isEmpty()) {
            return false;
        }
        
        // Validate rating
        if (rating < 1 || rating > 5) {
            return false;
        }
        
        // Validate message length
        if (message.trim().length() < 10 || message.trim().length() > 1000) {
            return false;
        }
        
        // Validate subject length
        if (subject.trim().length() < 5 || subject.trim().length() > 200) {
            return false;
        }
        
        return feedbackDAO.updateFeedback(feedbackId, subject.trim(), message.trim(), rating, category.trim());
    }
    
    /**
     * Delete feedback
     * @param feedbackId Feedback ID
     * @return true if deletion successful, false otherwise
     */
    public boolean deleteFeedback(int feedbackId) {
        if (feedbackId <= 0) {
            return false;
        }
        return feedbackDAO.deleteFeedback(feedbackId);
    }
    
    /**
     * Get feedback statistics
     * @return Map containing feedback statistics
     */
    public Map<String, Object> getFeedbackStats() {
        return feedbackDAO.getFeedbackStats();
    }
    
    /**
     * Get average rating
     * @return Average rating across all feedback
     */
    public double getAverageRating() {
        return feedbackDAO.getAverageRating();
    }
    
    /**
     * Get rating distribution
     * @return Map containing count for each rating (1-5)
     */
    public Map<Integer, Integer> getRatingDistribution() {
        return feedbackDAO.getRatingDistribution();
    }
    
    /**
     * Get feedback count by category
     * @return Map containing count for each category
     */
    public Map<String, Integer> getFeedbackCountByCategory() {
        return feedbackDAO.getFeedbackCountByCategory();
    }
    
    /**
     * Get feedback count by user
     * @param userId User ID
     * @return Number of feedback submitted by user
     */
    public int getFeedbackCountByUser(int userId) {
        if (userId <= 0) {
            return 0;
        }
        return feedbackDAO.getFeedbackCountByUser(userId);
    }
    
    /**
     * Search feedback by keyword
     * @param keyword Search keyword
     * @return List of feedback containing the keyword
     */
    public List<Feedback> searchFeedback(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return null;
        }
        return feedbackDAO.searchFeedback(keyword.trim());
    }
    
    /**
     * Get feedback with user details
     * @param feedbackId Feedback ID
     * @return Map containing feedback and user details
     */
    public Map<String, Object> getFeedbackWithUserDetails(int feedbackId) {
        if (feedbackId <= 0) {
            return null;
        }
        return feedbackDAO.getFeedbackWithUserDetails(feedbackId);
    }
    
    /**
     * Get all feedback with user details
     * @return List of maps containing feedback and user details
     */
    public List<Map<String, Object>> getAllFeedbackWithUserDetails() {
        return feedbackDAO.getAllFeedbackWithUserDetails();
    }
    
    /**
     * Validate feedback category
     * @param category Category to validate
     * @return true if valid category, false otherwise
     */
    public boolean isValidCategory(String category) {
        if (category == null || category.trim().isEmpty()) {
            return false;
        }
        
        String[] validCategories = {
            "General", "Booking", "Payment", "Schedule", "Service", "Facilities", "Staff", "Other"
        };
        
        for (String validCategory : validCategories) {
            if (validCategory.equalsIgnoreCase(category.trim())) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Get valid categories
     * @return Array of valid categories
     */
    public String[] getValidCategories() {
        return new String[]{
            "General", "Booking", "Payment", "Schedule", "Service", "Facilities", "Staff", "Other"
        };
    }
    
    /**
     * Get default category
     * @return Default category
     */
    public String getDefaultCategory() {
        return "General";
    }
    
    /**
     * Validate rating
     * @param rating Rating to validate
     * @return true if valid rating, false otherwise
     */
    public boolean isValidRating(int rating) {
        return rating >= 1 && rating <= 5;
    }
    
    /**
     * Get rating description
     * @param rating Rating (1-5)
     * @return Description of the rating
     */
    public String getRatingDescription(int rating) {
        switch (rating) {
            case 1: return "Very Poor";
            case 2: return "Poor";
            case 3: return "Average";
            case 4: return "Good";
            case 5: return "Excellent";
            default: return "Unknown";
        }
    }
}



