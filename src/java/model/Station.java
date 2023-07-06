/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER NITRO 5
 */
public class Station {

    private int stationId;
    private String stationName;
    private String stationUrl;

    public Station() {
    }

    public Station(int stationId, String stationName, String stationUrl) {
        this.stationId = stationId;
        this.stationName = stationName;
        this.stationUrl = stationUrl;
    }

    public String getStationUrl() {
        return stationUrl;
    }

    public void setStationUrl(String stationUrl) {
        this.stationUrl = stationUrl;
    }

   

    public int getStationId() {
        return stationId;
    }

    public void setStationId(int stationId) {
        this.stationId = stationId;
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    @Override
    public String toString() {
        return "Station{" + "stationId=" + stationId + ", stationName=" + stationName + ", stationUrl=" + stationUrl + '}';
    }

   

}
