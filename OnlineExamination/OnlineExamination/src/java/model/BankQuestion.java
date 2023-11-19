/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Phuoc
 */
public class BankQuestion {
    private int id;
    private String detail;
    private String image;
    private String answerA, answerB, answerC, answerD;
    private String trueAnswer;
    private Collection collectionId;
    private Account accountId;

    public BankQuestion() {
    }

    public BankQuestion(int id, String detail, String image, String answerA, String answerB, String answerC, String answerD, String trueAnswer, Collection collectionId, Account accountId) {
        this.id = id;
        this.detail = detail;
        this.image = image;
        this.answerA = answerA;
        this.answerB = answerB;
        this.answerC = answerC;
        this.answerD = answerD;
        this.trueAnswer = trueAnswer;
        this.collectionId = collectionId;
        this.accountId = accountId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAnswerA() {
        return answerA;
    }

    public void setAnswerA(String answerA) {
        this.answerA = answerA;
    }

    public String getAnswerB() {
        return answerB;
    }

    public void setAnswerB(String answerB) {
        this.answerB = answerB;
    }

    public String getAnswerC() {
        return answerC;
    }

    public void setAnswerC(String answerC) {
        this.answerC = answerC;
    }

    public String getAnswerD() {
        return answerD;
    }

    public void setAnswerD(String answerD) {
        this.answerD = answerD;
    }

    public String getTrueAnswer() {
        return trueAnswer;
    }

    public void setTrueAnswer(String trueAnswer) {
        this.trueAnswer = trueAnswer;
    }

    public Collection getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(Collection collectionId) {
        this.collectionId = collectionId;
    }

    public Account getAccountId() {
        return accountId;
    }

    public void setAccountId(Account accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "BankQuestion{" + "id=" + id + ", detail=" + detail + ", image=" + image + ", answerA=" + answerA + ", answerB=" + answerB + ", answerC=" + answerC + ", answerD=" + answerD + ", trueAnswer=" + trueAnswer + ", collectionId=" + collectionId + ", accountId=" + accountId + '}';
    }


}
