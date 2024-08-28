package utilities;

import java.util.ArrayList;

import wran.Rnc;

public class HelperFunctions {

	public static String getIdsAsAString(int id, int numOfLeadingZeros) {

		if (id <= 9) {
			return getZeros(numOfLeadingZeros - 1) + id;
		} else if (id <= 99) {
			return getZeros(numOfLeadingZeros - 2) + id;
		} else if (id <= 999) {
			return getZeros(numOfLeadingZeros - 3) + id;
		} else
		return "" + id;
	}

	public static String getZeros(int numOfLeadingZeros) {
		String zeros = "";
		for (int i = 1; i <= numOfLeadingZeros; i++) {
			zeros += "0";
		}
		return zeros;
	}
	
	public static int getRoundToClosestDivisibleNumber(int num, int divisor){
		
		int div = num / divisor;
		int mod = num % divisor;
		
		if (mod == 0){
			return num;
		}else{
			return (div+1) * divisor;
		}
	}
	
	// calculate LA start
	public static int getLAStart(int rncId, int share, ArrayList<Rnc> rncsArray){
		
		int numOfRncCells = 0;
		int numOfLAs = 0;
		int totalNumOfLAs = 0;
		int rncCount = 1;
		Rnc rnc1;
		
		while(rncCount <= rncId){
			rnc1 = rncsArray.get(rncCount - 1);
			numOfRncCells = rnc1.getTotalNumOfCellsForRnc();
			numOfLAs = HelperFunctions.getGroupId(numOfRncCells, share);
			totalNumOfLAs = totalNumOfLAs + numOfLAs;
			
			rncCount++;
		}
		
		return (totalNumOfLAs + 1 - numOfLAs);		
	}
	
	/*
	 * calculates  group
	 * 
	 * eg. count=5 share=3; group-1= 1,2,3  group-2= 4,5,6... so 5 is under group-2
	 */
	public static int getGroupId(int count, int share){
		int mod = 0;
		int div = 0;
		int group = 0;
		
		mod = count % share;
		div = count / share;
		if (mod == 0){
			group = div;
		}else {
			group = div + 1;
		}		
		return group;
	}
	
	

}
