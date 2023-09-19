<%-- 
    Document   : Create
    Created on : 16 Feb, 2023, 2:14:46 PM
    Author     : Hi
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update User</title>
        <link rel="stylesheet" href="css/register1.css" />
    </head>
    <body>

        <div class="form_register">
            <form action="Update" method="post" class="cal">
                <h1 class="register_heading">Update Question</h1>
                <c:set var="check" value="q${st.getId()}"></c:set>
                <input style="display:none" value="${check}" type="text" id="id" name="id"><br><br>
                <lable class="register_text">Detail</lable>
                <input type="text" value="${st.detail}" class="register_input" name="Detail" required="">
                <lable class="register_text">Answer A</lable>
                <input type="text" value="${st.answerA}" class="register_input" name="AnswerA" required="">
                <lable class="register_text">Answer B</lable>
                <input type="text" value="${st.answerB}" class="register_input" name="AnswerB" required="">
                <lable class="register_text">Answer C</lable>
                <input type="text" value="${st.answerC}" class="register_input" name="AnswerC" required="">
                <lable class="register_text">Answer D</lable>
                <input type="text" value="${st.answerD}" class="register_input" name="AnswerD" required="">
                <tr>
                    <td><h1>Anwser</h1></td>
                    <td>            
                        <select name="TrueAnswer" required="">
                            <option value="A"><h1>A</h1></option>
                            <option value="B"><h1>B</h1></option>
                            <option value="C"><h1>C</h1></option>
                            <option value="D"><h1>D</h1></option>
                        </select>
                    </td>
                </tr>
                <button class="register_btn" type="submit">Update</button>
            </form>
        </div>    
    </body>
</html>