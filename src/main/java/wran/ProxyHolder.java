package wran;

import java.io.Serializable;

public class ProxyHolder implements Serializable{
	
	private static final long serialVersionUID = 5;
	
	private int proxyType = 0;
	private int numOfProxy = 0;
	private  static int totalNumOfProxy = 0;
	
	public ProxyHolder(int proxyType, int numOfProxy) {
		super();
		this.proxyType = proxyType;
		this.numOfProxy = numOfProxy;
		totalNumOfProxy+= numOfProxy;
	}
	
	

	public static int getTotalNumOfProxy() {
		return totalNumOfProxy;
	}

	public int getProxyType() {
		return proxyType;
	}

	public void setProxyType(int proxyType) {
		this.proxyType = proxyType;
	}

	public int getNumOfProxy() {
		return numOfProxy;
	}

	public void setNumOfProxy(int numOfProxy) {
		this.numOfProxy = numOfProxy;
	}	


}
