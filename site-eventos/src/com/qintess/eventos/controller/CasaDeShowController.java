package com.qintess.eventos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qintess.eventos.dao.DAO;
import com.qintess.eventos.modelo.CasaDeShow;

@Controller
@RequestMapping("/casadeshow")
public class CasaDeShowController {
	
	@Autowired
	private DAO dao;
	
	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("casasDeShow", dao.buscaTodos(CasaDeShow.class));
		model.addAttribute("casaDeShow", new CasaDeShow());
		return "casadeshow";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute CasaDeShow casaDeShow,
						@RequestParam(required = false, value="cancela") String cancela) {
			
			if (cancela != null) {
				return "redirect:/casadeshow";
			}
			if(casaDeShow.getCodigo() == 0) {
				dao.insere(casaDeShow);
			} else {
				dao.atualiza(casaDeShow);
			}
		
		return "redirect:/casadeshow";
	}
	@RequestMapping("/alterar/{codigo}")
	public String carregaAlterar(@PathVariable(name="codigo") long codigo, Model model) {
		model.addAttribute("casasDeShow", dao.buscaTodos(CasaDeShow.class));
		model.addAttribute("casaDeShow", dao.buscaPorID(CasaDeShow.class, codigo));
		return "casadeshow";
	}
	
	@RequestMapping("/deleta/{codigo}")
	public String deleta(@PathVariable(name="codigo") long codigo) {
		CasaDeShow casaDeShow = dao.buscaPorID(CasaDeShow.class, codigo);
		dao.remove(casaDeShow);
		return "redirect:/casadeshow";  
	}

		
}
