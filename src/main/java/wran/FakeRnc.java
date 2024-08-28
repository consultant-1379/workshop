package wran;

public class FakeRnc {
	
	private int numOfCells;
	private int rncId;

	public FakeRnc(int rncId2, int totalNumOfCellsForRnc) {
		// TODO Auto-generated constructor stub
		rncId = rncId2;
		numOfCells = totalNumOfCellsForRnc;
	}

	@Override
	public String toString() {
		return "FakeRnc [numOfCells=" + numOfCells + ", rncId=" + rncId + "]";
	}	

	public int getNumOfCells() {
		return numOfCells;
	}

	public void setNumOfCells(int numOfCells) {
		this.numOfCells = numOfCells;
	}

	public int getRncId() {
		return rncId;
	}

	public void setRncId(int rncId) {
		this.rncId = rncId;
	}

}
