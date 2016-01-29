package com.wb.nextgen.data.shared;

import java.util.HashMap;
import java.util.Map;

public class LanguageStringList {
	
	private Map<String, String> languageMap = new HashMap<String, String>();

	public void addLanguageString(String language, String text) {
		this.languageMap.put(language, text);
	}
	
	public String getTextForLanguage(String language) {
		return this.languageMap.get(language);
	}
	
}
