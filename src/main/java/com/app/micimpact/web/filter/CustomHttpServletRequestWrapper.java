package com.app.micimpact.web.filter;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.IOUtils;

public class CustomHttpServletRequestWrapper extends HttpServletRequestWrapper{
	private byte[] b;
	public CustomHttpServletRequestWrapper(HttpServletRequest request) throws IOException {
		super(request);
		InputStream is = super.getInputStream();
		b = IOUtils.toByteArray(is);
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		final ByteArrayInputStream bis = new ByteArrayInputStream(b);
		return new ServletImpl(bis);
	}

	class ServletImpl extends ServletInputStream {
		private InputStream is;
		public ServletImpl(InputStream bis) {
			is = bis;
		}
		@Override
		public int read() throws IOException {
			return is.read();
		}

		@Override
		public int read(byte[] b) throws IOException {
			return is.read(b);
		}
	}
}