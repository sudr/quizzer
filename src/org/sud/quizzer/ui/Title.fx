package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.effect.DropShadow;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import org.sud.quizzer.Main;

public class Title extends CustomNode {

    var sceneWidth = bind Main.width;
    var title = Text {
                content: {Config.GAME_NAME}
                font: Font { size: Config.GAME_NAME_FONT_SIZE },
                fill: Color.web(Config.GAME_NAME_FONT_COLOR)
                translateX: bind (sceneWidth-Config.GAME_NAME.length()*20)/2,
                translateY: 36
                // stroke: Color.web('#AF7817')
                effect: DropShadow {
                    color: Color.BLACK
                    offsetY: 5
                    offsetX: 2
                }
            }

    override protected function create(): Node {
        return title;
    }

}
