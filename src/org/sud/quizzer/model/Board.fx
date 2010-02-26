package org.sud.timer.quizzer.model;

public class Board {

    public var activeEntity: Entity;
    public var question = bind activeEntity.payload.question;
    public var answer1 = bind activeEntity.payload.answer1;
    public var answer2 = bind activeEntity.payload.answer2;
    public var answer3 = bind activeEntity.payload.answer3;
    public var correctAnswer = bind activeEntity.payload.correctAnswer;

    /*public var answers = bind activeEntity.payload.answers on replace {
                                println("changed {answers}");
                            };*/

    //public-read package var initialState: State = InitialBoardState {board: this};
    //public-read package var questionState: State = QuestionBoardState {board: this};
    //public-read package var answerState: State = AnswerBoardState {board: this};
    //public-read package var state: State = initialState;
    
    // init and read from anywhere
    public-init var entities: Entity[] = [];

    /*
    public function trigger(): Void {
        println("before {toString()}");
        state.handle();
        println("after {toString()}");
    }*/
}

