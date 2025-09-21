package com.tsbs.model;

public class Train {
    private int trainId;
    private String name;
    private String type;

    public Train() {}

    public Train(int trainId, String name, String type) {
        this.trainId = trainId;
        this.name = name;
        this.type = type;
    }

    public int getTrainId() { return trainId; }
    public void setTrainId(int trainId) { this.trainId = trainId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
