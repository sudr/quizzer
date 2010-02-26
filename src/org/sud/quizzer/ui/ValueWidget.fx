package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import org.sud.timer.quizzer.model.Entity;

public class ValueWidget extends CustomNode {

    def enabledColor = Config.VALUE_FONT_COLOR_ENABLED;
    def disabledColor = Config.VALUE_FONT_COLOR_DISABLED;

    package var entity: Entity;
    var valueText = Text {
                content: "${Integer.valueOf(entity.payload.value).toString()}"
                font: Font { size: Config.VALUE_FONT_SIZE }
                fill: bind if (entity.state == entity.valueState or entity.state == entity.doneState) disabledColor else enabledColor
            }

    override protected function create(): Node {
        return valueText;
    }

}
