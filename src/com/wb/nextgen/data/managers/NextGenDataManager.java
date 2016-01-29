package com.wb.nextgen.data.managers;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

import com.wb.nextgen.data.appgroups.AppGroup;
import com.wb.nextgen.data.inventory.Inventory;
import com.wb.nextgen.data.picturegroups.PictureGroup;
import com.wb.nextgen.data.presentations.Presentation;

public class NextGenDataManager {

	private static NextGenDataManager instance = null;
	
	private final String NODE_PRESENTATIONS = "manifest:Presentations";
	private final String NODE_PICTURE_GROUPS = "manifest:PictureGroups";
	private final String NODE_APP_GROUPS = "manifest:AppGroups";
	
	private Inventory inventory;
	private Map<String, Presentation> presentationsMap = new HashMap<String, Presentation>();
	private Map<String, PictureGroup> pictureGroupsMap = new HashMap<String, PictureGroup>();
	private Map<String, AppGroup> appGroupsMap = new HashMap<String, AppGroup>();
	
	protected NextGenDataManager() {
		
	}
	
	public static NextGenDataManager getInstance() {
		if (instance == null) {
			instance = new NextGenDataManager();
		}
		
		return instance;
	}
	
	public void parseXML(String pathToXml) {
		File xmlFile = new File(pathToXml);
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
		
		NodeList childNodes = doc.getChildNodes(); doc.getElementsByTagName(Inventory.NODE_ROOT);
		for (int i = 0; i < childNodes.getLength(); i++) {
			Node childNode = childNodes.item(i);
			if (childNode.getNodeType() == Node.ELEMENT_NODE) {
				Element nodeElement = (Element) childNode;
				NodeList subNodes;
				
				switch (nodeElement.getNodeName()) {
				case Inventory.NODE_ROOT:
					this.inventory = new Inventory(nodeElement);
					break;
					
				case NODE_PRESENTATIONS:
					subNodes = nodeElement.getElementsByTagName(Presentation.NODE_ROOT);
					for (int j = 0; j < subNodes.getLength(); i++) {
						Node subNode = subNodes.item(i);
						if (subNode.getNodeType() == Element.ELEMENT_NODE) {
							Element subNodeElement = (Element) subNode;
							Presentation presentation = new Presentation(subNodeElement);
							this.presentationsMap.put(presentation.presentationId, presentation);
						}
					}
					break;
					
				case NODE_PICTURE_GROUPS:
					subNodes = nodeElement.getElementsByTagName(PictureGroup.NODE_ROOT);
					for (int j = 0; j < subNodes.getLength(); i++) {
						Node subNode = subNodes.item(i);
						if (subNode.getNodeType() == Element.ELEMENT_NODE) {
							Element subNodeElement = (Element) subNode;
							PictureGroup pictureGroup = new PictureGroup(subNodeElement);
							this.pictureGroupsMap.put(pictureGroup.pictureGroupId, pictureGroup);
						}
					}
					break;
					
				case NODE_APP_GROUPS:
					subNodes = nodeElement.getElementsByTagName(AppGroup.NODE_ROOT);
					for (int j = 0; j < subNodes.getLength(); i++) {
						Node subNode = subNodes.item(i);
						if (subNode.getNodeType() == Element.ELEMENT_NODE) {
							Element subNodeElement = (Element) subNode;
							AppGroup appGroup = new AppGroup(subNodeElement);
							this.appGroupsMap.put(appGroup.appGroupId, appGroup);
						}
					}
					break;
				}
			}
		}
	}
	
	public Inventory getInventory() {
		return this.inventory;
	}
	
}
