package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import org.sud.quizzer.model.Entity;
import javafx.scene.image.Image;
import javafx.scene.Node;
import org.sud.timer.quizzer.model.Board;
import javafx.scene.Group;
import javafx.scene.image.ImageView;
import org.sud.quizzer.Main;
import javafx.scene.media.Media;
import javafx.scene.media.MediaPlayer;

public class EntityWidget extends CustomNode {

    var imageWidth: Integer = bind (Main.scene.width) / (Config.BOARD_COLUMNS+3);
    def initialImage = Image { url: "{__DIR__}initial_state.png", width: imageWidth, preserveRatio: true };
    def questionImage = Image { url: "{__DIR__}question_state.png", width: imageWidth, preserveRatio: true };
    def answerImage = Image { url: "{__DIR__}answer_state.png", width: imageWidth, preserveRatio: true };
    def valueImage = Image { url: "{__DIR__}value_state.png", width: imageWidth, preserveRatio: true
                     };

    package var board: Board;
    public-init package var entity: Entity;
    public-init package var number: Integer;
    var image = initialImage;
    var imgView = Group {
                    content: [
                        ImageView {
                            image: bind image;
                            onMouseReleased: function (event) {
                                if (board.activeEntity !=null and board.activeEntity != entity
                                        and board.activeEntity.state != board.activeEntity.initialState
                                        and board.activeEntity.state != board.activeEntity.doneState) {
                                    return;
                                }

                                entity.trigger();
                                board.activeEntity = entity;
                                if (entity.state == entity.initialState) {
                                    image = initialImage;
                                } else if (entity.state == entity.questionState) {
                                    questionMusic.play();
                                    image = null;
                                } else if (entity.state == entity.answerState) {
                                    image = answerImage;
                                } else if (entity.state == entity.valueState) {
                                    image = valueImage;
                                } else if (entity.state == entity.doneState) {
                                    image = null;
                                }
                            },
                        },
                        NumberWidget {
                            value: String.valueOf(number)
                            visible: bind entity.state == entity.initialState
                            fill: Config.NUMBER_FONT_COLOR
                            translateX: 100
                            translateY: 125
                        },
                        /*NumberWidget {
                            value: String.valueOf(entity.payload.value)
                            visible: bind entity.state == entity.valueState
                            fill: Config.VALUE_FONT_COLOR_IMAGE
                            translateX: 28
                            translateY: 90 - String.valueOf(entity.payload.value).length()
                        },*/
                    ]
                 };

    var questionMusic:MediaPlayer = MediaPlayer {
        volume: Config.MUSIC_VOLUME;
        media: Media {
            source: "{__DIR__}question.wav"
        }
    }

    override protected function create(): Node {
        return imgView;
    }

}
