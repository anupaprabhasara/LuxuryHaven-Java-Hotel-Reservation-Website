package com.luxhav.model;

public class Feedback {
	private int feedbackId;
    private int userId;
    private int reservationId;
    private int rating;
    private String comment;
    private String createdAt;

    // View-only fields
    private String guestName;
    private String roomNumber;
    
	public int getFeedbackId() {
		return feedbackId;
	}
	public int getUserId() {
		return userId;
	}
	public int getReservationId() {
		return reservationId;
	}
	public int getRating() {
		return rating;
	}
	public String getComment() {
		return comment;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getGuestName() {
		return guestName;
	}
	public String getRoomNumber() {
		return roomNumber;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public void setRoomNumber(String roomNumber) {
		this.roomNumber = roomNumber;
	}
}