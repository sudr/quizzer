package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.Flow;
import javafx.geometry.VPos;
import javafx.geometry.HPos;
import org.sud.timer.quizzer.model.Entity;

public class AnswersWidget extends CustomNode {

    package var entity: Entity;
    /*var answerWidgets = bind for (i in [0..sizeof board.answers - 1]) {
                            AnswerWidget {
                                value: "HELLOOOOOOOOOOO" //bind (board.answers[i] as String)
                            }
                        };*/
    var answerWidgets = [ AnswerWidget {
                            value: bind "A. {entity.payload.answer1}",
                            hilite: bind entity.payload.correctAnswer == 1 and entity.state != entity.questionState,
                          },
                          AnswerWidget {
                            value: bind "B. {entity.payload.answer2}",
                            hilite: bind entity.payload.correctAnswer == 2 and entity.state != entity.questionState,
                          },
                          AnswerWidget {
                            value: bind "C. {entity.payload.answer3}",
                            hilite: bind entity.payload.correctAnswer == 3 and entity.state != entity.questionState,
                          }
                        ];

    var answersWidget = Flow {
                            content: for (w in answerWidgets) { w }
                            hgap: 5 // horizontal gap between nodes in a row
                            vgap: 20 // vertical gap between rows
                            hpos: HPos.CENTER //column will be centered within vbox width
                            vpos: VPos.CENTER //centers the row vertically within the container
                            nodeVPos: VPos.TOP // images are aligned to the top of a row
                        }

    /*
    function answerState() {
        return board.activeEntity.state == board.activeEntity.answerState or board.activeEntity.state == board.activeEntity.doneState
    }*/

    override protected function create(): Node {
        return answersWidget;
    }
}
