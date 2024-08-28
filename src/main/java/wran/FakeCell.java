package wran;

import java.util.HashSet;

public class FakeCell {
	
    private HashSet<FakeCell> interRelations = new HashSet<FakeCell>();
    private int cellId = 1;  // cell id unique within network
    private int maxNumOfInterRelation = 0;
    private int rncId = 1;
    private int numOfProxyForInterRelations = 0;
    
        
	public FakeCell(HashSet<FakeCell> interRelations, int cellId,
			int maxNumOfInterRelation, int rncId,
			int numOfProxyForInterRelations) {
		super();
		this.interRelations = interRelations;
		this.cellId = cellId;
		this.maxNumOfInterRelation = maxNumOfInterRelation;
		this.rncId = rncId;
		this.numOfProxyForInterRelations = numOfProxyForInterRelations;
	}
	
	public FakeCell(Cell other){
		
		this.cellId = other.getCellId();
		this.maxNumOfInterRelation = other.getMaxNumOfInterRelation();
		this.rncId = other.getRncId();
		this.numOfProxyForInterRelations = other.getNumOfProxyForInterRelations();
		
//		for (Cell c1 : other.getInterRelations()){
//			this.interRelations.add(new FakeCell(c1));
//		}
	}
	
	
	public HashSet<FakeCell> getInterRelations() {
		return interRelations;
	}
	public void setInterRelations(HashSet<Cell> interRelations) {
		
		for(Cell c1 : interRelations){
			FakeCell fc1 = new FakeCell(c1);
			this.interRelations.add(fc1);
		}
		
		
	}
	public int getCellId() {
		return cellId;
	}
	public void setCellId(int cellId) {
		this.cellId = cellId;
	}
	public int getMaxNumOfInterRelation() {
		return maxNumOfInterRelation;
	}
	public void setMaxNumOfInterRelation(int maxNumOfInterRelation) {
		this.maxNumOfInterRelation = maxNumOfInterRelation;
	}
	public int getRncId() {
		return rncId;
	}
	public void setRncId(int rncId) {
		this.rncId = rncId;
	}
	public int getNumOfProxyForInterRelations() {
		return numOfProxyForInterRelations;
	}
	public void setNumOfProxyForInterRelations(int numOfProxyForInterRelations) {
		this.numOfProxyForInterRelations = numOfProxyForInterRelations;
	}
        
	public int getNumOfInterRelation(){
		return this.getInterRelations().size();
	}
	
    public void addInterRelation(FakeCell fc){
        this.interRelations.add(fc);
    }


	public boolean isCellCanHaveRelationFromThisCell(FakeCell fc1){
		if (fc1.getNumOfProxyForInterRelations() == 0){ return false; }

		int countRncs = 1;
		int maxTimesARegisteredRncAllowedToHaveRelation = (fc1.getMaxNumOfInterRelation() / fc1.getNumOfProxyForInterRelations());
		
		if ((fc1.getInterRelations().size() < fc1.getNumOfProxyForInterRelations())){
			for (FakeCell fc : fc1.interRelations){
				if (this.getRncId() == fc.getRncId()){
					countRncs++;
					if (countRncs > 1){
						return false;	
					}				
				}			
			}			
			return true;
		}else if (fc1.getInterRelations().size() < fc1.getMaxNumOfInterRelation()){
		
			boolean isValidRnc = false;
			for (FakeCell fc : fc1.interRelations){
				if (this.getRncId() == fc.getRncId()){
					isValidRnc = true;
					break;
				}
			}
			
			if (isValidRnc){
				for (FakeCell fc : fc1.interRelations){
					if (this.getRncId() == fc.getRncId()){
						countRncs++;
						if (countRncs > maxTimesARegisteredRncAllowedToHaveRelation){
							if (fc1.interRelations.size() > fc1.getMaxNumOfInterRelation())
								return false;	
						}				
					}					
				}
				return true;
			} else{
				return false;
			}			

		} else{
			return false;
		}
	}
	
	public boolean isCellCanHaveRelationToThisCell(FakeCell fc1){
		if (fc1.getNumOfProxyForInterRelations() == 0 || this.getRncId() == fc1.getRncId()){ return false; }

		int countRncs = 1;
		int maxTimesARegisteredRncAllowedToHaveRelation = (this.getMaxNumOfInterRelation() / this.getNumOfProxyForInterRelations());
		
		if ((this.getInterRelations().size() < this.getNumOfProxyForInterRelations())){
			for (FakeCell fc : this.interRelations){
				if (fc1.getRncId() == fc.getRncId()){
					countRncs++;
					if (countRncs > 1){
						return false;	
					}				
				}			
			}			
			return true;
		}else if (this.getInterRelations().size() < this.getMaxNumOfInterRelation()){
		
			boolean isValidRnc = false;
			for (FakeCell fc : this.interRelations){
				if (fc1.getRncId() == fc.getRncId()){
					isValidRnc = true;
				}
			}
			
			if (isValidRnc){
				for (FakeCell fc : this.interRelations){
					if (fc1.getRncId() == fc.getRncId()){
						countRncs++;
						if (countRncs > maxTimesARegisteredRncAllowedToHaveRelation){
							if (this.interRelations.size() > this.getMaxNumOfInterRelation())
								return false;	
						}				
					}					
				}
				return true;
			} else{
				return false;
			}			
		} else{
			return false;
		}
	}
		
    

}
