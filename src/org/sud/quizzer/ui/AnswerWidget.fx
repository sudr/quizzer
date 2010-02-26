package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.text.Font;
import javafx.scene.text.Text;

public class AnswerWidget extends CustomNode {

    def enabledColor = Config.ANSWER_FONT_COLOR_ENABLED;
    def disabledColor = Config.ANSWER_FONT_COLOR_DISABLED;

    package var value: String;
    package var hilite: Boolean;
    
    var answerText = Text {
                content: bind value
                font: Font { size: Config.ANSWER_FONT_SIZE }
                fill: bind if (hilite) then enabledColor else disabledColor
                //fill: bind if (entity.state == entity.valueState or entity.state == entity.doneState) disabledColor else enabledColor
            }

    override protected function create(): Node {
        return answerText;
    }

}
