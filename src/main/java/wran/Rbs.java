package wran;

import java.io.Serializable;
import java.util.ArrayList;

public class Rbs implements Serializable{
	
	private static final long serialVersionUID = 2;
	
    private ArrayList<Cell> cells = new ArrayList<Cell>();
    private int rbsId;
    private int rncId;

    public Rbs(int rncId, int rbsId, int numOfCells) {
        this.rbsId = rbsId;
        this.rncId = rncId;
        
        Cell c1;
        int numOfleadingZero = 2;
        
        for (int i = 1; i <= numOfCells; i++) {
        	c1 = new Cell(rncId,rbsId,i);
        	
        	String userLabel = "RNC" + c1.getRncId(numOfleadingZero)
        			+ "-" + c1.getRbsId()
        			+ "-" + c1.getRbsLocalCellId();
        	c1.setUserLabel(userLabel);
        	
            cells.add(c1);
        }
    }
    
    public void createIntraRelationsWithinSameRbs() {
        if (this.cells.size() > 1) {
            for (Cell c1 : this.cells) {
                for (Cell c2 : this.cells) {
                    if (!c1.equals(c2)) {
                        c1.addIntraRelation(c2);
                    }
                }
            }
        }        
    }
    

    public void printIntraRelationsWithinSameRbs() {
    	
    	int numOfLeadingZeroes = 2;

        for (Cell c1 : this.getCells()) {
            if (c1.getIntraRelations().isEmpty()){
                System.out.println("---RBS" + c1.getRbsId(numOfLeadingZeroes) + "CELL" + c1.getCellId(numOfLeadingZeroes) + " has no relation---");
            }
            for (Cell c2 : c1.getIntraRelations()) { 
                
                System.out.println("RBS" + c1.getRbsId(numOfLeadingZeroes) + "CELL" + c1.getCellId(numOfLeadingZeroes) + " has relation with "
                         + "RBS" + c2.getRbsId(numOfLeadingZeroes) + "CELL" + c2.getCellId(numOfLeadingZeroes));
            }
        }
    }
    
    
    public int getTotalNumOfCellsForRbs(){
    	
    	return this.cells.size();
    }

	public int getRbsId() {
		return rbsId;
	}

	public void setRbsId(int rbsId) {
		this.rbsId = rbsId;
	}

	public ArrayList<Cell> getCells() {
        return this.cells;
    }

    @Override
    public String toString() {
        return "Rbs{" + "cells=" + cells + ", rbsId=" + rbsId + '}';
    }

}
