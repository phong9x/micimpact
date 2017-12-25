package com.app.micimpact.web.common;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.ui.Model;


public class Pager<T> {
	public static int PAGE_SIZE = 10;
	
	private Page<T> m_page;
	private List<T> m_list;
	private Model 	m_model;
	
	public Pager(Page<T> list, Model model)
	{
		m_page = list;
		m_model= model;
		m_model.addAttribute("param_url", "");
		m_model.addAttribute("exception", false);
	}
	
	public Pager(List<T> list, Model model)
	{
		m_list = list;
		m_model= model;
		m_model.addAttribute("param_url", "");
		m_model.addAttribute("exception", false);
	}
	
	// for page<T>. Don't use if Pager is instance of list
	public void pageSetting(String url)
	{
		int current = m_page.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, m_page.getTotalPages());
		
		m_model.addAttribute("list", m_page.getContent());
		m_model.addAttribute("beginIndex", begin);
		m_model.addAttribute("endIndex", end);
		m_model.addAttribute("currentIndex", current);
	    m_model.addAttribute("totalCount", m_page.getTotalElements());
	    m_model.addAttribute("totalPages", m_page.getTotalElements() / BasicEnvironment.PAGE_SIZE + 1);
	    m_model.addAttribute("url", url);
	    m_model.addAttribute("size", m_page.getSize());
	}
	
	// for list<T>. Don't use if Pager is instance of page
	public void setSetting(String url, int iTotalCount, int iPageNumber)
	{
		int current = iPageNumber;
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, iTotalCount / BasicEnvironment.PAGE_SIZE + 1);
		
		m_model.addAttribute("beginIndex", begin);
		m_model.addAttribute("endIndex", end);
		m_model.addAttribute("currentIndex", current);
		m_model.addAttribute("totalCount", iTotalCount);
		m_model.addAttribute("totalPages", iTotalCount / BasicEnvironment.PAGE_SIZE + 1);
		m_model.addAttribute("url", url);
		m_model.addAttribute("size", m_list.size());
		m_model.addAttribute("list", m_list);
	}
	
	public void setParams(String[] keys, String[] values)
	{
		StringBuffer buf = new StringBuffer();
		
		for (int i = 0; i < keys.length; i++)
		{
			buf.append(keys[i]);
			buf.append('=');
			buf.append(values[i]);
			
			if (i != keys.length - 1)
				buf.append("&");
		}		
		
		m_model.addAttribute("param_url", buf.toString());
	}
}
