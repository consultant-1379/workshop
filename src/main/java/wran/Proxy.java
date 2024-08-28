package wran;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import utilities.HelperFunctions;

public class Proxy implements Serializable{
	
	private static final long serialVersionUID = 4;
	
	ArrayList<Rnc> rncs = new ArrayList<Rnc>();
	ArrayList<FakeRnc> fakeRncs = new ArrayList<FakeRnc>();
	ArrayList<FakeRnc> backUpFakeRncs = new ArrayList<FakeRnc>();
	
	ArrayList<ProxyHolder> relHolders = new ArrayList<ProxyHolder>();
	
	public void addRncs(Rnc... params) {
		// TODO Auto-generated method stub
		for (Rnc rnc : params) {
			this.rncs.add(rnc);
			
			this.fakeRncs.add(new FakeRnc(rnc.getRncId(), rnc
					.getTotalNumOfCellsForRnc()));
			
			this.backUpFakeRncs.add(new FakeRnc(rnc.getRncId(), rnc
					.getTotalNumOfCellsForRnc()));			
		}
		
	}		


	public ArrayList<Rnc> getRncs() {
		return rncs;
	}

	public void setRncs(ArrayList<Rnc> rncs) {
		this.rncs = rncs;
	}	
	
	public int checkProxyConformance(int proxyPercentage, int proxyType) {
	
		// (1)There must be minimum (typeOfProxy + 1) number of rnc in the network
		if (this.fakeRncs.size() < proxyType + 1) {
			return -1;
		}
		
		// (2)
		// Calculation of minimum required number of cells for typeOfProxy 
		int totalNumOfCellsForNetwork = 0;
		for ( Rnc rnc : this.rncs){
			totalNumOfCellsForNetwork += rnc.getTotalNumOfCellsForRnc();
		}
		
		// Minimum number of cells must be exist among rncs in order to allow proxy distribution
		// e.g. 35 out of 100 cells must be found among rncs 
		int minNumOfCellsRequiredForProxyCreation = ((totalNumOfCellsForNetwork * proxyPercentage) / 100);
		
		minNumOfCellsRequiredForProxyCreation = HelperFunctions.getRoundToClosestDivisibleNumber
				(minNumOfCellsRequiredForProxyCreation, proxyType+1);
		
//		System.out.println("minNumOfCellsRequiredForProxyCreation="+minNumOfCellsRequiredForProxyCreation);
		
//		for (FakeRnc fRnc1 : fakeRncs) {
//			 System.out.println(fRnc1.toString());
//		}
						
		// Check for are there enough cells among rncs		
		int totalNumOfCandidateCellsForProxy = 0;		
		
		outer:
		while ( totalNumOfCandidateCellsForProxy < minNumOfCellsRequiredForProxyCreation) {
			Collections.sort(this.fakeRncs, new Comparator<FakeRnc>() {
				@Override
				public int compare(FakeRnc f1, FakeRnc f2) {
					return f2.getNumOfCells() - f1.getNumOfCells();
				}
			});
			
						
			// Checking (typeOfProxy + 1) rncs. Note that array start from 0.
			for (int i = proxyType; i >= 0; i--) {
				
				FakeRnc fRnc1 = fakeRncs.get(i);
				
				// 1st Condition: Make sure that there is a least 1 cell on rnc available
				if (fRnc1.getNumOfCells() == 0)
					break outer;
				
				totalNumOfCandidateCellsForProxy += 1;
				fRnc1.setNumOfCells(fRnc1.getNumOfCells() - 1);				
				
			}
			
			if (totalNumOfCandidateCellsForProxy >= minNumOfCellsRequiredForProxyCreation) {
//				System.out.println("totalNumOfCandidateCellsForProxy="+ totalNumOfCandidateCellsForProxy);
				break outer;
			}			
		}		
		
		Collections.sort(this.fakeRncs, new Comparator<FakeRnc>() {
			@Override
			public int compare(FakeRnc f1, FakeRnc f2) {
				return f1.getRncId() - f2.getRncId();
			}
		});
//		
//		for (FakeRnc fRnc1 : fakeRncs) {
//			 System.out.println(fRnc1.toString());
//		}
		
		if (totalNumOfCandidateCellsForProxy < minNumOfCellsRequiredForProxyCreation) {
			// System.out.println("totalAvailable="+ totalAvailable);
			return -1;
		}		
		
		return 1;
	}
	
	public ProxyHolder createProxies(int proxyPercentage, int proxyType) {
		
		ProxyHolder relHol = null;
				
		// (2)
		// Calculation of minimum required number of cells for typeOfProxy 
		int totalNumOfCellsForNetwork = 0;
		for ( Rnc rnc : this.rncs){
			totalNumOfCellsForNetwork += rnc.getTotalNumOfCellsForRnc();
		}
		
		// Minimum number of cells must be exist among rncs in order to allow proxy distribution
		// e.g. 35 out of 100 cells must be found among rncs 
		int minNumOfCellsRequiredForProxyCreation = ((totalNumOfCellsForNetwork * proxyPercentage) / 100);
		
		minNumOfCellsRequiredForProxyCreation = HelperFunctions.getRoundToClosestDivisibleNumber
				(minNumOfCellsRequiredForProxyCreation, (proxyType + 1));
		
//		System.out.println("minNumOfCellsRequiredForProxyCreation="+minNumOfCellsRequiredForProxyCreation);
						
		// Check for are there enough cells among rncs		
		int totalNumOfCandidateCellsForProxy = 0;	
		
		outer: while (totalNumOfCandidateCellsForProxy < minNumOfCellsRequiredForProxyCreation) {
			Collections.sort(this.rncs, new Comparator<Rnc>() {
				@Override
//				public int compare(Rnc r1, Rnc r2) {
				public int compare(Rnc r1, Rnc r2) {

//					int numOfCellsThatNoProxySet2 = r2.getCellsNumberThatNoProxySet();
//					int numOfCellsThatNoProxySet1 = r1.getCellsNumberThatNoProxySet();
//					
//					int res = Integer.valueOf(numOfCellsThatNoProxySet2).compareTo(numOfCellsThatNoProxySet1);
					
					double numOfCellsThatNoProxySet2 = r2.getCellsNumberThatNoProxySet();
					double numOfCellsThatNoProxySet1 = r1.getCellsNumberThatNoProxySet();
					
					int res = Double.valueOf(numOfCellsThatNoProxySet2).compareTo(numOfCellsThatNoProxySet1);
															
					return res == 0 ? Integer.valueOf(r1.getRncId()).compareTo(r2.getRncId()) : res;

					
//					int res = Integer.valueOf(r1.getRncId()).compareTo(r2.getRncId());
//					return res == 0 ? Integer.valueOf(numOfCellsThatNoProxySet2).compareTo(numOfCellsThatNoProxySet1) : res;
					
					
					
				}
			});
			
			//////////
			int totalNumOfProxy = 0;int numfOfProxyForRnc = 0;	int totalNumOfInterRelation = 0;			
//			for (Rnc rnc01: this.rncs){
//				numfOfProxyForRnc = (rnc01.getTotalNumOfCellsForRnc()-rnc01.getCellsNumberThatNoProxySet());
//				System.out.println("Rnc{rncId=" + rnc01.getRncId()
//						+ ", numOfCells=" + rnc01.getTotalNumOfCellsForRnc()
//						+ ", numOfCellsThatProxySet=" + numfOfProxyForRnc
//						+ ", numOfCellsThatNoProxySet=" +rnc01.getCellsNumberThatNoProxySet());
//				totalNumOfProxy+=numfOfProxyForRnc;
//			}
//			System.out.println("totalNumOfProxy=" + totalNumOfProxy);
//			System.out.println("***********************");
			//////////////////////////

//			ArrayList<Rnc> tempRncs = new ArrayList<Rnc>();
//			
//			int j = 0;
//			int k = 0;
//			while (true){
//				int cellsNumberThatNoProxySet = this.rncs.get(j).getCellsNumberThatNoProxySet();
//				if (cellsNumberThatNoProxySet > 0){
//					k++;
//					tempRncs.add(this.rncs.get(j));
//					if (k == (proxyType + 1)){
//						break;
//					}					
//				}
//				j++;
//			}
			
			ArrayList<Cell> relCellsArray = new ArrayList<Cell>(); 
			for (int i = proxyType; i >= 0; i--) {
//			for (int i = j; i >= (j-proxyType); i--) {

//				Rnc rnc1 = tempRncs.get(i);
				Rnc rnc1 = this.getRncs().get(i);
	
				// 1st Condition: Make sure that there is a least 1 cell on rnc available
				if (rnc1.getCellsNumberThatNoProxySet() == 0)
					break outer;
				
				totalNumOfCandidateCellsForProxy += 1;
				
				Collections.sort(rnc1.getRncCells(), new Comparator<Cell>() {
					@Override
					public int compare(Cell c1, Cell c2) {
						return Integer.valueOf(c1.getNumOfProxyForInterRelations())
								.compareTo(c2.getNumOfProxyForInterRelations());
					}
				});
				
				Cell c1 = rnc1.getRncCells().get(0);
				c1.setNumOfProxyForInterRelations(proxyType);
				c1.setMaxNumOfInterRelation(proxyType);
//				System.out.println(c1.toString()+"proxytype="+proxyType
//						+ " cellsNumberThatNoProxySet=" + rnc1.getCellsNumberThatNoProxySet());				
				relCellsArray.add(c1);				
			}
			
			// creation of default inter relations
			for(Cell c1 : relCellsArray){
//				System.out.println("<><>" + c1.toString());
				
				for(Cell c2 : relCellsArray){
					if(c1.equals(c2)){
						continue;
					}
					if (!c1.getInterRelations().contains(c2)){
						c1.addInterRelation(c2);
					}
				}
			}
			
			
			
			
			if (totalNumOfCandidateCellsForProxy >= minNumOfCellsRequiredForProxyCreation){
//				System.out.println("***********************");
//				System.out.println("::: proxyType=" + proxyType  
//						+ " totalNumOfCandidateCellsForProxy=" + totalNumOfCandidateCellsForProxy);
//				System.out.println("***********************");
				relHol = new ProxyHolder(proxyType, totalNumOfCandidateCellsForProxy);
				break outer;
			}
		}
		
		return relHol;
	}
	
	public void resetProxy() {
		Collections.copy(fakeRncs, backUpFakeRncs);
	}
	
	@Override
	public String toString() {
		return "Proxy [rncs=" + rncs + "]";
	}

}
