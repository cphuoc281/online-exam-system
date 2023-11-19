/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 *
 * @author quoct
 */
public class CollectionConnect {

    private int cId;
    private int qId;

    public CollectionConnect() {
    }

    public CollectionConnect(int cId, int qId) {
        this.cId = cId;
        this.qId = qId;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public int getqId() {
        return qId;
    }

    public void setqId(int qId) {
        this.qId = qId;
    }

    @Override
    public String toString() {
        return "CollectionConnect{" + "cId=" + cId + ", qId=" + qId + '}';
    }

    
    
}
