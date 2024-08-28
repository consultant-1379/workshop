/*
 * 
 * Latest stable design for externalUtranReations
 * date 2013/03/21 at 22:4
 * 
 */

package wran;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectInputStream.GetField;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

import utilities.HelperFunctions;
import utilities.ReadWriteTextFile;

public class Main {

	/**
	 * @param args
	 */

	public static final String LTE_FILE = "LTE_Cell_And_Relation_info_50k_SystemTest_013_2.csv";

	public static final int W1_MCC = 46;
	public static final int W1_MNC = 6;
	public static final int W1_MNC_LENGTH = 2;
	
	public static final int W2_MCC = 46;
	public static final int W2_MNC = 7;
	public static final int W2_MNC_LENGTH = 2;
	
	public static final int INRA_UC_RELATION_NUM = 1438728;
	public static final int INTER_UC_RELATION_NUM = 479576;
	public static final int EXT_UC_RELATION_NUM = 261587;
	public static final int MAX_UC_RELATION_PERCENTAGE = 10;

	/*
	 * Rnc types are created based on number of Rbs and number of cells on Rbs
	 * 
	 * e.g. { [NumOfRbs,NumOfCell] ,[NumOfRbs,NumOfCell]...}
	 */
	public static final int[] rncType1 = { 9, 1, 30, 3, 25, 6, 3, 9, 2, 12 };
	public static final int[] rncType2 = { 5, 1, 40, 3, 21, 6 };
	public static final int[] rncType3 = { 3, 1, 74, 3, 45, 6, 12, 9, 10, 12 };
	public static final int[] rncType4 = { 6, 1, 54, 3, 65, 6, 30, 9, 31, 12 };
	public static final int[] rncType5 = { 10, 1, 110, 3, 80, 6, 81, 9, 63, 12 };
	public static final int[] rncType6 = { 16, 1, 60, 3, 70, 6, 85, 9, 95, 12 };
	public static final int[] rncType7 = { 18, 1, 15, 3, 13, 6, 90, 9, 300, 12 };   //v7
	//public static final int[] rncType7 = { 18, 1, 50, 3, 13, 6, 90, 9, 300, 12 }; //v6
		

	/*
	 * Holds Rnc types. Users add desired rncType into the array. Order is
	 * important because rncDistArray get types from this array
	 * 
	 * e.g. { rncType1, rncType2, ... }
	 */
	public static final int[][] w1_rncTypesArray = { rncType1, rncType2,
			rncType3, rncType4, rncType5, rncType6, rncType7 };

	/*
	 * Rncs are created based on rncDistArray. First item of the rncDistArray
	 * correspond to first item of rncTypes array. So, numOf firstItemOf
	 * rncDistArray array x firstItemOf rncTypes array rncs are created within
	 * n/w
	 * 
	 * { [NumOfOfRncType1], [NumOfOfRncType2], NumOfOfRncType3....}
	 */
	public static final int[] w1_rncDistArray = { 53, 41, 9, 1, 2, 2, 1 };

	/*
	 * NOTE: Higher proxy range must come first e.g. {20,3,50,1}
	 * 
	 * { [ProxyPercentage, ProxyType], [ProxyPercentage, ProxyType]...}
	 */
	public static final int[] w1_proxyDistArray = { 3, 7, 7, 3, 20, 2, 35, 1 };

	/*
	 * Allows to select which RNCs to have extUC relation
	 * 
	 * {StartRnc, EndRnc], [StartRnc, EndRnc] ... } *
	 */
	public static final String[] w1_extUCProxyImplDistArray = { ""
			+ "rncStart=1, rncEnd=106" };

	/*
	 * Distributes intra relations based on given values e.g. {1, 90, 31} from
	 * rnc=1 up to rnc=90 creates 31 intra relations
	 * 
	 * If given range is less than total network rnc size, rest of the relations
	 * are distributed evenly among left rncs
	 * 
	 * { TotalNumofIntraRelations, [RncStart, RncEnd, NumOfIntraRelation],
	 * [#1,#2,#3]...}
	 */
	public static final int[] w1_intraUCRelationDistArray = {
			INRA_UC_RELATION_NUM, 1, 54, 31, 55, 109, 20 };

	/*
	 * Areas distributed among cells based on share number e.g. Share=95 means
	 * 95 cells will share same area { [RncStart, RncEnd, ShareNumber],
	 * [#1,#2,#3]...}
	 */
	public static final int[] w1_areasDistArray = { 1, 108, 95, 109, 109, 111 };

	/*
	 * *************************************************
	 * WRAN2 NETWORK START *************************************************
	 */
	/*
	 * NOTE: Higher proxy range must come first e.g. {20,3,50,1}
	 * 
	 * { [ProxyPercentage, ProxyType], [ProxyPercentage, ProxyType]...}
	 */
	public static final int[] w2_extUCProxyDistArray = { 3, 7, 7, 3, 20, 2, 35,
			1 };

	public static final int[] w2_rncType1 = { 40, 5 };
	public static final int[][] w2_rncTypesArray = { w2_rncType1 };
	public static final int[] w2_rncDistArray = { 100 };
	public static final int[] w2_areasDistArray = { 1, 100, 100 };


	public static void main(String[] args) {
		// TODO Auto-generated method stub

		final long startTime = System.currentTimeMillis();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		// get current date time with Calendar()
		Calendar cal = Calendar.getInstance();
		System.out.println("//...starting wranNetwork at "
				+ sdf.format(cal.getTime()));

//		Wran w3 = new Wran();
//		w3.createWranNetwork(w1_rncTypesArray, w1_rncDistArray);
		
		boolean run = true;
		if (run) {

			Wran deserializedWran1 = deserializeWranNetwork("w1.ser");
			Wran deserializedWran2 = deserializeWranNetwork("w2.ser");
			boolean moServiceEnabled = false;

			Wran w1 = null, w2 = null;
			// final int rncId = Integer.valueOf(args[0]);
			final int startRncId = Integer.valueOf(args[0]);
			final int endRncId = Integer.valueOf(args[1]);

			if (deserializedWran1 == null && deserializedWran2 == null) {

				w1 = new Wran(W1_MCC,W1_MNC,W1_MNC_LENGTH);

				w1.createWranNetwork(w1_rncTypesArray, w1_rncDistArray);

				System.out.println("//:w1::NumOfRnc=" + w1.getNumOfRnc());
				System.out.println("//:w1::NumOfCells=" + w1.getNumOfCells());

				System.out
						.println("//:w1::isIntraRelationCreationSuccesfull="
								+ w1.createIntraUCRelations(w1_intraUCRelationDistArray));

				System.out.println("//:w1::NumOfIntraRelationsForNetwork="
						+ w1.getNumOfIntraRelationForNetwork());

				boolean isProxyConformancePassed = w1
						.checkProxyConformance(w1_proxyDistArray);

				// System.exit(0);

				System.out
						.println("//:w1::InterUCRelation proxy control passed="
								+ isProxyConformancePassed);

				if (isProxyConformancePassed) {

					System.out.println("//:w1::Proxy creation::START");
					w1.createProxies(w1_proxyDistArray);
					System.out.println("//:w1::Proxy creation::END");

					// System.exit(0);

					int start = 1;
					int end = 0;
					int totalNumOfProxy = 0;

					for (ProxyHolder proxyH : w1.getProxyHolders()) {

						end += proxyH.getNumOfProxy();

						System.out.println("//:w1::proxyType="
								+ proxyH.getProxyType() + ",numOfProxy="
								+ proxyH.getNumOfProxy() + ",start=" + start
								+ ",end=" + end);
						start = end;
						totalNumOfProxy = ProxyHolder.getTotalNumOfProxy();
					}
					System.out.println("//:w1::totalNumOfProxy="
							+ totalNumOfProxy);

					System.out.println("//:w1::MinRequiredNumOfInterRelations="
							+ w1.getMinRequiredNumOfInterUCRelations());

					System.out.println("//:w1::CurrentNumOfInterUCRelations="
							+ w1.getNumOfInterUCRelationsForNetwork());

					// int numOfInterUCRelation = 480;
					w1.createInterUCRelations(INTER_UC_RELATION_NUM);

					System.out
							.println("//:w1::MinRequiredNumOfInterUCRelations="
									+ w1.getMinRequiredNumOfInterUCRelations());
					System.out.println("//:w1::CurrentNumOfInterUCRelations="
							+ w1.getNumOfInterUCRelationsForNetwork());
					System.out.println("//:w1::NumOfInterUCRelationForNetwork="
							+ w1.getNumOfInterUCRelationsForNetwork());

				}

				w2 = new Wran(W2_MCC, W2_MNC, W2_MNC_LENGTH);
				/*
				 * Create network according to rncType by num of rnc which
				 * specified in rncDistArray
				 */
				w2.createWranNetwork(w2_rncTypesArray, w2_rncDistArray);

				System.out.println("//:w2::NumOfRnc=" + w2.getNumOfRnc());
				System.out.println("//:w2::NumOfCells=" + w2.getNumOfCells());

				/*
				 * Set extUC proxyTypes within network by specified percentage
				 * in w2ExtUCProxyDistArray
				 */
				w2.setExtUCProxies(w2_extUCProxyDistArray);

				w1.createDefaultExtUCRelationTowardsOtherNetwork(w2,
						w1_extUCProxyImplDistArray);
				System.out
						.println("//:w1::createDefaultExtUCRelationTowardsOtherNetwork(w2, extUCProxyImplDistArray) is running");

				System.out.println("//:w1::minRequiredNumOfExternalUCRelation="
						+ w1.getMinRequiredNumOfExternalUCRelation());
				System.out.println("//:w1::NumOfExtUCRelationForNetwork="
						+ w1.getNumOfExtUCRelationsForNetwork());

				System.out.println("//:w2::totalNumOfExtUCRelationProxyForW2="
						+ w2.getTotalNumOfExtUCRProxy());
				System.out.println("//:w2::NumOfExtUCRelationForNetwork="
						+ w2.getNumOfExtUCRelationsForNetwork());
				
				
				System.out
				.println("//:w1::createExtUtranRelTowardsOtherNetwork(w2, EXT_UC_RELATION_NUM , MAX_UC_RELATION_PERCENTAGE) is running");
				w1.createExtUtranRelTowardsOtherNetwork(w2, EXT_UC_RELATION_NUM , MAX_UC_RELATION_PERCENTAGE);

				//
				// in progress
				// w1.createExtUtranRelTowardsOtherNetwork(w2, 2500, 10);
				// System.out.println("//::maxNumOfRelationsCellNumber=" +
				// w1.getMaxNumOfRelationsCellsNumber(10));

				System.out.println("//::INFO: w1 is being serialized...");
				serializeWranNetwork("w1.ser", w1);
				System.out.println("//::INFO: w1 serialized sucessfully...");

				System.out.println("//::INFO: w2 is being serialized...");
				serializeWranNetwork("w2.ser", w2);
				System.out.println("//::INFO: w2 serialized sucessfully...");

				moServiceEnabled = false;

			} else {

				System.out.println("//===INFO: w1 is being deserialized...");
				w1 = deserializedWran1;
				w1.setMcc(W1_MCC);
				w1.setMnc(W1_MNC);
				w1.setMncLength(W1_MNC_LENGTH);
				System.out.println("//===INFO: w1 deserialized sucessfully...");

				System.out.println("//:w1::NumOfRnc=" + w1.getNumOfRnc());
				System.out.println("//:w1::NumOfCells=" + w1.getNumOfCells());

				System.out.println("//:w1::NumOfIntraRelationsForNetwork="
						+ w1.getNumOfIntraRelationForNetwork());

				int start = 1;
				int end = 0;
				int totalNumOfProxy = 0;

				for (ProxyHolder proxyH : w1.getProxyHolders()) {

					end += proxyH.getNumOfProxy();

					System.out.println("//:w1::proxyType="
							+ proxyH.getProxyType() + ",numOfProxy="
							+ proxyH.getNumOfProxy() + ",start=" + start
							+ ",end=" + end);
					start = end;
					totalNumOfProxy = ProxyHolder.getTotalNumOfProxy();
				}
				System.out.println("//:w1::totalNumOfProxy=" + totalNumOfProxy);

				System.out.println("//:w1::MinRequiredNumOfInterRelations="
						+ w1.getMinRequiredNumOfInterUCRelations());

				System.out.println("//:w1::CurrentNumOfInterUCRelations="
						+ w1.getNumOfInterUCRelationsForNetwork());

				System.out.println("//:w1::MinRequiredNumOfInterUCRelations="
						+ w1.getMinRequiredNumOfInterUCRelations());
				System.out.println("//:w1::CurrentNumOfInterUCRelations="
						+ w1.getNumOfInterUCRelationsForNetwork());
				System.out.println("//:w1::NumOfInterUCRelationForNetwork="
						+ w1.getNumOfInterUCRelationsForNetwork());

				System.out.println("//:w1::NumOfExtUCRelationForNetwork="
						+ w1.getNumOfExtUCRelationsForNetwork());

				System.out.println("//===INFO: w2 is being deserialized...");
				w2 = deserializedWran2;
				w2.setMcc(W2_MCC);
				w2.setMnc(W2_MNC);
				w2.setMncLength(W2_MNC_LENGTH);
				System.out.println("//===INFO: w2 deserialized sucessfully...");

				System.out.println("//:w2::NumOfRnc=" + w2.getNumOfRnc());
				System.out.println("//:w2::NumOfCells=" + w2.getNumOfCells());

				System.out.println("//:w2::totalNumOfExtUCRelationProxyForW2="
						+ w2.getTotalNumOfExtUCRProxy());

				System.out
						.println("//:w2::totalNumOfCellsSetForExtUCRelationProxy="
								+ w2.getNumOfCellsSetForExtUCRelationProxy());
				
//				w1.createExtUtranRelTowardsOtherNetwork(w2, EXT_UC_RELATION_NUM , MAX_UC_RELATION_PERCENTAGE);

				
//				w1.printExtUCRelationsConnections(w2);
//				String w2_ExtUCRelationsMasterProxyDistribution 
//					= w2.printExtUCRelations(w1, 1, 100);
//				writingToFile(w2_ExtUCRelationsMasterProxyDistribution
//						, "w2_ExtUCRelationsMasterProxyDistribution.txt");
				//System.out.println(w2_ExtUCRelationsMasterProxyDistribution);
				
				
//				
//				for (Rnc rnc1:w1.getRncsArray()){
//					System.out.printf("rnc=%s, totalNumOfIntraRelations=%d %n"
//							,rnc1.getRncId(), rnc1.getTotalNumOfIntraRelations());
//				}
//				System.out.println();
//				
//				for (Rnc rnc1:w1.getRncsArray()){
//					System.out.printf("rnc=%s, totalNumOfInterRelations=%d %n"
//							,rnc1.getRncId(), rnc1.getTotalNumOfInterRelations());
//				}
//				System.out.println();
//				
//				for (Rnc rnc1:w1.getRncsArray()){
//					System.out.printf("rnc=%s, totalNumOfExterRelations=%d %n"
//							,rnc1.getRncId(), rnc1.getTotalNumOfExtRelations());
//				}
//				
				
				
				//w2.printCellsHasExtUCProxySet();

				//System.out
				//.println("//:w1::rncInterRelations");
				 //w1.getRncsArray().get(0).printAllIntraRelations();
				 //w1.getRncsArray().get(0).printAllInterRelations();
				 // w1.printExtUCRelations(1);
				 // System.out.println(w1.printExtUCRelations(1));
//				String w1_ucRelReport = w1.printAllUtranRelations(w2);
				//System.out.println(w1_ucRelReport);
//				writingToFile(w1_ucRelReport, "w1_uCRelReport.txt");
//				moServiceEnabled = true;

			}

	
			/*
			 * designed and coded terribly due to urgent production requirement.
			 * need total redesign and refactor
			 */
			boolean lteEnabled = false;
			
			if (lteEnabled){				
		
				
				List<String> linesOfLTECellInfoFile = LteCellData.readLTECellInfoFile(LTE_FILE);
				List<String> extractedLinesOfLTECellInfoFile = new ArrayList<String>();
				
				Map<Integer, LteCellData> lteCellDataMap = new TreeMap<Integer, LteCellData>();		
				Map<Integer, Integer> eutranFreqCounter = new TreeMap<Integer, Integer>();
				
				/*
				 * Process lines from external file
				 */
				for (String line : linesOfLTECellInfoFile) {
					//System.out.print("line=" + line);
					// String output = line.substring(0, 6);
					if (line.contains("WRROWID")) {
						//System.out.print("output=" + line);
						extractedLinesOfLTECellInfoFile.add(line);
						
						String utranCell = line.split(",")[0];
						String eutranFreqRelation = line.split(",")[1];
						String earfcnDl = line.split(",")[2];
						
						int utranCellId = Integer.valueOf(utranCell.split("=")[1]);
						int eutranFreqRelationId = Integer.valueOf(eutranFreqRelation.split("=")[1]);
						int earfcnDlId = Integer.valueOf((earfcnDl.split("=")[1]).trim());				
						
						lteCellDataMap.put(utranCellId
								, new LteCellData(earfcnDlId, eutranFreqRelationId, utranCellId));				
					}		
		//			if (i++ == 50)break; // testing purposes only
				}
				
				/*
				 * Count how many cells on each frequency
				 */
				for (Entry<Integer, LteCellData> entry : lteCellDataMap.entrySet()){
//					int utranCellId = entry.getKey();
					int earfcnDlId = entry.getValue().getEarfcnDl();
					
					if (eutranFreqCounter.containsKey(earfcnDlId)){
						eutranFreqCounter.put(earfcnDlId, eutranFreqCounter.get(earfcnDlId) + 1);
					}else{
						eutranFreqCounter.put(earfcnDlId, 1);
					}
				}
				
				/*
				 * Make a list for external lte cell data
				 */
				List<EutranFreqDist> eutranFreqDistInfoList =  new ArrayList<EutranFreqDist>(); 
				List<Integer> eutranFreqs = new ArrayList<Integer>();
				for (Entry<Integer,Integer> entry : eutranFreqCounter.entrySet()){
					int earfcnDlId = entry.getKey();
					int numOfCells = entry.getValue();
					EutranFreqDist efd1 = new EutranFreqDist(earfcnDlId, numOfCells);
					
					eutranFreqDistInfoList.add(efd1);					
				}
				Collections.sort(eutranFreqDistInfoList, new Comparator<EutranFreqDist>(){
					@Override
					public int compare(EutranFreqDist o1, EutranFreqDist o2) {
						// TODO Auto-generated method stub
						return o2.getNumOfCells() - o1.getNumOfCells();
					}});
				for (EutranFreqDist efd1: eutranFreqDistInfoList){
					int earfcnDlId = efd1.getEutranfreq();
					eutranFreqs.add(earfcnDlId);	
				}
				
				
				/*
				 * { [FreqPercentage, FreqType], [FreqPercentage, FreqType]...}
				 */
				int[] eutranfreqDistArrayForNetwork = {50, 1, 40, 2, 5, 4, 5, 8};
				int maxNumOfEEFreqRelations = 0;
				for (int i=0; i<eutranfreqDistArrayForNetwork.length; i+=2){
					int eutranfreq = eutranfreqDistArrayForNetwork[i+1];
					if (maxNumOfEEFreqRelations<eutranfreq){
						maxNumOfEEFreqRelations=eutranfreq;
					}
				}
				System.out.format("maxNumOfEEFreqRelations=%d %n", maxNumOfEEFreqRelations);
				/*
				 * Calculate general eeutranfreq relation distribution
				 */
				List<EEFreqRelDistHolder> extEFreqRelaltions 
					= LteCellData.getListOfNumOfEEFreqRels(eutranfreqDistArrayForNetwork
							, w1.getNumOfCells());
				Collections.sort(extEFreqRelaltions, new Comparator<EEFreqRelDistHolder>(){
					@Override
					public int compare(EEFreqRelDistHolder e1,
							EEFreqRelDistHolder e2) {
						// TODO Auto-generated method stub
						int res = e2.getNumOfCells() - e1.getNumOfCells();
						if (res == 0){
							return e1.getnumOfEEFreqRel() - e2.getnumOfEEFreqRel();
						}
						return res;
					}					
				});
				int index2 = 0;
				for( EEFreqRelDistHolder eefrd1: extEFreqRelaltions){
					int numOfCells = eefrd1.getNumOfCells();
					int numOfEEFreqRel = eefrd1.getnumOfEEFreqRel();
					int minus = eutranFreqDistInfoList.get(index2).getNumOfCells();
					numOfCells -= minus;
					eefrd1.setNumOfCells(numOfCells);
					index2++;
					
					System.out.format("numOfEEFreqRel=%d, previous-numOfCells=%d, minus=%d after-numOfCells=%d %n"
							, numOfEEFreqRel, (numOfCells + minus), minus, numOfCells);					
				}
				
				
				
				int maxEEFreqRelCellsNum = extEFreqRelaltions.get(0).getNumOfCells();
				
				int extraEEFreqRelCellsNumFromExtSourceIfAny = 0;				
				int totalEarfcnDlComesFromExtSource = lteCellDataMap.size();				
				System.out.format("totalEarfcnDlComesFromeExternal=%d %n", totalEarfcnDlComesFromExtSource);
				
				totalEarfcnDlComesFromExtSource = 0;
//				for (Entry<Integer,Integer> entry : eutranFreqCounter.entrySet()){
//					System.out.format("Key(earfcndl):%d, Value(NumofInstance):%d %n"
//							, entry.getKey(), entry.getValue());
//					
//					totalEarfcnDlComesFromExtSource+= entry.getValue();
//				}
				for( EutranFreqDist efd1: eutranFreqDistInfoList){
					System.out.format("earfcnDlId:%d, numOfCells:%d %n"
					, efd1.getEutranfreq(), efd1.getNumOfCells());
					
					totalEarfcnDlComesFromExtSource+= efd1.getNumOfCells();
				}
				System.out.format("totalEarfcnDlComesFromeExternal=%d %n", totalEarfcnDlComesFromExtSource);
					
				

				/*
				 * First create eeutranfreq relations data comes from ext source
				 */
				System.out.format("LTE IRATHOM related eeutranFreq relations are created... %n");
				int index = 0;
				for (Entry<Integer, LteCellData> entry : lteCellDataMap.entrySet()) {
//					System.out.println("Key : " + entry.getKey() + " Value : "
//						+ entry.getValue());
					index = entry.getKey() - 1;
					LteCellData lcd1= entry.getValue();
					Cell sc1 = w1.getCellsArray().get(index);
					
					int earfcnDlId = lcd1.getEarfcnDl();
					int numOfEEutranFreqRel = eutranFreqs.indexOf(earfcnDlId) + 1;
//					System.out.format("cellId=%d, earfcnDlId=%d, numOfEEutranFreqRel=%d %n"
//							, (index + 1), earfcnDlId, numOfEEutranFreqRel );
					
					if((numOfEEutranFreqRel > 2) && (numOfEEutranFreqRel < 4)){
						numOfEEutranFreqRel = 4;
					}else if (numOfEEutranFreqRel >= 4){
						numOfEEutranFreqRel = 8;
					}
//					System.out.format("numOfEEutranFreqRel=%d , rncId=%d, cellName=%s %n"
//							,numOfEEutranFreqRel, sc1.getRncId(), sc1.getUserLabel());
					
					for (int i = 0; i < numOfEEutranFreqRel; i++){
						if (numOfEEutranFreqRel <= 2){
							earfcnDlId = eutranFreqs.get(i);
						} else {							
							earfcnDlId = (i + 1);
						}
						
//						System.out.format(">>earfcnDlId=%d ", earfcnDlId);
						sc1.addExtEutranFreqRelation(earfcnDlId);
					}
//					System.out.println("");
//					if (earfcnDlId==3)break;
				}	
				
				/*
				 * Second create eeutranfreq relations from calculated values minus external source
				 */
				System.out.format("Other than LTE IRATHOM related eeutranFreq relations are created...%n");
				index = lteCellDataMap.size();
				int stop = 0;
				for( EEFreqRelDistHolder eefrd1: extEFreqRelaltions){
					int numOfCells = eefrd1.getNumOfCells();
					int numOfEEFreqRel = eefrd1.getnumOfEEFreqRel();
					
					stop = index + numOfCells;
					
					System.out.format("index=%d, stop=%d, %n"
							, index, stop);	
					
					for(; index < stop; index++){
						
						Cell sc1 = w1.getCellsArray().get(index);
//						System.out.format("cellId=%d, numOfEEutranFreqRel=%d %n"
//								, (index + 1), numOfEEFreqRel );
						
						int earfcnDlId = 0;
						for (int j = 0; j < numOfEEFreqRel; j++){
							if (numOfEEFreqRel <= eutranFreqs.size() ){
								earfcnDlId = eutranFreqs.get(j);
							}else{
								earfcnDlId = (j + 1);
							}
//							System.out.format(">>earfcnDlId=%d ", earfcnDlId);
							sc1.addExtEutranFreqRelation(earfcnDlId);
						}
//						System.out.println("");
//						break;
					}					
				} // end for( EEFreqRelDistHolder eefrd1: extEFreqRelaltions)
			
			
			
				System.out.println("//:w1::NumOfExtEutranFreqRelationForNetwork="
						+ w1.getNumOfExtEutranFreqRelationsForNetwork());
				
				for (Rnc rnc1 : w1.getRncsArray()){
					System.out.println("//:w1::NumOfExtEutranFreqRelationForRnc="
							+rnc1.getRncName(2)+ "="+ rnc1.getTotalNumOfExtEutranFreqRelations());
			}
			
			} // end if (lteenabled)
			
			moServiceEnabled = true;
			if (moServiceEnabled) {

				if ((w1 != null) && (w2 != null)) {
					for (int i = startRncId; i <= endRncId; i++) {
						createMOFile(w1, w2, i);
					}

				} else {
					System.out
							.println("//::FATAL ERROR: Due to error MO file isn't creaded!!!");
				}
			}
			
		}
		
		long endTime = System.currentTimeMillis();
		System.out.println("//::: ElapsedTime=" + (endTime - startTime) / 1000
				+ " seconds");
		System.out.println("//...exiting from wranNetwork at "
				+ sdf.format(cal.getTime()));

	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



	public static void createMOFile(Wran w1, Wran w2, int rncId) {

		w1.setAreas(w1_areasDistArray);
		w1.setPrimaryScramblingCodes();

		w2.setAreas(w2_areasDistArray);
		w2.setPrimaryScramblingCodes();

		System.out.println("//::: Entering into MOService...");
		MOService mos = new MOService();

		// int rncId = 1;
		// w1.printCells();

		StringBuilder sb = new StringBuilder();
//		sb.append(mos.createAreas(w1, rncId));
//		sb.append(mos.createUtranCells(w1, rncId));
		sb.append(mos.createExternalUtranCellsForInterRelations(w1, rncId));
		sb.append(mos.createExternalUtranCellsForExtRelations(w1, w2, rncId));
//		
//		
		sb.append(mos.createIntraUCRelations(w1, rncId));
		sb.append(mos.createInterUCRelations(w1, rncId));
		sb.append(mos.createExtUCRelations(w1, w2, rncId));
//		sb.append(mos.createExtEutranFreqRelations(w1, rncId));

//		sb.append(mos.setUtranCells(w1, rncId));
//		sb.append(mos.setExternalUtranCellsForInterRelations(w1, rncId));

		
//		sb.append(mos.deleteExtUCRelations(w1, w2, rncId));
//		sb.append(mos.deleteExternalUtranCellsForExtRelations(w1, w2, rncId));
//		sb.append(mos.deleteInterUCRelations(w1, rncId));
//		sb.append(mos.deleteExternalUtranCellsForInterRelations(w1, rncId));


		/*
		 * WRAN2 network
		 */
//		sb.append(mos.createAreas(w2, rncId));
//		sb.append(mos.createUtranCells(w2, rncId));
//		sb.append(mos.createExternalUtranCellsForExtRelations(w2, w1, rncId));
//		sb.append(mos.createExtUCRelations(w2, w1, rncId));

		
		writingToMOFile(sb.toString(), rncId);

		System.out.println("//::: Exiting from MOService...");

	}

	public static void serializeWranNetwork(String filename, Wran w1) {

		try {
			FileOutputStream fs = new FileOutputStream(filename);
			ObjectOutputStream os = new ObjectOutputStream(fs);
			os.writeObject(w1);
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Wran deserializeWranNetwork(String filename) {

		Wran w1 = null;
		File file = new File(filename);
		boolean exist = file.exists();

		if (exist) {
			try {
				FileInputStream fs = new FileInputStream(filename);
				ObjectInputStream is = new ObjectInputStream(fs);
				w1 = (Wran) is.readObject();
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("//===INFO: the file=" + filename
					+ " is being created for first time.");
		}
		return w1;
	}

	public static void writingToMOFile(String str, int rncId) {

		int numOfLeadingZeros = 2;
		String fileName = "RNC"
				+ HelperFunctions.getIdsAsAString(rncId, numOfLeadingZeros)
//				+ "-createExtUCR1.mo";
//				+ "-createExtUCandR1.mo";  // create with new Ext relation
//				+ "-createExtUCandR2.mo";	// without new ext uc r			
//				+ "-createInterExtUCandR3.mo";	// new design with new ext uc r		
//				+ "-v9_deleteExtUCandR1.mo";	// new design with new ext uc r		
//				+ "-v10_createInterExtUCandR1.mo";	// new design with new ext uc r		
//				+ "-v10_createExtUCandR1.mo";	// new design with new ext uc r		
//				+ "-v11_createExtUCR1.mo";	// new design with new ext uc r	
//				+ "-v11_createExtUCandR1.mo";	// new design with new ext uc r	
//				+ "-v11_createWRAN2v1.mo";
//				+ "-v12_createWRAN2v1.mo";
//				+ "-v12_createInterRelAndInterExtUCv1.mo";
//				+ "-v12_createIntraRelv1.mo";
//				+ "-v13_createExtEutranFreqRelv1.mo";
//				+ "-v14_createExtEutranFreqRelv1.mo";
				+ "-v15_createUtranRelationsv1.mo";
		
		PrintWriter out = null;

		try {

			// Create a PrintWriter (overwrites file if it exists).
			out = new PrintWriter(new BufferedWriter(new FileWriter(fileName)));

			// Loop through the collection of customers.
			out.print(str);

			System.out
					.printf("//===INFO: Successfully written text file %s.\n",
							fileName);

		} catch (IOException ex) {
			System.err.println(ex.getMessage());
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
	
	public static void writingToFile(String str, String fileName) {


		PrintWriter out = null;

		try {

			// Create a PrintWriter (overwrites file if it exists).
			out = new PrintWriter(new BufferedWriter(new FileWriter(fileName)));

			// Loop through the collection of customers.
			out.print(str);

			System.out
					.printf("//===INFO: Successfully written text file %s.\n",
							fileName);

		} catch (IOException ex) {
			System.err.println(ex.getMessage());
		} finally {
			if (out != null) {
				out.close();
			}
		}
	}
}
