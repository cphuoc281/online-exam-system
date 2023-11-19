/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thinh
 */
public class Enrollment {
    private int AccountId;
    private int CollectionId;
    private String name;
    private String fullName;
    private double score;

    public Enrollment() {
    }

    public Enrollment(int AccountId, int CollectionId, String name, String fullName, double score) {
        this.AccountId = AccountId;
        this.CollectionId = CollectionId;
        this.name = name;
        this.fullName = fullName;
        this.score = score;
    }

    public int getAccountId() {
        return AccountId;
    }

    public void setAccountId(int AccountId) {
        this.AccountId = AccountId;
    }

    public int getCollectionId() {
        return CollectionId;
    }

    public void setCollectionId(int CollectionId) {
        this.CollectionId = CollectionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Enrollment{" + "AccountId=" + AccountId + ", CollectionId=" + CollectionId + ", name=" + name + ", fullName=" + fullName + ", score=" + score + '}';
    }

    

    
    
    
}
