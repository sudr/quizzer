package org.sud.timer.quizzer.model;

import org.sud.quizzer.model.Entity;

public class QuestionState extends State {

    package var entity: Entity;

    override function handle(): Void {
        entity.state = entity.answerState;
    }

    override public function toString(): String {
        return "State: Question"
    }

}
