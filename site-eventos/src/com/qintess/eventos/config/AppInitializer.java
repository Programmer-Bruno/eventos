package com.qintess.eventos.config;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.Filter;

//Classe iniciada automaticamente pelo Spring
public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() { //Configuração de componentes externos
		return new Class[] {
				HibernateConfig.class
		};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { //Configura o MVC do Spring
		return new Class[] {
			WebMvcConfig.class	
		};
	}

	@Override
	protected String[] getServletMappings() { //Configura o mapeamento do servlet do Spring
		return new String[] {
			"/"	
		};
	}
	
	@Override
	protected Filter[] getServletFilters() {
		
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[] { characterEncodingFilter};
	}

}
