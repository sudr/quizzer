package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;

public class Frame extends CustomNode {

    public var frame: Group = Group {
                content: [
                    Title { },
                    BoardWidget { },
                ]
            }

    override public function create(): Node {
        return frame;
    }

}
