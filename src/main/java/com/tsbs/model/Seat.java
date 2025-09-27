package com.tsbs.model;

public class Seat {
    private int seatId;
    private int scheduleId;
    private String seatNo;
    private String seatClass;

    public Seat() {}

    public Seat(int seatId, int scheduleId, String seatNo, String seatClass) {
        this.seatId = seatId;
        this.scheduleId = scheduleId;
        this.seatNo = seatNo;
        this.seatClass = seatClass;
    }

    public int getSeatId() { return seatId; }
    public void setSeatId(int seatId) { this.seatId = seatId; }

    public int getScheduleId() { return scheduleId; }
    public void setScheduleId(int scheduleId) { this.scheduleId = scheduleId; }

    public String getSeatNo() { return seatNo; }
    public void setSeatNo(String seatNo) { this.seatNo = seatNo; }

    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }
}
