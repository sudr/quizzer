package org.sud.timer.quizzer.ui;

import javafx.scene.Group;
import javafx.scene.Node;
import org.sud.quizzer.model.Board;
import org.sud.quizzer.model.BoardFactory;
import org.sud.timer.quizzer.model.Entity;
import org.sud.quizzer.ui.Config;
import org.sud.quizzer.ui.EntityWidget;
import javafx.scene.CustomNode;
import javafx.scene.layout.Tile;
import javafx.scene.layout.VBox;
import javafx.geometry.VPos;
import javafx.scene.layout.HBox;
import org.sud.timer.quizzer.Main;

public class BoardWidget extends CustomNode {

    var sceneWidth = bind Main.width;
    var sceneHeight = bind Main.height;
    var board: Board = new BoardFactory().newFileBasedBoard();
    var entityWidgets = for (i in [0..sizeof board.entities - 1]) {
                EntityWidget { entity: board.entities[i] as Entity, board: board, number: i + 1 }
            }
    var boardWidget = Group {
                        translateY: 100;
                        content: [
                            PlayWidget {
                                entity: bind board.activeEntity
                                visible: bind board.activeEntity.state != board.activeEntity.initialState and board.activeEntity.state != board.activeEntity.doneState
                                questionWidget: QuestionWidget { question: bind board.question },
                                answersWidget: AnswersWidget {
                                    entity: bind board.activeEntity,
                                    visible: bind board.activeEntity != null
                                 },
                            },
                            HBox {
                                visible: bind board.activeEntity.state == board.activeEntity.initialState or board.activeEntity.state == board.activeEntity.doneState
                                //vpos: VPos.CENTER // centers the row vertically within the container
                                spacing: 50 // sets the an interval between the elements
                                content: [
                                    ValuesWidget { entities: board.entities },
                                    Tile {
                                        tileWidth: bind sceneWidth * 0.8 / Config.BOARD_COLUMNS
                                        tileHeight: bind sceneHeight * 0.8 / (sizeof entityWidgets / Config.BOARD_COLUMNS)
                                        columns: Config.BOARD_COLUMNS
                                        rows: 4
                                        vgap: 20
                                        content: for (i in [0..sizeof entityWidgets - 1]) {
                                            Group {
                                                content: [
                                                    entityWidgets[i]
                                                ]
                                            }
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                      
    override protected function create(): Node {
        return boardWidget;
    }

}
