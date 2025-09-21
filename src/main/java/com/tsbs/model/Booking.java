package com.tsbs.model;

import java.time.LocalDateTime;

public class Booking {
    private long bookingId;
    private int userId;
    private int scheduleId;
    private Integer seatId;
    private String pnr;
    private LocalDateTime bookingTime;
    private String status;
    private double totalAmount;

    public Booking() {}

    public Booking(long bookingId, int userId, int scheduleId, Integer seatId,
                   String pnr, LocalDateTime bookingTime, String status, double totalAmount) {
        this.bookingId = bookingId;
        this.userId = userId;
        this.scheduleId = scheduleId;
        this.seatId = seatId;
        this.pnr = pnr;
        this.bookingTime = bookingTime;
        this.status = status;
        this.totalAmount = totalAmount;
    }

    public long getBookingId() { return bookingId; }
    public void setBookingId(long bookingId) { this.bookingId = bookingId; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getScheduleId() { return scheduleId; }
    public void setScheduleId(int scheduleId) { this.scheduleId = scheduleId; }

    public Integer getSeatId() { return seatId; }
    public void setSeatId(Integer seatId) { this.seatId = seatId; }

    public String getPnr() { return pnr; }
    public void setPnr(String pnr) { this.pnr = pnr; }

    public LocalDateTime getBookingTime() { return bookingTime; }
    public void setBookingTime(LocalDateTime bookingTime) { this.bookingTime = bookingTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
}
