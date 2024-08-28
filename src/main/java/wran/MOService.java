
/*
 * Note: I noticed this is not a good design but for the sake of 
 * quick solution for now I will do this way.
 * 
 * (1) I noticed that it would be better to create new object 
 * for each type of mo e.g. UtranCell, ExternalUtranCell, 
 * LocatioArea class etc
 * 
 * (2) I noticed that it would be better to use TreeSet for cells, rbss, rncs
 * collection instead of ArrayList
 * 
 * (3) It would be better to use Enum instead of public static final variables
 * 
 */



package wran;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import wran.Rnc;
import wran.Cell;
import wran.Rbs;

public class MOService {	
	
	public static final int INTRA_RELATION_START_ID = 1;
	public static final int INTER_RELATION_START_ID = 32;
	public static final int EXT_RELATION_START_ID = 71;
	
	public static final int INTER_RELATION_TYPE = 1;
	public static final int INTRA_RELATION_TYPE = 0;


	public String createAreas(Wran w1, int rncId){
		
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		// Get rnc areas
		Set<Integer> sortedLocAreas = new TreeSet<Integer>();
		Set<String> sortedRoutingAreas = new TreeSet<String>();
		Set<String> sortedServiceAreas = new TreeSet<String>();
		
		
		for (Rbs rbs1 : rnc1.getRbss()) {
			for (Cell c1 : rbs1.getCells()) {				
				sortedLocAreas.add(Integer.parseInt(c1.getLocationAreaRef()));
				sortedRoutingAreas.add(c1.getRoutingAreaRef());
				sortedServiceAreas.add(c1.getServiceAreaRef());				
			}
		}		
		
		
		// creation of LocationArea and URA
		for (int locArea : sortedLocAreas){
//			System.out.println("LocationArea=" + locArea);
									
			sb.append("" 
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1\" \n"
					+ "    identity " + (locArea) + "\n"
					+ "    moType LocationArea \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 1 \n"
					+ "      lac Integer "+ (locArea) + "\n"
					+ ")" // + "\n" 
					+ "\n");
			
			int ura = locArea;
			
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1\" \n"
					+ "    identity " + (ura) + "\n"
					+ "    moType Ura \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 1 \n"
					+ "      uraIdentity Integer "+ (ura) + "\n"
					+ ")"  
					+ "\n");				
			
		}
		
		for(String routingAreaToken : sortedRoutingAreas){
//			System.out.println("RoutingArea=" + routingArea);
			
			String[] routingAreaSplited = routingAreaToken.split(",");
			String locArea = routingAreaSplited[0];
			String routingArea = routingAreaSplited[1];

			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1,LocationArea=" + (locArea) + "\" \n"
					+ "    identity " + (routingArea) + "\n"
					+ "    moType RoutingArea \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 1 \n"
					+ "      rac Integer "+ (routingArea) + "\n"
					+ ")"  
					+ "\n");				
		}
		
		for(String serviceAreaToken : sortedServiceAreas){
//			System.out.println("ServiceArea=" + serviceArea);
			
			String[] serviceAreaSplited = serviceAreaToken.split(",");
			String locArea = serviceAreaSplited[0];
			String serviceArea = serviceAreaSplited[1];
			
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1,LocationArea=" + (locArea) +  "\" \n"
					+ "    identity " + (serviceArea) + "\n"
					+ "    moType ServiceArea \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 1 \n"
					+ "      sac Integer "+ (serviceArea) + "\n"
					+ ")"  
					+ "\n");				
		}		
		
		return sb.toString();
	} 
	
	
	public String createUtranCells(Wran w1, int rncId){
		
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);

		// Get UtranCells
		ArrayList<Cell> sortedUtranCells = rnc1.getRncCells();		
		
		// creation of IubLink
		Set<Integer> sortedIubLinks = new TreeSet<Integer>();
		
		for (Cell c1 : sortedUtranCells){
			sortedIubLinks.add(c1.getRbsId());
		}
		for (int iubLink : sortedIubLinks){
			
			int operationalState = 1; // 0-DISABLED, 1-ENABLED
			int administrativeState = 1; // 0-LOCKED, 1-UNLOCKED
			
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1 \" \n"
					+ "    identity " + (iubLink) + "\n"
					+ "    moType IubLink \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 8 \n"
					+ "      rbsId Integer " + (iubLink) + "\n"
					+ "      operationalState Integer " + (operationalState) + "\n"
					+ "      administrativeState Integer " + (administrativeState) + "\n"
					+ ")" 
					+ "\n");			
		}
		
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + ", numOfUtranCells=" + (sortedUtranCells.size()) 
				+ "\n" 
				+ "//######################" + "\n");
		
		
		// creation of UtranCells
		for (Cell c1 : sortedUtranCells) {
			
			int cellId = c1.getCellId();
			int rbsId = c1.getRbsId();
			String lac = c1.getLocationAreaRef();
			String rac = (c1.getRoutingAreaRef().split(","))[1];
			String sac = (c1.getServiceAreaRef().split(","))[1];
			String userLabel = c1.getUserLabel();
			int uarfcnDl = c1.getUarfcnDl();
			int uarfcnUl = c1.getUarfcnUl();
			int primaryScramblingCode = c1.getPrimaryScramblingCode();
			int qQualMin = c1.getqQualMin();
			int maxTxPowerUI = c1.getMaximumTransmissionPower();
			int qRxLevMin = c1.getqRxLevMin();
			int primaryCpichPower = c1.getPrimaryCpichPower();
			
			int tCell = c1.getTCell();
			int maxTransmissionPower = c1.getMaximumTransmissionPower();
			int localCellId = cellId;
			int usedFreqThresh2dRscp = c1.getUsedFreqThresh2dRscp();
			int usedFreqThresh2dEcno = c1.getUsedFreqThresh2dEcno();
			int sRatSearch = c1.getsRatSearch();
			int operationalState = c1.getOperationalState();
			int administrativeState  = c1.getAdministrativeState();
			
			int uraRef = Integer.parseInt(rac);

			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1\" \n"
					+ "    identity " + (userLabel) + "\n"
					+ "    moType UtranCell \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 8 \n"
					+ "      iubLinkRef Ref ManagedElement=1,RncFunction=1,IubLink=" + (rbsId) +"\n"
					+ "      cId Integer " + (cellId) + "\n"
					+ "      userLabel String " + (userLabel) + "\n"					
					+ "      locationAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) + "\n"
					+ "      routingAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) 
					+ ",RoutingArea=" + (rac) + "\n"
					+ "      serviceAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) 
					+ ",ServiceArea=" + (sac) + "\n"
					+ "      uraRef Array Ref \"ManagedElement=1,RncFunction=1,Ura=" + (uraRef) + "\" \n"
					+ "      tCell Integer " + (tCell) + "\n"
					+ "      uarfcnDl Integer " + (uarfcnDl) + "\n"
					+ "      uarfcnUl Integer " + (uarfcnUl) + "\n"
					+ "      primaryScramblingCode Integer " + (primaryScramblingCode) + "\n"
					+ "      primaryCpichPower Integer " + (primaryCpichPower) + "\n"
					+ "      qQualMin Integer " + (qQualMin) + "\n"
					+ "      qRxLevMin Integer " + (qRxLevMin) + "\n"
					+ "      maxTxPowerUl Integer " + (maxTxPowerUI) + "\n"
					+ "      maximumTransmissionPower Integer " + (maxTransmissionPower) + "\n"
					+ "      localCellId Integer " + (localCellId) + "\n"
					+ "      usedFreqThresh2dRscp Integer " + (usedFreqThresh2dRscp) + "\n"
					+ "      usedFreqThresh2dEcno Integer " + (usedFreqThresh2dEcno) + "\n"
					+ "      sRatSearch Integer " + (sRatSearch) + "\n"
					+ "      operationalState Integer " + (operationalState) + "\n"
					+ "      administrativeState Integer " + (administrativeState) + "\n"					
					+ "      accessClassNBarred Array Integer 16" + "\n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "      accessClassesBarredCs Array Integer 16" + "\n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "      accessClassesBarredPs Array Integer 16" + "\n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ "        0 \n" 
					+ "        1 \n" 
					+ "        0 \n" 
					+ "        1 \n"
					+ ")" 
					+ "\n");
		}	
		return sb.toString();
	}
	
	public String setUtranCells(Wran w1, int rncId){
		
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);

		// Get UtranCells
		ArrayList<Cell> sortedUtranCells = rnc1.getRncCells();
		
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + ", numOfUtranCells=" + (sortedUtranCells.size()) 
				+ "\n" 
				+ "//######################" + "\n");
		
		
		// creation of UtranCells
		for (Cell c1 : sortedUtranCells) {
			
			int cellId = c1.getCellId();
			int rbsId = c1.getRbsId();
			String lac = c1.getLocationAreaRef();
			String rac = (c1.getRoutingAreaRef().split(","))[1];
			String sac = (c1.getServiceAreaRef().split(","))[1];
			String userLabel = c1.getUserLabel();
			int uarfcnDl = c1.getUarfcnDl();
			int uarfcnUl = c1.getUarfcnUl();
			int primaryScramblingCode = c1.getPrimaryScramblingCode();
			int qQualMin = c1.getqQualMin();
			int maxTxPowerUI = c1.getMaximumTransmissionPower();
			int qRxLevMin = c1.getqRxLevMin();
			int primaryCpichPower = c1.getPrimaryCpichPower();
			
			int tCell = c1.getTCell();
			int maxTransmissionPower = c1.getMaximumTransmissionPower();
			int localCellId = cellId;
			int usedFreqThresh2dRscp = c1.getUsedFreqThresh2dRscp();
			int usedFreqThresh2dEcno = c1.getUsedFreqThresh2dEcno();
			int sRatSearch = c1.getsRatSearch();
			int operationalState = c1.getOperationalState();
			int administrativeState  = c1.getAdministrativeState();
			
			int uraRef = Integer.parseInt(rac);

			sb.append(""
					+ "SET \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1"
					+ ",UtranCell=" + (userLabel) + "\" \n"
					+ "    nrOfAttributes 8 \n"
					//+ "      iubLinkRef Ref ManagedElement=1,RncFunction=1,IubLink=" + (rbsId) +"\n"
					//+ "      cId Integer " + (cellId) + "\n"
					//+ "      userLabel String " + (userLabel) + "\n"					
					//+ "      locationAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) + "\n"
					//+ "      routingAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) 
					//+ ",RoutingArea=" + (rac) + "\n"
					//+ "      serviceAreaRef Ref ManagedElement=1,RncFunction=1,LocationArea=" + (lac) 
					//+ ",ServiceArea=" + (sac) + "\n"
					//+ "      uraRef Array Ref \"ManagedElement=1,RncFunction=1,Ura=" + (uraRef) + "\" \n"
					//+ "      tCell Integer " + (tCell) + "\n"
					//+ "      uarfcnDl Integer " + (uarfcnDl) + "\n"
					//+ "      uarfcnUl Integer " + (uarfcnUl) + "\n"
					+ "      primaryScramblingCode Integer " + (primaryScramblingCode) + "\n"
					//+ "      primaryCpichPower Integer " + (primaryCpichPower) + "\n"
					//+ "      qQualMin Integer " + (qQualMin) + "\n"
					+ "      qRxLevMin Integer " + (qRxLevMin) + "\n"
					+ "      maxTxPowerUl Integer " + (maxTxPowerUI) + "\n"
					//+ "      maximumTransmissionPower Integer " + (maxTransmissionPower) + "\n"
					//+ "      localCellId Integer " + (localCellId) + "\n"
					//+ "      usedFreqThresh2dRscp Integer " + (usedFreqThresh2dRscp) + "\n"
					//+ "      usedFreqThresh2dEcno Integer " + (usedFreqThresh2dEcno) + "\n"
					//+ "      sRatSearch Integer " + (sRatSearch) + "\n"
					//+ "      operationalState Integer " + (operationalState) + "\n"
					//+ "      administrativeState Integer " + (administrativeState) + "\n"					
					//+ "      accessClassNBarred Array Integer 16" + "\n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "      accessClassesBarredCs Array Integer 16" + "\n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "      accessClassesBarredPs Array Integer 16" + "\n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ "        0 \n" 
					//+ "        1 \n" 
					//+ "        0 \n" 
					//+ "        1 \n"
					//+ ")" 
					+ "\n");
		}	
		return sb.toString();
		
	}
	
	
	public String createExternalUtranCellsForInterRelations(Wran w1, int rncId) {
		
		StringBuilder sb = new StringBuilder();
		
		int w1_mnc = w1.getMnc();
		int w1_mcc = w1.getMcc();
		int w1_mncLength= w1.getMncLength();

		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);

		// Get externalUtranCells
		Set<Cell> unsortedExtUtranCells = new HashSet<Cell>();

		for (Cell c1 : rnc1.getRncCells()) {
			if (!c1.getInterRelations().isEmpty()) {
				for (Cell c2 : c1.getInterRelations()) {
					unsortedExtUtranCells.add(c2);
				}
			}
		}
		
		ArrayList<Cell> extUtranCells = new ArrayList<Cell>();
		extUtranCells.addAll(unsortedExtUtranCells);
		sortCellsByCellIdAscending(extUtranCells);		

		// Get iurlinks
		Set<Integer> iurLinks = new HashSet<Integer>();
		int iurLink;
		for (Cell c1 : extUtranCells) {
			iurLink = c1.getRncId();
			iurLinks.add(iurLink);
		}						
		
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + "\n"
				+ "//######################" + "\n");
		
		// prerequisite: creation of UtranNetwork   
		sb.append(""
				+ "CREATE \n" 
				+ "( \n"
				+ "  parent \"ManagedElement=1,RncFunction=1 \" \n"
				+ "    identity " + (w1_mnc) + "\n"
				+ "    moType UtranNetwork \n" 
				+ "    exception none \n"
				+ "    nrOfAttributes 3 \n"
				+ "      UtranNetworkId String 1 \n"
				+ "      aliasPlmnIdentities Array Struct 0 \n"
				+ "      plmnIdentity Struct \n" 
				+ "        nrOfElements 3 \n"
				+ "          mcc Integer " + (w1_mcc) + "\n"
				+ "          mnc Integer " + (w1_mnc) + "\n"
				+ "          mncLength Integer " + (w1_mncLength) + "\n"
				+ ")"  
				+ "\n");
		

		// prerequisite: creation Of Iurlinks
		for (int iurLinkId : iurLinks) {
			
//			System.out.println("" 
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1 \" \n"
					+ "    identity " + (iurLinkId) + "\n"
					+ "    moType IurLink \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 2 \n"
					+ "      rncId Integer " + (iurLinkId) + "\n" 
					+ "      utranNetworkRef Ref \"ManagedElement=1,RncFunction=1,UtranNetwork=" 
					+ (w1_mnc) + "\" \n" 
					+ ")" 
					+ "\n");
		}

		// creation Of ExternalUtranCells
		for (Cell c1 : extUtranCells) {

			int iurLinkId = c1.getRncId();
			int cellId = c1.getCellId();
			String lac = c1.getLocationAreaRef();
			String rac = (c1.getRoutingAreaRef().split(","))[1];
			String userLabel = c1.getUserLabel();
			int uarfcnDl = c1.getUarfcnDl();
			int uarfcnUl = c1.getUarfcnUl();
			int primaryScramblingCode = c1.getPrimaryScramblingCode();
			int qQualMin = c1.getqQualMin();
			int maxTxPowerUI = c1.getMaximumTransmissionPower();
			int qRxLevMin = c1.getqRxLevMin();
			int primaryCpichPower = c1.getPrimaryCpichPower();
						
			
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1,IurLink="
					+ (iurLinkId) + "\" \n"
					+ "    identity " + (cellId) + "\n"
					+ "    moType ExternalUtranCell \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 8 \n"
					+ "      lac Integer " + (lac) + "\n"
					+ "      rac Integer  " + (rac) + "\n"
					+ "      userLabel String " + (userLabel) + "\n"
					+ "      cId Integer " + (cellId) + "\n"
					+ "      uarfcnDl Integer " + (uarfcnDl) + "\n"
					+ "      uarfcnUl Integer " + (uarfcnUl) + "\n"
					+ "      primaryScramblingCode Integer " + (primaryScramblingCode) + "\n"
					+ "      qQualMin Integer " + (qQualMin) + "\n"
					+ "      maxTxPowerUl Integer " + (maxTxPowerUI) + "\n"
					+ "      qRxLevMin Integer " + (qRxLevMin) + "\n"
					+ "      primaryCpichPower Integer " + (primaryCpichPower) + "\n"
					+ ")" 
					+ "\n");
		}
		return sb.toString();
	}

	
	
	public String deleteExternalUtranCellsForInterRelations(Wran w1, int rncId) {
		
		StringBuilder sb = new StringBuilder();

		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);

		// Get externalUtranCells
		Set<Cell> unsortedExtUtranCells = new HashSet<Cell>();

		for (Cell c1 : rnc1.getRncCells()) {
			if (!c1.getInterRelations().isEmpty()) {
				for (Cell c2 : c1.getInterRelations()) {
					unsortedExtUtranCells.add(c2);
				}
			}
		}
		
		ArrayList<Cell> extUtranCells = new ArrayList<Cell>();
		extUtranCells.addAll(unsortedExtUtranCells);
		sortCellsByCellIdAscending(extUtranCells);		

		// Get iurlinks
		Set<Integer> iurLinks = new HashSet<Integer>();
		int iurLink;
		for (Cell c1 : extUtranCells) {
			iurLink = c1.getRncId();
			iurLinks.add(iurLink);
		}						
		
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + "\n"
				+ "//######################" + "\n");
		
		// deletion Of ExternalUtranCells
		for (Cell c1 : extUtranCells) {

			int iurLinkId = c1.getRncId();
			int cellId = c1.getCellId();						
			
			sb.append(""
					+ "DELETE \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1,IurLink="
					+ (iurLinkId) 
					+ ",ExternalUtranCell=" + (cellId) + "\" \n"
					+ ")" 
					+ "\n");
		}
		
		// deletion Of Iurlinks
		for (int iurLinkId : iurLinks) {
			
			sb.append(""
					+ "DELETE \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1"
					+ ",IurLink=" + (iurLinkId) + "\" \n"
					+ ")" 
					+ "\n");
		}
		
		return sb.toString();
	}

	
	
	public String setExternalUtranCellsForInterRelations(Wran w1, int rncId) {
		StringBuilder sb = new StringBuilder();

		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);

		// Get externalUtranCells
		Set<Cell> unsortedExtUtranCells = new HashSet<Cell>();

		for (Cell c1 : rnc1.getRncCells()) {
			if (!c1.getInterRelations().isEmpty()) {
				for (Cell c2 : c1.getInterRelations()) {
					unsortedExtUtranCells.add(c2);
				}
			}
		}
		
		ArrayList<Cell> extUtranCells = new ArrayList<Cell>();
		extUtranCells.addAll(unsortedExtUtranCells);
		sortCellsByCellIdAscending(extUtranCells);	
		
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + "\n"
				+ "//######################" + "\n");
		
		// creation Of ExternalUtranCells
		for (Cell c1 : extUtranCells) {

			int iurLinkId = c1.getRncId();
			int cellId = c1.getCellId();
			//String lac = c1.getLocationAreaRef();
			//String rac = (c1.getRoutingAreaRef().split(","))[1];
			//String userLabel = c1.getUserLabel();
			//int uarfcnDl = c1.getUarfcnDl();
			//int uarfcnUl = c1.getUarfcnUl();
			int primaryScramblingCode = c1.getPrimaryScramblingCode();
			//int qQualMin = c1.getqQualMin();
			int maxTxPowerUI = c1.getMaximumTransmissionPower();
			int qRxLevMin = c1.getqRxLevMin();
			//int primaryCpichPower = c1.getPrimaryCpichPower();
						
			
			sb.append(""
					+ "SET \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1" 
					+ ",IurLink=" + (iurLinkId) 
					+ ",ExternalUtranCell=" + (cellId) + "\" \n"
					+ "    exception none \n"
					+ "    nrOfAttributes 8 \n"
					//+ "      lac Integer " + (lac) + "\n"
					//+ "      rac Integer  " + (rac) + "\n"
					//+ "      userLabel String " + (userLabel) + "\n"
					//+ "      cId Integer " + (cellId) + "\n"
					//+ "      uarfcnDl Integer " + (uarfcnDl) + "\n"
					//+ "      uarfcnUl Integer " + (uarfcnUl) + "\n"
					+ "      primaryScramblingCode Integer " + (primaryScramblingCode) + "\n"
					//+ "      qQualMin Integer " + (qQualMin) + "\n"
					+ "      maxTxPowerUl Integer " + (maxTxPowerUI) + "\n"
					+ "      qRxLevMin Integer " + (qRxLevMin) + "\n"
					//+ "      primaryCpichPower Integer " + (primaryCpichPower) + "\n"
					+ ")" 
					+ "\n");
		}
		return sb.toString();
		
	}
	
	
	public String createUtranNetwork(int mcc, int mnc, int mncLength) {
		
		StringBuilder sb = new StringBuilder();
		
		//create UtranNetwork		
		sb.append(""
				+ "CREATE \n" 
				+ "( \n"
				+ "  parent \"ManagedElement=1,RncFunction=1 \n"
				+ "    identity " + (mnc) + "\n"
				+ "     moType UtranNetwork" + "\n" 
				+ "     exception none" + "\n"
				+ "     nrOfAttributes 3"  + "\n"
				+ "        UtranNetworkId String 1" + "\n" 
				+ "        aliasPlmnIdendities Array Struct 0" + "\n"
				+ "        plmnIdentity Struct" + "\n"
				+ "           nrOfElements 3 " + "\n"
				+ "             mcc Integer " + (mcc) + "\n"
				+ "             mnc Integer " + (mnc) + "\n"
				+ "             mncLength Integer " + (mncLength) + "\n"
				+ ")" 
				+ "\n");
		
		return sb.toString();	
		
	}
	
	
	
	public String createExternalUtranCellsForExtRelations(Wran w1, Wran w2, int rncId) {
		
		StringBuilder sb = new StringBuilder();	
		
		int w1_mnc = w1.getMnc();
		int w1_mcc = w1.getMcc();
		int w1_mncLength= w1.getMncLength();
		
		int w2_mnc = w2.getMnc();
		int w2_mcc = w2.getMcc();
		int w2_mncLength= w2.getMncLength();
		
		// Get ExternalUtranCells
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		w2.sortCellsByCellId();
		ArrayList<Cell> w2_cellsArray = w2.getCellsArray();

		Set<Cell> unsortedExtUtranCells = new HashSet<Cell>();
				
		for (Cell c1 : rnc1.getRncCells()) {
			if (!c1.getExtRelations().isEmpty()) {
				ArrayList<Integer> extUtranCellRelationCellIds = new ArrayList<Integer>(c1.getExtRelations());
				int index = 0;
				for (int i = 1; i <= c1.getExtRelations().size(); i++) {
					Cell c2 = w2_cellsArray.get(extUtranCellRelationCellIds.get(index++) - 1); // needs update
					unsortedExtUtranCells.add(c2);
				}
			}
		}
		
		ArrayList<Cell> extUtranCells = new ArrayList<Cell>();
		extUtranCells.addAll(unsortedExtUtranCells);
		sortCellsByCellIdAscending(extUtranCells);
		
		// Get iurLinks
		Set<String> iurLinkIds = new HashSet<String>();
		
		for (Cell c1 : extUtranCells) {
			String iurLinkId = (w2_mcc) + "_"+ (w2_mnc) + "_" + (c1.getRncId()) ; 
			iurLinkIds.add(iurLinkId);
		}	
		
		
//		System.out.println(""
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + ", (WithinNetwork)numOfIurLinks=" + (iurLinkIds.size()) 
				+ ", (WithinNetwork)numOfExtUC=" + (extUtranCells.size()) + "\n"
				+ "//######################" + "\n");
		
		
		// prerequisite: creation of UtranNetwork   
		sb.append(""
				+ "CREATE \n" 
				+ "( \n"
				+ "  parent \"ManagedElement=1,RncFunction=1\" \n"
				+ "    identity " + (w2_mnc) + "\n"
				+ "    moType UtranNetwork \n" 
				+ "    exception none \n"
				+ "    nrOfAttributes 3 \n"
				+ "      UtranNetworkId String 1 \n"
				+ "      aliasPlmnIdentities Array Struct 0 \n"
				+ "      plmnIdentity Struct \n" 
				+ "        nrOfElements 3 \n"
				+ "          mcc Integer " + (w2_mcc) + "\n"
				+ "          mnc Integer " + (w2_mnc) + "\n"
				+ "          mncLength Integer " + (w2_mncLength) + "\n"
				+ ")"  
				+ "\n");
		
		
		// prerequisite: creation Of Iurlinks
		for (String iurLinkId : iurLinkIds) {			
			
			int iurLinkRncId = Integer.valueOf(iurLinkId.split("_")[2]);
			
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1 \" \n"
					+ "    identity " + (iurLinkId) + "\n"
					+ "    moType IurLink \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 2 \n"
					+ "      rncId Integer " + (iurLinkRncId) + "\n" 
					+ "      utranNetworkRef Ref \"ManagedElement=1,RncFunction=1,UtranNetwork=" 
					+ 			(w2_mnc) + "\" \n" 
					+ ")" 
					+ "\n");
		}		
		
		// creation Of ExternalUtranCells		
		for (Cell c1 : extUtranCells) {

			String iurLinkId = (w2_mcc) + "_"+ (w2_mnc) + "_" + (c1.getRncId()) ;
			int cellId = c1.getCellId();
			String lac = c1.getLocationAreaRef();
			String rac = (c1.getRoutingAreaRef().split(","))[1];
			String userLabel = c1.getUserLabel();
			int uarfcnDl = c1.getUarfcnDl();
			int uarfcnUl = c1.getUarfcnUl();
			int primaryScramblingCode = c1.getPrimaryScramblingCode();
			int qQualMin = c1.getqQualMin();
			int maxTxPowerUI = c1.getMaximumTransmissionPower();
			int qRxLevMin = c1.getqRxLevMin();
			int primaryCpichPower = c1.getPrimaryCpichPower();
						
		
			sb.append(""
					+ "CREATE \n" 
					+ "( \n"
					+ "  parent \"ManagedElement=1,RncFunction=1,IurLink="
					+ (iurLinkId) + "\" \n"
					+ "    identity " + (cellId) + "\n"
					+ "    moType ExternalUtranCell \n" 
					+ "    exception none \n"
					+ "    nrOfAttributes 11 \n"
					+ "      lac Integer " + (lac) + "\n"
					+ "      rac Integer  " + (rac) + "\n"
					+ "      userLabel String " + (userLabel) + "\n"
					+ "      cId Integer " + (cellId) + "\n"
					+ "      uarfcnDl Integer " + (uarfcnDl) + "\n"
					+ "      uarfcnUl Integer " + (uarfcnUl) + "\n"
					+ "      primaryScramblingCode Integer " + (primaryScramblingCode) + "\n"
					+ "      qQualMin Integer " + (qQualMin) + "\n"
					+ "      maxTxPowerUl Integer " + (maxTxPowerUI) + "\n"
					+ "      qRxLevMin Integer " + (qRxLevMin) + "\n"
					+ "      primaryCpichPower Integer " + (primaryCpichPower) + "\n"
					+ ")" 
					+ "\n");
		}		
		
		return sb.toString();
	}
	


	
	
	public String deleteExternalUtranCellsForExtRelations(Wran w1, Wran w2, int rncId) {
		
		StringBuilder sb = new StringBuilder();		
		
		
		int w2_mnc = w2.getMnc();
		int w2_mcc = w2.getMcc();
		int w2_mncLength= w2.getMncLength();
		
		// Get ExternalUtranCells
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		w2.sortCellsByCellId();
		ArrayList<Cell> w2_cellsArray = w2.getCellsArray();

		Set<Cell> unsortedExtUtranCells = new HashSet<Cell>();
				
		for (Cell c1 : rnc1.getRncCells()) {
			if (!c1.getExtRelations().isEmpty()) {
				ArrayList<Integer> extUtranCellRelationCellIds = new ArrayList<Integer>(c1.getExtRelations());
				int index = 0;
				for (int i = 1; i <= c1.getExtRelations().size(); i++) {
					Cell c2 = w2_cellsArray.get(extUtranCellRelationCellIds.get(index++) - 1); //needs update
					unsortedExtUtranCells.add(c2);
				}
			}
		}
		
		ArrayList<Cell> extUtranCells = new ArrayList<Cell>();
		extUtranCells.addAll(unsortedExtUtranCells);
		sortCellsByCellIdAscending(extUtranCells);
		
		// Get iurLinks
		Set<String> iurLinkIds = new HashSet<String>();
		
		for (Cell c1 : extUtranCells) {
			String iurLinkId = (w2_mcc) + "_"+ (w2_mnc) + "_" + (c1.getRncId()) ; 
			iurLinkIds.add(iurLinkId);
		}	
		
		
//		System.out.println(""
		sb.append(""
				+ "//######################" + "\n" 
				+ "//RNCID=" + (rncId)  + ", (WithinNetwork)numOfIurLinks=" + (iurLinkIds.size()) 
				+ ", (WithinNetwork)numOfExtUC=" + (extUtranCells.size()) + "\n"
				+ "//######################" + "\n");
		

		
		// First delete child mos of ExternalUtranCells		
		for (Cell c1 : extUtranCells) {

			String iurLinkId = (w2_mcc) + "_"+ (w2_mnc) + "_" + (c1.getRncId()) ;
			int cellId = c1.getCellId();						
		
			sb.append(""
					+ "DELETE \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1" 
					+ ",IurLink=" + (iurLinkId) 
					+ ",ExternalUtranCell=" + (cellId) + "\" \n"
					+ ")" 
					+ "\n");
		}		
		
		// Last delete parent mos: Iurlinks
		for (String iurLinkId : iurLinkIds) {			
		
			sb.append(""
					+ "DELETE \n" 
					+ "( \n"
					+ "  mo \"ManagedElement=1,RncFunction=1"
					+ ",IurLink=" + (iurLinkId) + "\" \n"
					+ ")" 
					+ "\n");
		}
		
		return sb.toString();
	}

	
	
	public String createExtUCRelations(Wran w1, Wran w2, int rncId) {
		
		StringBuilder sb = new StringBuilder();
			
		int w2_mnc = w2.getMnc();
		int w2_mcc = w2.getMcc();
		int w2_mncLength= w2.getMncLength();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		w2.sortCellsByCellId();
		ArrayList<Cell> w2_cellsArray = w2.getCellsArray();
		
		for (Cell c1 : rnc1.getRncCells()){
			
			ArrayList<Cell> extUtranRelationCells = new ArrayList<Cell>(); 
			
			String uCellName=c1.getUserLabel();
			
			// Get ext relation cells into cell array
			if (!c1.getExtRelations().isEmpty()) {
				ArrayList<Integer> extUtranCellRelationCellIds = new ArrayList<Integer>(c1.getExtRelations());
				int index = 0;
				for (int i = 1; i <= c1.getExtRelations().size(); i++) {
					Cell c2 = w2_cellsArray.get(extUtranCellRelationCellIds.get(index++) - 1); //need update (updated in v11)
					extUtranRelationCells.add(c2);
				}

				sb.append(""
						+ "//**********************************\n"
						+ "// " + uCellName + ", numOfExtUCRelations=" + c1.getExtRelations().size() + "\n"
						+ "//**********************************\n"
						);					
			}			
			

			int relCount = EXT_RELATION_START_ID;
			
			for (Cell c2 : extUtranRelationCells) {

				String iurLinkId = (w2_mcc) + "_"+ (w2_mnc) + "_" + (c2.getRncId()) ;
				int cellId2 = c2.getCellId();
										
				String uCellRef="ManagedElement=1,RncFunction=1,IurLink=" + (iurLinkId) 
						+ ",ExternalUtranCell=" + (cellId2);
		
				sb.append(""
						+ "CREATE \n"
				        + "( \n"
				        + " parent \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName) + "\"\n"
				        + "  identity " + (relCount++) + "\n"
				        + "  moType UtranRelation \n"
				        + "  exception none \n"
				        + "  nrOfAttributes 1 \n"
				        + "    utranCellRef Ref " + (uCellRef) + "\n"
				        + "    nodeRelationType Integer " + (INTER_RELATION_TYPE) + "\n"
				        + "    frequencyRelationType Integer " + (INTER_RELATION_TYPE) + " \n"
				        + ")"
				        + "\n");						
			}			
		}		
	
		return sb.toString();
	}	
	
	
	public String deleteExtUCRelations(Wran w1, Wran w2, int rncId) {
		
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		w2.sortCellsByCellId();
		ArrayList<Cell> w2_cellsArray = w2.getCellsArray();
		
		for (Cell c1 : rnc1.getRncCells()){
			
			ArrayList<Cell> extUtranRelationCells = new ArrayList<Cell>(); 
			
			String uCellName=c1.getUserLabel();
			
			// Get ext relation cells into cell array
			if (!c1.getExtRelations().isEmpty()) {
				ArrayList<Integer> extUtranCellRelationCellIds = new ArrayList<Integer>(c1.getExtRelations());
				int index = 0;
				for (int i = 1; i <= c1.getExtRelations().size(); i++) {
					Cell c2 = w2_cellsArray.get(extUtranCellRelationCellIds.get(index++));
					extUtranRelationCells.add(c2);
				}

				sb.append(""
						+ "//**********************************\n"
						+ "// " + uCellName + ", numOfExtUCRelations=" + c1.getExtRelations().size() + "\n"
						+ "//**********************************\n"
						);					
			}			
			

			int relCount = EXT_RELATION_START_ID;
			
			for (Cell c2 : extUtranRelationCells) {
									
				sb.append(""
						+ "DELETE \n"
				        + "( \n"
				        + " mo \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName)
				        + ",UtranRelation=" + (relCount++) + "\" \n"
				        + ")"
				        + "\n");						
			}			
		}		
	
		return sb.toString();
	}	

	
	
	public String createInterUCRelations(Wran w1, int rncId) {
		
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
				
		// Create InterRelations
			for (Cell c1 : rnc1.getRncCells()) {
				if (!c1.getInterRelations().isEmpty()) {					

					String uCellName=c1.getUserLabel();
					
					sb.append(""
							+ "//**********************************\n"
							+ "// " + uCellName + " has " + c1.getInterRelations().size() + "\n"
							+ "//**********************************\n"
							);	
							
					int relCount = INTER_RELATION_START_ID;
					for (Cell c2 : c1.getInterRelations()) {

						int rncId2 = c2.getRncId();
						int cellId2 = c2.getCellId();
												
						String uCellRef="ManagedElement=1,RncFunction=1,IurLink=" + (rncId2) 
								+ ",ExternalUtranCell=" + (cellId2);
						
						sb.append(""
								+ "CREATE \n"
						        + "( \n"
						        + " parent \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName) + "\"\n"
						        + "  identity " + (relCount++) + "\n"
						        + "  moType UtranRelation \n"
						        + "  exception none \n"
						        + "  nrOfAttributes 1 \n"
						        + "    utranCellRef Ref " + (uCellRef) + "\n"
						        + "    nodeRelationType Integer " + (INTER_RELATION_TYPE) + "\n"
						        + "    frequencyRelationType Integer " + (INTER_RELATION_TYPE) + " \n"
						        + ")"
						        + "\n");						
					}
				}
			}
		return sb.toString();
	}
	
	
	public String deleteInterUCRelations(Wran w1, int rncId) {
		StringBuilder sb = new StringBuilder();
		
		w1.sortRncsByRncIdAscending();		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
				
		// Create InterRelations
			for (Cell c1 : rnc1.getRncCells()) {
				if (!c1.getInterRelations().isEmpty()) {					

					String uCellName=c1.getUserLabel();
					
					sb.append(""
							+ "//**********************************\n"
							+ "// " + uCellName + " has " + c1.getInterRelations().size() + "\n"
							+ "//**********************************\n"
							);	
							
					int relCount = INTER_RELATION_START_ID;
					for (Cell c2 : c1.getInterRelations()) {

						sb.append(""
								+ "DELETE \n"
						        + "( \n"
						        + " mo \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName) 
						        + ",UtranRelation=" + (relCount++) + "\" \n"
						        + ")"
						        + "\n");						
					}
				}
			}
		
		return sb.toString();
	}
	
	public String createIntraUCRelations(Wran w1, int rncId) {
			
			StringBuilder sb = new StringBuilder();
			
			w1.sortRncsByRncIdAscending();		
			Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
			
			for (Cell c1 : rnc1.getRncCells()){
				
				if (!c1.getIntraRelations().isEmpty()){
					
					String uCellName=c1.getUserLabel();
					
					sb.append(""
							+ "//**********************************\n"
							+ "// " + uCellName + " numOfInraUCRelations=" + c1.getIntraRelations().size() + "\n"
							+ "//**********************************\n"
							);					
					
					int relCount = INTRA_RELATION_START_ID;
					for (Cell c2 : c1.getIntraRelations()) {
						
						String uCellRef="ManagedElement=1,RncFunction=1,UtranCell=" + c2.getUserLabel();
								
						sb.append(""
								+ "CREATE \n"
						        + "( \n"
						        + " parent \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName) + "\"\n"
						        + "  identity " + (relCount++) + "\n"
						        + "  moType UtranRelation \n"
						        + "  exception none \n"
						        + "  nrOfAttributes 1 \n"
						        + "    utranCellRef Ref " + (uCellRef) + "\n"
						        + "    nodeRelationType Integer " + (INTRA_RELATION_TYPE) + "\n"
						        + "    frequencyRelationType Integer " + (INTRA_RELATION_TYPE) + " \n"
						        + ")"
						        + "\n");							
					}					
				}
			}			
			return sb.toString();
	}
	
	public String createExtEutranFreqRelations(Wran w1, int rncId) {
		
		StringBuilder sb = new StringBuilder();
		w1.sortCellsByCellId();
		
		Rnc rnc1 = w1.getRncsArray().get(rncId - 1);
		
		// prerequisite: creation of EutraNetwork 
		sb.append(""
				+ "CREATE \n"
		        + "( \n"
		        + " parent \"ManagedElement=1,RncFunction=1" + "\"\n"
		        + "  identity 1" + "\n"
		        + "  moType EutraNetwork \n"
		        + "  exception none \n"
		        + ")"
		        + "\n");
		
		// prerequisite: creation of EutranFrequency		
		int numOfEutranFreq = 8; // think about how to decouple this attribute from MOService e.g. as an attribute in rnc
		for (int eutranFreqId = 1; eutranFreqId <= numOfEutranFreq; eutranFreqId++){
			
			sb.append(""
					+ "CREATE \n"
			        + "( \n"
			        + " parent \"ManagedElement=1,RncFunction=1,EutraNetwork=1" + "\"\n"
			        + "  identity " + (eutranFreqId) + "\n"
			        + "  moType EutranFrequency \n"
			        + "  exception none \n"
			        + "  nrOfAttributes 1 \n"
			        + "    earfcnDl Integer " + (eutranFreqId) + "\n"
			        + ")"
			        + "\n");
			
		}	
		
		
		for (Cell c1 : rnc1.getRncCells()){
			
			if (!c1.getExtEutranFreqRelations().isEmpty()){
				
				String uCellName = c1.getUserLabel();
				
				sb.append(""
						+ "//**********************************\n"
						+ "// " + uCellName + " numOfExtEutranFreqRelations=" + c1.getExtEutranFreqRelations().size() + "\n"
						+ "//**********************************\n"
						);					
				
				for (Integer earfcnDlId : c1.getExtEutranFreqRelations()) {
					
					String eutranFrequencyRef = "ManagedElement=1,RncFunction=1,EutraNetwork=1,EutranFrequency=" + earfcnDlId;
					int eutranFreqRelationId = earfcnDlId;
					
					sb.append(""
							+ "CREATE \n"
					        + "( \n"
					        + " parent \"ManagedElement=1,RncFunction=1,UtranCell=" + (uCellName) + "\"\n"
					        + "  identity " + (eutranFreqRelationId) + "\n"
					        + "  moType EutranFreqRelation \n"
					        + "  exception none \n"
					        + "  nrOfAttributes 1 \n"
					        + "    eutranFrequencyRef Ref " + (eutranFrequencyRef) + "\n"
					        + "    EutranFreqRelationId String " + (eutranFreqRelationId) + "\n"
					        + "    userLabel String \"Ref to EutranFrequency=" + (eutranFreqRelationId) 
					        + " ("+ (eutranFrequencyRef) +")\" \n"
					        + ")"
					        + "\n");							
				}					
			}
		}		
		
		
		
		return sb.toString();
}

	
	
//	public static void sortRncsByRncIdAscending(ArrayList<Rnc> rncsArray) {
//		// Sort the array according to rncId proxy
//		Collections.sort(rncsArray, new Comparator<Rnc>() {
//			@Override
//			public int compare(Rnc r1, Rnc r2) {
//				return r1.getRncId() - r2.getRncId();
//			}
//		});
//	}
//	
	public static void sortCellsByCellIdAscending(ArrayList<Cell> cellsArray) {		
		// sort cells by cellId
		Collections.sort(cellsArray, new Comparator<Cell>() {
			@Override
			public int compare(Cell c1, Cell c2) {
				return c1.getCellId() - c2.getCellId(); 		
			}
		});
	}

}
