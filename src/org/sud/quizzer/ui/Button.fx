package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.text.Text;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.scene.shape.Rectangle;
import javafx.scene.effect.DropShadow;
import javafx.scene.text.Font;
import org.sud.timer.quizzer.model.Entity;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;

public class Button extends CustomNode {

    package var entity: Entity;
    var x: Number;
    var y: Number;
    package var width: Number;
    package var height: Number;
    package var text: String;
    var txt: Text;
    var gradient: LinearGradient = LinearGradient {
                startX: 0.0 startY: 0.0
                endX: 0.0 endY: 1.0
                proportional: true
                stops: [
                    Stop { offset: 0.0 color: Color.web("#dceaff") },
                    Stop { offset: 0.49 color: Color.web("#6885b2") },
                    Stop { offset: 0.5 color: Color.web("#2c599c") },
                    Stop { offset: 1.0 color: Color.web("#bed3f4") }
                ]
            }

    function getText(): Text {
        txt = Text {
            content: bind text
            fill: Color.WHITE
            font: Font {
                name: "Arial Bold"
                size: 20
            }
            effect: DropShadow {
                color: Color.BLACK offsetX: 1 offsetY: 1
            }
        }
        centralizeText(txt);
        return txt;
    }

    function centralizeText(text: Text): Void {
        text.x = (width - text.layoutBounds.width - 5) / 2;
        text.y = (height - text.layoutBounds.height) / 2 + 12;
    }

    override public function create(): Node {
        return Group {
                    translateX: x translateY: y;
                    content: [Rectangle {
                            width: width height: height
                            arcWidth: 35 arcHeight: 35
                            stroke: Color.web("#023493");
                            strokeWidth: 1.5;
                            fill: bind gradient
                            onMouseEntered: function (e: MouseEvent): Void {
                                gradient = LinearGradient {
                                    startX: 0.0
                                    startY: 0.0
                                    endX: 0.0
                                    endY: 1.0
                                    proportional: true
                                    stops: [
                                        Stop { offset: 0.0 color: Color.web("#ffffff") },
                                        Stop { offset: 0.49 color: Color.web("#6885b2") },
                                        Stop { offset: 0.5 color: Color.web("#2c599c") },
                                        Stop { offset: 1.0 color: Color.web("#ffffff") }
                                    ]
                                }
                            }
                            onMouseExited: function (e: MouseEvent): Void {
                                gradient = LinearGradient {
                                    startX: 0.0
                                    startY: 0.0
                                    endX: 0.0
                                    endY: 1.0
                                    proportional: true
                                    stops: [
                                        Stop { offset: 0.0 color: Color.web("#dceaff") },
                                        Stop { offset: 0.49 color: Color.web("#6885b2") },
                                        Stop { offset: 0.5 color: Color.web("#2c599c") },
                                        Stop { offset: 1.0 color: Color.web("#bed3f4") }
                                    ]
                                }
                            }
                            onMouseReleased: function(event) {
                                    entity.trigger();
                                    if (entity.state == entity.valueState) { valueMusic.play() }
                                }
                        }, getText()
                    ]
                    onMousePressed: function (e: MouseEvent): Void {
                        txt.x = txt.x + 1;
                        txt.y = txt.y + 1;
                    }
                    onMouseReleased: function (e: MouseEvent): Void {
                        txt.x = txt.x - 1;
                        txt.y = txt.y - 1;
                    }
                }
    }

    var valueMusic:MediaPlayer = MediaPlayer {
        volume: Config.MUSIC_VOLUME;
        media: Media {
            source: "{__DIR__}value.wav"
        }
    }

}
