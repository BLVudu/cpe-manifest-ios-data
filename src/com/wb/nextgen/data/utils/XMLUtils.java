package com.wb.nextgen.data.utils;

import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class XMLUtils {
	
	public static Element getSingleChildElement(Element parentElement, String nodeName) {
		NodeList nodeList = parentElement.getElementsByTagName(nodeName);
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if (node.getNodeName().equals(nodeName)) {
				return (Element) node;
			}
		}
		
		return null;
	}

}
