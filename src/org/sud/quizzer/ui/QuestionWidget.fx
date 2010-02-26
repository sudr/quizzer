package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.Node;
import javafx.scene.layout.Flow;
import javafx.scene.text.TextAlignment;
import org.sud.quizzer.Main;
import javafx.scene.layout.LayoutInfo;

public class QuestionWidget extends CustomNode {

    def UNMANAGED = LayoutInfo { managed: false };
    public var sceneWidth = bind Main.scene.width;
    package var question: String;
    var questionWidget = Flow {
                    content: [
                        Text {
                            content: bind question
                            font: Font { size: Config.QUESTION_FONT_SIZE },
                            fill: Config.QUESTION_FONT_COLOR
                            wrappingWidth: bind sceneWidth - 10
                            textAlignment: TextAlignment.LEFT
                            //visible: bind board.state == board.questionState or board.state == board.answerState
                        },

                ]
                layoutInfo: UNMANAGED;
            }

    override protected function create(): Node {
        return questionWidget;
    }

}
