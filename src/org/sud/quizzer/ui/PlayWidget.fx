package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import org.sud.quizzer.Main;
import org.sud.quizzer.model.Entity;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.layout.VBox;
import org.sud.timer.quizzer.ui.Button;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.paint.Color;

public class PlayWidget extends CustomNode {

    package var questionWidget: QuestionWidget;
    package var answersWidget: AnswersWidget;
    public-init package var entity: Entity;
    var sceneWidth = bind Main.width;
    var sceneHeight = bind Main.height;

    var playWidget = VBox {
                        //translateY: 140;
                        spacing: 80 //set an interval between the elements
                        content: [
                            /*Rectangle {   // Create a rectangle
                                
                                x: bind 0.15*Main.width  //Start drawing 20 pixels from the left of the scene
                                y: bind 0.15*Main.height  //Start drawing 60 pixels from the top of the scene
                                //scaleX: bind scale;
                                //scaleY: bind scale;
                                //rotate: bind angle;
                                width: bind 0.70 * Main.width
                                height: bind 0.70 * Main.height
                                fill: Color.DIMGRAY
                            },*/

                            questionWidget,
                            answersWidget,
                            Text {
                                content: bind "${Integer.valueOf(entity.payload.value).toString()}"
                                font: Font { size: Config.QUESTION_FONT_SIZE }
                                fill: Color.YELLOW
                                visible: bind entity.state == entity.valueState or entity.state == entity.doneState
                            }
                            Button {
                                width: 320
                                height: 60
                                text: bind if (entity.state == entity.questionState) 'Show Answer' else if (entity.state == entity.answerState) 'Show Me the Money' else 'Close'
                                entity: bind entity
                            }
                        ]
                     }

    var scale : Number = 1.0;
    var angle : Number = 10;
    var animation = Timeline {
       repeatCount: 50
       keyFrames: [
           KeyFrame {
               time: 0.2s
               canSkip: false
               action: function() {
                   scale += 0.1;
                   angle += 5;
               }
           }
       ]
    }

    package function animate() {
        //animation.play();
    }

    override protected function create(): Node {
        return playWidget
    }
}
