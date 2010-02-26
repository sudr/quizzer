package org.sud.timer.quizzer.data;

import java.util.Scanner;
import java.io.File;
import java.util.StringTokenizer;
import org.sud.timer.quizzer.model.Payload;
import javafx.util.Sequences;

public class FileReader {

    public function read(filePath: String) {
        var file: File = new File(filePath);
        var scanner: Scanner = new Scanner(file);
        var list = [];
        while (scanner.hasNextLine()) {
            var line = scanner.nextLine();
            var data: Payload = build(line);
            insert data into list;
        }
        return Sequences.shuffle(list);
    }

    function build(line: String): Payload {
        var st = new StringTokenizer(line, "|");
        var elements: String[];
        var i: Integer = 0;
        while (st.hasMoreTokens()) {
            elements[i] = st.nextToken();
            i++;
        }
        var p = Payload { };
        p.question = elements[0];
        p.value = Double.valueOf(elements[1]);
        p.correctAnswer = Double.valueOf(elements[2]);
        /*i=3;
        while (i < elements.size()) {
            p.addAnswer(elements[i]);
            i++;
        }*/
        p.answer1 = elements[3];
        p.answer2 = elements[4];
        p.answer3 = elements[5];
        return p;
    }

}

/* Use to test */
function run(  args     : String[]) {
    var r = new FileReader();
    r.read("resources/data.txt");
}
