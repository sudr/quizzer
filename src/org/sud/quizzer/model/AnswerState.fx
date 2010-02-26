package org.sud.timer.quizzer.model;

import org.sud.timer.quizzer.model.Entity;

public class AnswerState extends State {

    package var entity: Entity;

    override function handle() : Void {
    	entity.state = entity.valueState;
    }

    override public function toString(): String {
        return "State: Answer"
    }

}
