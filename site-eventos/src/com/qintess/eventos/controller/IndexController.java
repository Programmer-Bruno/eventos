package com.qintess.eventos.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qintess.eventos.dao.DAO;
import com.qintess.eventos.modelo.Evento;

@Controller
public class IndexController {

	@Autowired
	private DAO dao;
	
	@RequestMapping("/")
	public String index(Model model,
						@RequestParam(required= false, value="nome") String nome) {
		try {
			if(nome == null) {
				List<Evento> eventos = dao.buscaTodos(Evento.class);
				model.addAttribute("eventos", encodaImagemEvento(eventos));
			}else {
				
				//List<Evento> eventos2 = dao.buscaPorNome(Evento.class, nome);
				//model.addAttribute("eventos2", encodaImagemEvento(eventos2));
			}
			
		} catch (UnsupportedEncodingException e) {
			model.addAttribute("mensagemErro", "ERRO GRAVE: " + e.getMessage());
		}
		return "index";
	}
	
	private List<Evento> encodaImagemEvento(List<Evento> eventos) throws UnsupportedEncodingException {
		
		for(Evento evento : eventos) {
			byte[] encodeBase64 = Base64.getEncoder().encode(evento.getImagemProd());
			evento.setImagemEncoded(new String(encodeBase64, "UTF-8"));
		}
		return eventos;
	}
}
