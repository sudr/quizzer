package org.sud.timer.quizzer;

import javafx.scene.Scene;
import org.sud.quizzer.ui.Config;
import org.sud.quizzer.ui.Frame;
import javafx.stage.Stage;
import javafx.scene.paint.Color;
import javafx.scene.paint.RadialGradient;
import javafx.scene.paint.Stop;

public var width = bind scene.width;
public var height = bind scene.height;

public var scene = Scene {
            width: Config.SCENE_WIDTH
            height: Config.SCENE_HEIGHT;
            content: [
                Frame { }
            ]
            fill: RadialGradient {
                    proportional: true
                    centerX: 0.5
                    centerY: 0.5
                    focusX: 0.5
                    focusY: 0.5
                    radius: 1.0
                    stops: [
                        Stop {
                            color: Color.web('#AF7817'),
                            offset: 0.0
                        },
                        Stop {
                            color: Color.BLACK,
                            offset: 1.0
                        },
                    ]
                }
        };

public function run(args : String []) {

    Stage {
        title: Config.WINDOW_TITLE
        scene: scene
        onClose: function () { java.lang.System.exit(0); }
    }
}
