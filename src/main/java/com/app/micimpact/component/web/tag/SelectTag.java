package com.app.micimpact.component.web.tag;

import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.taglibs.standard.lang.support.ExpressionEvaluatorManager;
import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;

public class SelectTag extends TagSupport {
	private static final long serialVersionUID = -3180901991236233768L;

	protected String name;

	protected String attribute = "";

	protected String view = "select";

	protected String key;  			// map 인 경우 보내줄 값이 있는 키  

	protected String display; 		// map 인 경우 보내줄 이름이 있는 키  

	protected String defaultValue; 	// value

	protected String header;		// 처음 아이템 기본 값 이름

	protected List<Object> list;	// 내부에서 쓸 리스트 값

	protected String items;			// input 으로 들어올 아이템

	protected String onclick; 		// click event

	protected String cssclass = "code"; 	// css class

	public void setKey(String key) {
		this.key = key;
	}

	@SuppressWarnings("unchecked")
	public void setItems(String items) throws JspException {
		if (items.startsWith("{")) {
			String[] array = items.substring(1, items.length() - 1)
					.split("\\|");
			
			this.list = new ArrayList<Object>(array.length);
			for (int i = 0; i < array.length; i++) {
				this.list.add(array[i].split(","));
			}

			return;
		}
		else if (items.startsWith("["))
		{
			String[] array = items.substring(1, items.length() - 1)
					.split(",");
			
			this.list = new ArrayList<Object>(array.length);
			for (int i = 0; i < array.length; i++) {
				this.list.add(array[i].split("\\|"));
			}

			return;
		}
		
		
				
		this.list = (List<Object>)(ExpressionUtil.evalNotNull("select", "items", items, List.class, this, this.pageContext));
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setView(String view) {
		this.view = view;
	}

	public void setOnclick(String onclick) {
		this.onclick = onclick;
	}

	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public void setAttribute(String attribute) {
		this.attribute = (attribute == null ? "" : attribute);
	}


	public void setDefault(String defaultValue) throws JspException {
		this.defaultValue = ((String) ExpressionUtil.evalNotNull("select",
				"default", defaultValue, String.class, this, this.pageContext));
	}

	public void setHeader(String header) {
		this.header = header;
	}

	public int doEndTag() throws JspException {
		try {
			render(this.defaultValue, this.list, this.pageContext.getRequest().getLocale());
		} catch (IOException e) {
			throw new JspException(e);
		}
		return 6;
	}

	
	protected void render(String selectedValue, List<Object> list, Locale locale)
      throws IOException
    {
	     JspWriter out = this.pageContext.getOut();
	      
	     if (this.view == null) {
	    	 this.view = "select";
	      }
	      
	     if ((this.view.equalsIgnoreCase("radio")) || (this.view.equalsIgnoreCase("checkbox"))) {
	    	 
	    	 if (this.header!=null && this.header.trim().length() > 0)
	    		 out.print(getHeader(locale));
	    	 
	    	 for (Iterator<Object> it = list.iterator(); it.hasNext();) {
	    	 		Object item = it.next();
	    	 		String checked = getProperty(item, this.key).equals(selectedValue) ? " checked" : "";
	    	 		out.print(getHtmlTag(item, checked, locale));
	    	 }
	     } 
	     else if (this.view.equalsIgnoreCase("select"))
	     {
		      out.print("<select id=\"" + 
		         this.name + 
		        "\" name=\"" + 
		         this.name + 
		         "\" " + 
		         this.attribute + (
		        this.cssclass != null ? " class=\"" + this.cssclass + 
		         "\"" : "") + (
		         this.onclick != null ? " onchange=\"" + this.onclick + 
		         "\"" : "") + " >");
		        
		      if (!"".equals(this.header)) 
		      {
		         out.print(getHeader(locale));
		      }
		      
		      for (Iterator<Object> it = list.iterator(); it.hasNext();) 
		      {
		        Object item = it.next();
		        String checked = getProperty(item, this.key).equals(selectedValue) ? " selected=\"selected\"" : 
		           "";
					out.print(getHtmlTag(item, checked, locale));
		      }
		      out.print("</select>");
		 } 
	     else 
	     {
	    	 throw new IOException();
		 }
    }

	private String getHtmlTag(Object item, String checked, Locale locale) {
		String itemId = item == null ? "" : getProperty(item, this.key);
		String itemName = item == null ? this.header : getProperty(item, this.display);
		if ((this.view.equalsIgnoreCase("radio"))
				|| (this.view.equalsIgnoreCase("checkbox"))) {
			return "<input type=\""
					+ this.view
					+ "\" name=\""
					+ this.name
					+ "\" "
					+ " value=\""
					+ itemId
					+ "\""
					+ checked
					+ " "
					+ this.attribute
					+ (this.cssclass != null ? " class=\"" + this.cssclass
							+ "\"" : "")
					+ (this.onclick != null ? " onchange=\"" + this.onclick
							+ "\"" : "") + "\"> " + itemName + "</input>";
		}
		return "<option value=\"" + itemId + "\"" + checked + ">" + itemName
				+ "</option>";
	}

	@SuppressWarnings("unchecked")
	private String getProperty(Object obj, String property) {
		if ((obj instanceof Map)) {
			Object result = ((Map<String, Object>) obj).get(property);
			return result == null ? "" : result.toString();
		}
		
		if (obj.getClass().isArray()) {
			
			return Array.get(obj, Integer.parseInt(property)).toString();
		}
		
		char[] chs = property.toCharArray();
		chs[0] = Character.toUpperCase(chs[0]);
		try {
			Method m = obj.getClass().getMethod("get" + new String(chs), null);
			Object result = m.invoke(obj, null);
			return result == null ? "" : result.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	private String getHeader(Locale locale) {
		String checked = "";
		
		if ((this.view.equalsIgnoreCase("radio"))
				|| (this.view.equalsIgnoreCase("checkbox"))) {
			checked = (this.defaultValue != null)
					&& (this.defaultValue.equals("")) ? "checked" : "";
		} else {
			checked = (this.defaultValue != null)
					&& (this.defaultValue.equals("")) ? "selected" : "";
		}
		
		return getHtmlTag(null, checked, locale);
	}
}
