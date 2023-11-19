/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author cphuo
 */
public class Exam {
    private int id;
    private String name;
    private String password;
    private int timeLimit;
    private String date;
    private int questionNumber;
    private int CollectionId;
    private int AccountId;

    public Exam(int id, String name, String password, int timeLimit, String date, int questionNumber, int CollectionId, int AccountId) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.timeLimit = timeLimit;
        this.date = date;
        this.questionNumber = questionNumber;
        this.CollectionId = CollectionId;
        this.AccountId = AccountId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getTimeLimit() {
        return timeLimit;
    }

    public void setTimeLimit(int timeLimit) {
        this.timeLimit = timeLimit;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getQuestionNumber() {
        return questionNumber;
    }

    public void setQuestionNumber(int questionNumber) {
        this.questionNumber = questionNumber;
    }

    public int getCollectionId() {
        return CollectionId;
    }

    public void setCollectionId(int CollectionId) {
        this.CollectionId = CollectionId;
    }

    public int getAccountId() {
        return AccountId;
    }

    public void setAccountId(int AccountId) {
        this.AccountId = AccountId;
    }

    @Override
    public String toString() {
        return "Exam{" + "id=" + id + ", name=" + name + ", password=" + password + ", timeLimit=" + timeLimit + ", date=" + date + ", questionNumber=" + questionNumber + ", CollectionId=" + CollectionId + ", AccountId=" + AccountId + '}';
    }
    

    

    
    
    
    
}
