package visitor;

import calculator.Notation;

/** Evaluation is a concrete visitor that serves to
 * compute and evaluate the results of arithmetic expressions.
 */
public class Printer {

    /**
     * Default constructor of the class. Does not initialise anything.
     */
    public Printer() {
        notation = Notation.INFIX;
    }

    /** The unique Notation */
    private Notation notation;

    /**
     * Get the Notation used by the Visitor
     * @return Notation type
     */
    public Notation getNotation(){
        return notation;
    }

    /**
     * Get the Notation used by the Visitor
     * @param n Notation to change
     */
    public void setNotation(Notation n){
        notation = n;
    }

}
