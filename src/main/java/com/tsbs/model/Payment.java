package com.tsbs.model;

import java.time.LocalDateTime;

public class Payment {
    private long paymentId;
    private long bookingId;
    private double amount;
    private String method;
    private String status;
    private String gatewayTxnId;
    private LocalDateTime createdAt;

    public Payment() {}

    public Payment(long paymentId, long bookingId, double amount,
                   String method, String status, String gatewayTxnId, LocalDateTime createdAt) {
        this.paymentId = paymentId;
        this.bookingId = bookingId;
        this.amount = amount;
        this.method = method;
        this.status = status;
        this.gatewayTxnId = gatewayTxnId;
        this.createdAt = createdAt;
    }

    public long getPaymentId() { return paymentId; }
    public void setPaymentId(long paymentId) { this.paymentId = paymentId; }

    public long getBookingId() { return bookingId; }
    public void setBookingId(long bookingId) { this.bookingId = bookingId; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public String getMethod() { return method; }
    public void setMethod(String method) { this.method = method; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getGatewayTxnId() { return gatewayTxnId; }
    public void setGatewayTxnId(String gatewayTxnId) { this.gatewayTxnId = gatewayTxnId; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}