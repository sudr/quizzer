package org.sud.timer.quizzer.model;
import java.lang.Comparable;

public class Entity extends Comparable {

    public-read package var payload: Payload;
    public-read package var initialState: State = InitialState {entity: this};
    public-read package var questionState: State = QuestionState {entity: this};
    public-read package var valueState: State = ValueState {entity: this};
    public-read package var answerState: State = AnswerState {entity: this};
    public-read package var doneState: State = DoneState {entity: this};
    public-read package var state: State = initialState;

    public function trigger(): Void {
        state.handle();
        println(toString());
    }

    override public function compareTo (that : Object) : Integer {
        return this.payload.value.compareTo((that as Entity).payload.value);
    }

    override public function toString(): String {
        return "Payload: {payload}; State:{state}";
    }
}
