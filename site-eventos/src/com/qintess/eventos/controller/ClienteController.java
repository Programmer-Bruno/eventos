package com.qintess.eventos.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qintess.eventos.dao.DAO;
import com.qintess.eventos.modelo.Cliente;

@Controller
@RequestMapping("/cliente")
public class ClienteController {

	@Autowired
	private DAO dao;
	
	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("clientes", dao.buscaTodos(Cliente.class));
		model.addAttribute("cliente", new Cliente());
		return "cliente";
	}
	
	@RequestMapping("/salva")
	public String salva(@ModelAttribute Cliente cliente,
						@RequestParam(required = false, value="cancela") String cancela) {
			
			if (cancela != null) {
				return "redirect:/cliente";
			}
			if(cliente.getCodigo() == 0) {
				dao.insere(cliente);
			} else {
				dao.atualiza(cliente);
			}
		
		return "redirect:/cliente";
	}
	@RequestMapping("/alterar/{codigo}")
	public String carregaAlterar(@PathVariable(name="codigo") long codigo, Model model) {
		model.addAttribute("clientes", dao.buscaTodos(Cliente.class));
		model.addAttribute("cliente", dao.buscaPorID(Cliente.class, codigo));
		return "cliente";
	}
	
	@RequestMapping("/deleta/{codigo}")
	public String deleta(@PathVariable(name="codigo") long codigo) {
		Cliente cliente = dao.buscaPorID(Cliente.class, codigo);
		dao.remove(cliente);
		return "redirect:/cliente";  
	}
}
