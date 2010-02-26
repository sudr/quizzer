package org.sud.timer.quizzer.model;


public class InitialBoardState extends State {

    package var board: Board;
    
    override public function handle () : Void {
        //board.state = board.questionState;
    }

    override public function toString(): String {
        return "State: Initial"
    }
}
