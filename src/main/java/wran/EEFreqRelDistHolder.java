package wran;

import java.util.HashSet;

class EEFreqRelDistHolder{
	private int numOfRel = 0;
	private int numOfCells = 0;
	private int percentage = 0;
		
	private HashSet<Integer> eutranFreqs = new HashSet<Integer>();
	
	/**
	 * @param numOfRel
	 * @param numOfRel2 
	 * @param percentage
	 */
	public EEFreqRelDistHolder(int percenTage, int numOfCells, int numOfRel) {
		super();
		this.numOfRel = numOfRel;
		this.numOfCells = numOfCells;
		this.percentage = percenTage;
	}
    

	public HashSet<Integer> getEutranFreqs() {
		return eutranFreqs;
	}

	public void addEutranFreq(int eutranFreq) {
		this.eutranFreqs.add(eutranFreq);
	}

	public int getnumOfEEFreqRel() {
		return numOfRel;
	}

	public void setNumOfRel(int numOfRel) {
		this.numOfRel = numOfRel;
	}

	public int getPercenTage() {
		return percentage;
	}

	public void setPercentage(int percentage) {
		this.percentage = percentage;
	}

	public int getNumOfCells() {
		return numOfCells;
	}

	public void setNumOfCells(int numOfCells) {
		this.numOfCells = numOfCells;
	};
	
	
	
}