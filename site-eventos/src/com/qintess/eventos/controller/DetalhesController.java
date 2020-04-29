package com.qintess.eventos.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qintess.eventos.dao.DAO;
import com.qintess.eventos.modelo.Evento;

@Controller
@RequestMapping("/detalhe")
public class DetalhesController {

	@Autowired
	private DAO dao;
	
	@RequestMapping("/{codigo}")
	public String index(Model model, @PathVariable(name = "codigo") long codigo) {
		
		try {
			Evento evento = dao.buscaPorID(Evento.class, codigo);
			byte[] encodeBase64 = Base64.getEncoder().encode(evento.getImagemProd());
			String base64Encoded = new String(encodeBase64, "UTF-8");
			
			evento.setImagemEncoded(base64Encoded);
			model.addAttribute("evento", evento);
			
			
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "detalhe";
	}
}
