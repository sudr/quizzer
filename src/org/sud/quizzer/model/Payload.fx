package org.sud.timer.quizzer.model;


public class Payload {

    public var number : Integer;
    public var question : String;
    public var value : Double;
    public var correctAnswer: Integer;
    //public var answers = [];
    public var answer1: String;
    public var answer2: String;
    public var answer3: String;

    /*
    public function addAnswer(answer) {
        insert answer into answers;
    }*/

    override public function toString() : String {
        return "Number: {number}; Value: {value}; Q: {question}; A: {answer1}; {answer2}; {answer3}";
    }
}