package org.sud.timer.quizzer.model;

import org.sud.quizzer.data.FileReader;

public class BoardFactory {

    public function newFileBasedBoard() {
        var reader = new FileReader();
        var data = reader.read("resources/data.txt");
        var entities = for (d in data) {
                    Entity { payload: d as Payload}
                }
        return Board { entities: entities }
    }

}
