package org.sud.timer.quizzer.model;


public class AnswerBoardState extends State {

    package var board: Board;
    
    override public function handle () : Void {
        //board.state = board.answerState;
    }

    override public function toString(): String {
        return "State: Answer"
    }

}
