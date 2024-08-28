package wran;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import wran.*;


/**
 * 
 * @author qfatonu
 */
public class Rnc implements Comparable<Rnc>, Serializable {
	
	private static final long serialVersionUID = 3;

	// attributes
	private ArrayList<Rbs> rbss = new ArrayList<Rbs>();
	private ArrayList<Cell> rncCells = new ArrayList<Cell>();
	private int rncId = 1;
	private static int totalNumOfRnc = 0;
	private double primeFactor = 0;
	
	private boolean intraRelationsNumberMaxedOut = false;


	//constructors
	public Rnc(int[] rbsDistributionArray) {
		this.rncId = ++totalNumOfRnc;
		int rbsId = 1;
		for (int i = 0; i < rbsDistributionArray.length; i += 2) {
			int numOfRbs = rbsDistributionArray[i];
			int numOfCells = rbsDistributionArray[i + 1];

			for (int j = 1; j <= numOfRbs; j++) {
				Rbs rbs1 = new Rbs(rncId, rbsId, numOfCells);
//				rbs1.createIntraRelationsWithinSameRbs();
				this.rbss.add(rbs1);
				rbsId++;
			}
		}		
		this.setRncCells();
	}
	
	
	// methods
	//
	public boolean isIntraRelationsNumberMaxedOut() {
		return intraRelationsNumberMaxedOut;
	}

	public void setIntraRelationsNumberMaxedOut(boolean intraRelationsNumberMaxedOut) {
		this.intraRelationsNumberMaxedOut = intraRelationsNumberMaxedOut;
	}	
	
	public static int getTotalNumOfRnc() {
		return totalNumOfRnc;
	}

	public static void setTotalNumOfRnc(int totalNumOfRnc) {
		Rnc.totalNumOfRnc = totalNumOfRnc;
	}
	public ArrayList<Cell> getRncCells() {
		return rncCells;
	}
	
	public void setCells(ArrayList<Cell> rncCells) {
		this.rncCells = rncCells;
	}
		
	public void  setRncCells(){
		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				this.rncCells.add(c1);
			}
		}		
	}
	 
	public void createIntraRelationsWithinSameRbs() {		
	       for (Rbs rbs : this.getRbss()){
	           rbs.createIntraRelationsWithinSameRbs();	          
	       }
	}
	
	public void printIntraRelationsWithinSameRbs() {
	       for (Rbs rbs : this.getRbss()){
	           rbs.printIntraRelationsWithinSameRbs();	          
	       }  	
	}

	// Try to create relations with all other rbs' cells
	public void createIntraRelationsWithOtherRbs() {

		for (Rbs rbs1 : this.getRbss()) {

			for (Cell c1 : rbs1.getCells()) {

				for (Rbs rbs2 : this.getRbss()) {

					if (rbs1.getRbsId() != rbs2.getRbsId()) {
						for (Cell c2 : rbs2.getCells()) {
							if (!c1.getIntraRelations().contains(c2)) {
								c1.addIntraRelation(c2);
								c2.addIntraRelation(c1);
							}
						}
					}
				}
			}
		}
	}

	public void  createIntraRelations(int targetNumOfRelations, int startNumOfRelatios, int endNumOfRelations) {

		int totalNumOfIntraRelations = startNumOfRelatios;		
		
		if ( totalNumOfIntraRelations >= endNumOfRelations ){
			return;
		}
		
		ArrayList<Cell> rncCellsLocal = new ArrayList<Cell>(this.getRncCells());
		int stop = rncCellsLocal.size();
		
		this.sortCellsByCellId();	
		
		/*
		 * used for in order to understand that max num of intra relations reached for an rnc
		 */
		int breakOuter2Count = 0;
		
		outer1:
		for (Cell c1: this.rncCells){		
		
			int numOfRelations = c1.getIntraRelations().size();			
			
			outer2:
			while (numOfRelations < targetNumOfRelations){
				Collections.sort(rncCellsLocal, new Comparator<Cell>() {
					@Override
					public int compare(Cell c1, Cell c2) {
						int res = c1.getIntraRelations().size() - c2.getIntraRelations().size();
						if (res == 0){
							return c1.getCellId() - c2.getCellId();
						}
						return res;
					}
				});
				
//				for (Cell c3: rncCellsLocal){
//					System.out.println("cId=" + c3.getCellId() + ", rbsId=" + c3.getRbsId()
//							+ ", numOfRelations=" + c3.getIntraRelations().size());
//				}
				
				Cell c2;
				int index = 0;
				while(true){					
					c2 = rncCellsLocal.get(index);
					if(c2.getCellId() == c1.getCellId() 
							|| c1.getIntraRelations().contains(c2) 
							|| c2.getIntraRelations().contains(c1)
							|| c2.getIntraRelations().size() >= targetNumOfRelations){
						index++;
						
						/*
						 * if all target cells can not make any more relation break the relation loop
						 *  e.g this happen when a cell have max 31 or 
						 * 	if numOfCells less 31 and and numOfrelation reached to numOfcells-1 
						 */
						if (index == stop){
//							System.out.println(">>>go to outer2:");
							breakOuter2Count++;
							break outer2;
						}
					}else{
						break;
					}
				}
//				System.out.println(">>Selected cellId=" + c2.getCellId());
				
//				System.out.println("cellId=" + c1.getCellId() + " (numOfRelations =" + c1.getIntraRelations().size() 
//						+ ") having relation with celId=" + c2.getCellId() + " (numOdRelations=" + c2.getIntraRelations().size() + ")");
//				
//				System.out.println("(1:before relation)this.getTotalNumOfIntraRelations()=" + this.getTotalNumOfIntraRelations());
				c1.addIntraRelation(c2);
//				System.out.println("(2:after first relation)this.getTotalNumOfIntraRelations()=" + this.getTotalNumOfIntraRelations());
				c2.addIntraRelation(c1);
				
//				System.out.println("<><>afterRelation::cellId=" + c1.getCellId() + " (numOfRelations =" + c1.getIntraRelations().size() 
//						+ ") celId=" + c2.getCellId() + " (numOdRelations=" + c2.getIntraRelations().size() + ")");
				numOfRelations++;	
				
				/*
				 * This is added to create exact number of relations from wran object
				 */
				totalNumOfIntraRelations+=2;				
//				System.out.println("(3:after second relation)this.getTotalNumOfIntraRelations()=" + this.getTotalNumOfIntraRelations());
//				System.out.println("totalNumOfIntraRelations=" + totalNumOfIntraRelations);
				
				if ( totalNumOfIntraRelations >= endNumOfRelations ){
					
//					System.out.println(">Breaking at rncId=" + this.rncId  
//							+ ">this.getTotalNumOfIntraRelations()=" + this.getTotalNumOfIntraRelations());
//					
//					System.out.println(">Breaking at rncId=" + this.rncId  
//							+ ">totalNumOfIntraRelations=" + totalNumOfIntraRelations);
					break outer1;
				}
			}

//			System.out.println("breakOuter2Count=" + breakOuter2Count);
			if (breakOuter2Count == (rncCellsLocal.size())){
				this.setIntraRelationsNumberMaxedOut(true);
//				System.out.println("<maxedout>breakOuter2Count=" + breakOuter2Count);
				return;
			}
			
		}// end if 
		
		
	}

	public void printAllIntraRelations() {

		int numOfLeadingZeroes = 2;

		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				if (c1.getIntraRelations().isEmpty()) {
					System.out.println("--- RNC"
							+ c1.getRncId(numOfLeadingZeroes) + "RBS"
							+ c1.getRbsId(numOfLeadingZeroes) + "CELL"
							+ c1.getCellId(numOfLeadingZeroes)
							+ " has no relation---");
				} else {
					// System.out.println("RNC" + c1.getRncId(1) + "RBS"
					// + c1.getRbsId(numOfLeadingZeroes) + "CELL" +
					// c1.getCellId(numOfLeadingZeroes)
					// + " has the following relations \n " +
					// "------------------------------------------");
					System.out
							.println("------------------------------------------");
					System.out.println("NumOfRelations:"
							+ c1.getIntraRelations().size() + " for RNC"
							+ c1.getRncId(numOfLeadingZeroes) + "-RBS"
							+ c1.getRbsId(numOfLeadingZeroes) + "-CELL"
							+ c1.getCellId(numOfLeadingZeroes));
					System.out
							.println("------------------------------------------");

					for (Cell c2 : c1.getIntraRelations()) {

						System.out.println("RNC"
								+ c1.getRncId(numOfLeadingZeroes) + "-RBS"
								+ c1.getRbsId(numOfLeadingZeroes) + "-CELL"
								+ c1.getCellId(numOfLeadingZeroes)
								+ " has relation with " + "RNC"
								+ c2.getRncId(numOfLeadingZeroes) + "-RBS"
								+ c2.getRbsId(numOfLeadingZeroes) + "-CELL"
								+ c2.getCellId(numOfLeadingZeroes));
					}
				}
			}
		}
	}
	
	public void printAllInterRelations() {

		int numOfLeadingZeroes = 2;

		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				if (c1.getInterRelations().isEmpty()) {
					System.out.println("--- RNC"
							+ c1.getRncId(numOfLeadingZeroes) + "RBS"
							+ c1.getRbsId(numOfLeadingZeroes) + "CELL"
							+ c1.getCellId(numOfLeadingZeroes)
							+ " has no relation---");
				} else {
					// System.out.println("RNC" + c1.getRncId(1) + "RBS"
					// + c1.getRbsId(numOfLeadingZeroes) + "CELL" +
					// c1.getCellId(numOfLeadingZeroes)
					// + " has the following relations \n " +
					// "------------------------------------------");
					System.out
							.println("------------------------------------------");
					System.out.println("NumOfRelations:"
							+ c1.getInterRelations().size() + " for RNC"
							+ c1.getRncId(numOfLeadingZeroes) + "-RBS"
							+ c1.getRbsId(numOfLeadingZeroes) + "-CELL"
							+ c1.getCellId(numOfLeadingZeroes));
					System.out
							.println("------------------------------------------");

					for (Cell c2 : c1.getInterRelations()) {

						System.out.println("RNC"
								+ c1.getRncId(numOfLeadingZeroes) + "-RBS"
								+ c1.getRbsId(numOfLeadingZeroes) + "-CELL"
								+ c1.getCellId(numOfLeadingZeroes)
								+ " has relation with " + "RNC"
								+ c2.getRncId(numOfLeadingZeroes) + "-RBS"
								+ c2.getRbsId(numOfLeadingZeroes) + "-CELL"
								+ c2.getCellId(numOfLeadingZeroes));
					}
				}
			}
		}
	}
	
	public String printIntraAndInterRelations(){
		StringBuilder sb = new StringBuilder();
		
//		sb.append(""
//				+ "------------------------------------------ \n"
//				+ "  RNC"+ c1.getRncId(numOfLeadingZeros) 
//				+ "totalNumOfUtranRelations=" + totalNumOfUtranRelations + "\n"
//				+ "------------------------------------------ \n"
//				+ " \n"
//				+ "\n");	

		
		for (Cell c1: this.getRncCells()){
			
			int numOfIntraRelations = c1.getIntraRelations().size();
			int numOfInterRelations = c1.getInterRelations().size();
			int numOfExtRelations = c1.getExtRelations().size();
			int numOfUtranRelations = numOfIntraRelations 
					+ numOfInterRelations + numOfExtRelations;
			
			sb.append(""
					+ "------------------------------------------ \n"
					+  c1.getUserLabel() 
					+ ", numOfUtranRelations=" + numOfUtranRelations
					+ ", numOfIntraRelations=" + numOfIntraRelations
					+ ", numOfInterRelations=" + numOfInterRelations
					+ ", numOfExtRelations=" + numOfExtRelations 
					+ "\n"
					+ "------------------------------------------ \n"
					//+ " \n"
					//+ "\n");
					 );
			
			String sourceCell = c1.getUserLabel();
			
			int relationId = 1;			
			if (!c1.getIntraRelations().isEmpty()){			
				for (Cell c2: c1.getIntraRelations()){
					
					sb.append(""
							+ "("+ relationId++ +")"+ sourceCell   
							+ " has intra utran relation with " + c2.getUserLabel() 
							+ "\n"
							);
				}						
			}
			
			relationId = 32;			
			if (!c1.getInterRelations().isEmpty()){
				for (Cell c2: c1.getInterRelations()){
					
					sb.append(""
							+ "("+ relationId++ +")"+ sourceCell   
							+ " has inter utran relation with " + c2.getUserLabel() 
							+ "\n"
							);
				}					
			}
			
//			relationId = 71;			
//			if (!c1.getExtRelations().isEmpty()){
//				for (int targetcId: c1.getExtRelations()){
//					
//					sb.append(""
//							+ "("+ relationId++ +")"+ sourceCell   
//							+ " has external utran relation with " 
//							+ this.getRncCells().get(targetcId).getUserLabel() 
//							+ "\n"
//							);
//				}					
//			}
			
					
		}
		
		return sb.toString();
	}
	public void setCellsForInterRelationsProxies(int[] proxyArray){
		int percentage = 0, numOfProxyForInterRelations = 0, numOfCells = 0;
		int totalPercentage = 0, counter = 0;
		int totalNumOfCells = this.getTotalNumOfCellsForRnc();
		
		//this.setRncCellsArray();
		
		for ( int i = 0; i < proxyArray.length - 1; i+=2){
			percentage = proxyArray[i];
			numOfProxyForInterRelations = proxyArray[i+1];
			totalPercentage += percentage;
									
			counter = numOfCells;
			numOfCells += (percentage * totalNumOfCells) / 100;
			
			if ( totalPercentage == 100){
				numOfCells = totalNumOfCells;
			}
			
			while(counter < numOfCells){
				this.rncCells.get(counter).setNumOfProxyForInterRelations(numOfProxyForInterRelations);
				counter++;
			}			
		}		
	}

	
	public void printRncCellsNumOfProxyForInterRelations(){
		
		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				System.out.println("c1.getNumOfProxyForInterRelations()=" +c1.getNumOfProxyForInterRelations());
			}
		}	
		
	}
	
		
	public int getTotalNumOfCellsForRnc(){
//		int totalNumOfCellsForRnc = 0;
//		for (Rbs rbs1 : this.getRbss()) {			
//			totalNumOfCellsForRnc += rbs1.getTotalNumOfCellsForRbs();						
//		}		
//		return totalNumOfCellsForRnc;
		return this.getRncCells().size();
	}
	
	// return num of cells that has no any proxy 
	public int getCellsNumberThatProxySet(int proxyType){
		int cellsNumberThatNoProxySet = 0;
		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				if (c1.getNumOfProxyForInterRelations() == proxyType){
					cellsNumberThatNoProxySet++;
				}
			}
		}	
		
		return cellsNumberThatNoProxySet;
	}	
	
	// return num of cells that has no any proxy 
//	public int getCellsNumberThatNoProxySet(){
	public double getCellsNumberThatNoProxySet(){
		int cellsNumberThatNoProxySet = 0;
		for (Rbs rbs1 : this.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {
				if (c1.getNumOfProxyForInterRelations() == 0){
					cellsNumberThatNoProxySet++;
				}
			}
		}	
		
//		return cellsNumberThatNoProxySet;
//		return (int)(cellsNumberThatNoProxySet * this.getPrimeFactor());
		return (cellsNumberThatNoProxySet * this.getPrimeFactor());
	}
	
	/*
	 * return number of cells that has no any External UtranCell relation  
	 */
	public int getCellsNumberThatNoExtUCRSet(){
		int cellsNumberThatNoExtUCRProxySet = 0;
		for (Cell c1 : this.getRncCells()) {
			if (c1.getNumOfProxyForExtRelations() == 0){
				cellsNumberThatNoExtUCRProxySet++;
			}
		}
		return cellsNumberThatNoExtUCRProxySet;
	}
	
	public int getNumberOfCellsThatExtUCRSet(){
		
		return this.getTotalNumOfCellsForRnc() - this.getCellsNumberThatNoExtUCRSet();
	}
	
	public boolean isRncSuitableForExtUCRCreation(){
		boolean res = true;
		if (this.getCellsNumberThatNoExtUCRSet() == 0){
			res = false;
		}
		return res;
	}
	
	public Cell getSuitableCellForExtUCRCreation(){
		Cell c1 = null;
		for(Cell c2 : this.getRncCells()){
			if (c2.getNumOfInterRelation() == 0){
				return c2;
			}			
		}		
		return c1;
	}
	
	
	// return num of cells that has proxy within an rnc 
	public int getCellsNumberThatProxySet(){
//		return this.getTotalNumOfCellsForRnc() - this.getCellsNumberThatNoProxySet();
		return this.getTotalNumOfCellsForRnc() - (int)this.getCellsNumberThatNoProxySet();
	}

	public ArrayList<Rbs> getRbss() {
		return this.rbss;
	}
	
	public int getRncId() {
		// TODO Auto-generated method stub
		return this.rncId;
	}
	
	public void sortCellsByCellId(){
		
		ArrayList<Cell> cellsArray= this.getRncCells();
		
		Collections.sort(cellsArray, new Comparator<Cell>() {
			@Override
			public int compare(Cell c1, Cell c2) {
				return c1.getCellId() - c2.getCellId();
			}
		});
		
	}
	
	
	
//	public void setMaxInterRelationsNumber(int maxNumOfInterRelation){
//		for (Cell c1 : this.rncCells){
//			c1.setMaxNumOfInterRelation(maxNumOfInterRelation);
//			if (c1.getNumOfProxyForInterRelations() != 0){
//				this.rncCells.add(c1);
//			}
//		}
//	}

	public double getPrimeFactor() {
		return primeFactor;
	}


	public void setPrimeFactor(double primeFactor) {
		this.primeFactor = primeFactor;
	}


	@Override
	public String toString() {
		return "Rnc{" + "rbss=" + rbss + ", rncId=" + rncId + '}';
	}


	public int getTotalNumOfExtUCRProxy() {
		// TODO Auto-generated method stub
		int totalNumOfExtUCRProxy = 0;
		for (Cell c1: this.getRncCells()){
			totalNumOfExtUCRProxy+=c1.getNumOfProxyForExtRelations();
		}
		return totalNumOfExtUCRProxy;
	}


	public int getTotalNumOfExtRelations() {
		// TODO Auto-generated method stub
		int totalNumOfExtRel = 0;
		for(Cell c1: this.getRncCells()){
			totalNumOfExtRel+= c1.getExtRelations().size();
		}
		return totalNumOfExtRel;
	}
	
	public int getTotalNumOfExtEutranFreqRelations() {
		// TODO Auto-generated method stub
		int totalNumOfExtEutranFreqRel = 0;
		for(Cell c1: this.getRncCells()){
			totalNumOfExtEutranFreqRel+= c1.getExtEutranFreqRelations().size();
		}
		return totalNumOfExtEutranFreqRel;
	}


	public int getTotalNumOfIntraRelations() {
		// TODO Auto-generated method stub
		int totalNumOfIntraRelations = 0;
		
		for(Cell c1: this.getRncCells()){
			totalNumOfIntraRelations+=c1.getIntraRelations().size();
		}
		return totalNumOfIntraRelations;		
	}
	
	public int getTotalNumOfInterRelations() {
		// TODO Auto-generated method stub
		int totalNumOfInterRelations = 0;
		
		for(Cell c1: this.getRncCells()){
			totalNumOfInterRelations+=c1.getInterRelations().size();
		}
		return totalNumOfInterRelations;		
	}


	public String getRncName(int numberOfLeadingZero){
		String format = "%s%0"+numberOfLeadingZero+"d";
		String rncName = String.format(format, "RNC",this.getRncId());
		return rncName;
	}
	
    @Override
    public int compareTo (Rnc compareRnc){
    	int compareQuantity = compareRnc.getRncId();
    	return this.getRncId() - compareQuantity;
    }
}
