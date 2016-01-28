package com.wb.nextgen.data.managers;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.wb.nextgen.data.models.Inventory;

public class NextGenDataManager {

	private static NextGenDataManager instance = null;
	
	private Inventory inventory;
	
	protected NextGenDataManager() {
		
	}
	
	public static NextGenDataManager getInstance() {
		if (instance == null) {
			instance = new NextGenDataManager();
		}
		
		return instance;
	}
	
	public void parseXML() {
		File xmlFile = new File("/Users/alec/Desktop/mos_hls_manifest_v3.xml");
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		Document doc = null;
		
		try {
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			doc = dBuilder.parse(xmlFile);
		} catch (ParserConfigurationException | SAXException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (doc == null) {
			return;
		}
		
		doc.getDocumentElement().normalize();
		
		NodeList nodeList = doc.getElementsByTagName(Inventory.NODE_ROOT);
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				this.inventory = new Inventory((Element) node);
				break;
			}
		}
	}
	
	public Inventory getInventory() {
		return this.inventory;
	}
	
}
