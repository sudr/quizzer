package org.sud.timer.quizzer.ui;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;

public class NumberWidget extends CustomNode {

    package var value: String;
    package var fill: Color;

    var number = Text {
        content: value
        font: Font { size: 36 },
        fill: bind fill;
    }

    override protected function create () : Node {
        return number;
    }
}
