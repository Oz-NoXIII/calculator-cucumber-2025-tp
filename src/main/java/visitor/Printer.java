package visitor;

import calculator.Expression;
import calculator.MyNumber;
import calculator.Notation;
import calculator.Operation;

/** Evaluation is a concrete visitor that serves to
 * compute and evaluate the results of arithmetic expressions.
 */
public class Printer extends Visitor {

    public Notation notation;

    public Printer(Notation notation) {
        this.notation = notation;
    }

    @Override
    public void visit(MyNumber n) {
        return;
    }

    @Override
    public void visit(Operation o) {
        o.notation = notation;
    }
}
