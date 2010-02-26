package org.sud.timer.quizzer.ui;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.layout.VBox;
import org.sud.timer.quizzer.model.Entity;
import javafx.util.Sequences;
import javafx.geometry.HPos;

public class ValuesWidget extends CustomNode {

    package var entities: Entity[] = [];
    var valueWidgets = for (i in [0..sizeof entities - 1]) {
                ValueWidget { entity: (sortedEntities()[i] as Entity) }
            };
    var valuesWidget = VBox {
                content: for (w in valueWidgets) { w }
                nodeHPos: HPos.RIGHT
                spacing: 3
            }

    function sortedEntities() {
        return Sequences.reverse(Sequences.sort(entities));
    }

    override protected function create(): Node {
        return valuesWidget;
    }

}
