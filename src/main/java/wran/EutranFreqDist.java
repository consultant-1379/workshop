package wran;

public class EutranFreqDist {
	
	private int eutranfreq = 0;
	private int numOfCells = 0;
	
	public EutranFreqDist(int eutranfreq, int numOfCells) {
		super();
		this.eutranfreq = eutranfreq;
		this.numOfCells = numOfCells;
	}

	public int getEutranfreq() {
		return eutranfreq;
	}

	public void setEutranfreq(int eutranfreq) {
		this.eutranfreq = eutranfreq;
	}

	public int getNumOfCells() {
		return numOfCells;
	}

	public void setNumOfCells(int numOfCells) {
		this.numOfCells = numOfCells;
	}
	
	

}
