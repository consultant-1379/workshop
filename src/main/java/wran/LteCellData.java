package wran;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import utilities.ReadWriteTextFile;

public class LteCellData {
	
	private int earfcnDl = 0;
	private int eutranFreqRelationId = 0;
	private int ucellId = 0;
	
	public LteCellData(){};
	
	/**
	 * @param earfcnDl
	 * @param eutranFreqRelationId
	 * @param ucellId
	 */
	public LteCellData(int earfcnDl, int eutranFreqRelationId, int ucellId) {
		super();
		this.earfcnDl = earfcnDl;
		this.eutranFreqRelationId = eutranFreqRelationId;
		this.ucellId = ucellId;
	}
	
	
	public int getEarfcnDl() {
		return earfcnDl;
	}
	public void setEarfcnDl(int earfcnDl) {
		this.earfcnDl = earfcnDl;
	}
	public int getEutranFreqRelationId() {
		return eutranFreqRelationId;
	}
	public void setEutranFreqRelationId(int eutranFreqRelationId) {
		this.eutranFreqRelationId = eutranFreqRelationId;
	}
	public int getUcellId() {
		return ucellId;
	}
	public void setUcellId(int ucellId) {
		this.ucellId = ucellId;
	}
	
	
	public static List<EEFreqRelDistHolder> getListOfNumOfEEFreqRels(int[] freqRelDistArray, int numOfCells){
		List<EEFreqRelDistHolder> eEFreqRelDistHolders = new ArrayList<EEFreqRelDistHolder>();
		int tmpTotalNumOfCells = 0;
		for( int i = freqRelDistArray.length - 1; i >= 0; i-=2 ){
			int perc = freqRelDistArray[i - 1];
			int numOfRel = freqRelDistArray[i];
			
			int times = (numOfCells * perc) / 100;
			if( (i - 1) == 0 ){
				times = numOfCells - tmpTotalNumOfCells;				
			}
			tmpTotalNumOfCells+=times;
			
			eEFreqRelDistHolders.add(new EEFreqRelDistHolder(perc, times, numOfRel));
			
			//System.out.println("percentage=" + perc + ", numOfCells=" + times + ", numOfEEFreqRel=" + numOfRel);
		}			
		System.out.format("tmpTotalCells=%d %n", tmpTotalNumOfCells);
		
		return eEFreqRelDistHolders;
	}
	
	public static List<String> readLTECellInfoFile(String file) {
		List<String> lines = null;

		try {
			ReadWriteTextFile rw = new ReadWriteTextFile();

			File f = new File(file);
			String s = rw.getContents(f);
			lines = new ArrayList<String>(Arrays.asList(s.split("\n")));

			return lines;

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return lines;

	}
	
	
	
	@Override
	public String toString() {
		return "LteCellData [earfcnDl=" + earfcnDl + ", eutranFreqRelationId="
				+ eutranFreqRelationId + ", ucellId=" + ucellId + "]";
	}
	
		


}
