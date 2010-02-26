package org.sud.timer.quizzer.model;

import org.sud.timer.quizzer.model.Entity;

public class ValueState extends State {

    package var entity: Entity;

    override function handle() : Void {
    	entity.state = entity.doneState;
    }

    override public function toString(): String {
        return "State: Value"
    }
}
