package com.qintess.eventos.controller;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.qintess.eventos.dao.DAO;
import com.qintess.eventos.modelo.CasaDeShow;
import com.qintess.eventos.modelo.Evento;
import com.qintess.eventos.modelo.Venda;
import com.qintess.eventos.modelo.VendaIngresso;

@Controller
@RequestMapping("/evento")
public class EventoController {

	@Autowired
	private DAO dao;

	@RequestMapping("")
	public String carrega(Model model) {
		model.addAttribute("eventos", dao.buscaTodos(Evento.class));
		model.addAttribute("evento", new Evento());
		model.addAttribute("casasDeShow", dao.buscaTodos(CasaDeShow.class));
		
		return "evento";
	}

	@RequestMapping("/salva")
	public String salva(@ModelAttribute Evento evento,
			@RequestParam(required = false, value = "casaDeShowID") long casaDeShowID,
			@RequestParam(required = false, value = "cancela") String cancela,
			@RequestParam(required = false, value = "imagem") MultipartFile imagem) {

		byte[] bImagem;

		try {
			if (cancela != null) {
				return "redirect:/evento";
			}

			if (imagem != null && imagem.getSize() > 0) {
				bImagem = imagem.getBytes();
				evento.setImagemProd(bImagem);

			}
			evento.setCasaDeShow(dao.buscaPorID(CasaDeShow.class, casaDeShowID));
			if (evento.getCodigo() == 0) {
				dao.insere(evento);
			} else {
				dao.atualiza(evento);
			}
			
		} catch (Exception e) {
		}

		return "redirect:/evento";
	}

	@RequestMapping("/alterar/{codigo}")
	public String carregaAlterar(@PathVariable(name = "codigo") long codigo, Model model,
								 RedirectAttributes attributes) {
		try {
		Evento evento = dao.buscaPorID(Evento.class, codigo);
		byte[] encodeBase64 = Base64.getEncoder().encode(evento.getImagemProd());
		String base64Encoded = new String(encodeBase64, "UTF-8");
		model.addAttribute("casasDeShow", dao.buscaTodos(CasaDeShow.class));
		
		model.addAttribute("eventos", dao.buscaTodos(Evento.class));
		model.addAttribute("evento", evento);
		evento.setImagemEncoded(base64Encoded);
		//model.addAttribute("imagemProduto", base64Encoded);
		} catch (UnsupportedEncodingException e) {
			attributes.addFlashAttribute("mensagemErro", "ERRO GRAVE: " + e.getMessage());
		}
		return "evento";
	}

	@RequestMapping("/deleta/ {codigo}")
	public String deleta(@PathVariable(name = "codigo") long codigo) {
		Evento evento = dao.buscaPorID(Evento.class, codigo);
		dao.remove(evento);
		return "redirect:/evento";
	}
	
	@RequestMapping("/comprar/")
	public String comprar(@RequestParam(value="codigoEvento") long codigoEvento,
						  @RequestParam(value="quantidade") int quantidade) {
		//Recupera o evento pelo ID
		Evento evento = dao.buscaPorID(Evento.class, codigoEvento);
		//Pegar a quantidade
		double total = quantidade * evento.getPreco();
		//Somar total. Quantidade x evento.preco
		Venda venda = new Venda(total);
		VendaIngresso vendaIngresso = new VendaIngresso(quantidade, evento.getPreco(), evento, venda);
		venda.addIngresso(vendaIngresso);
		evento.setQuant_ingresso(evento.getQuant_ingresso() - quantidade);
		dao.atualiza(evento);
		dao.insere(venda);

		return "redirect:/";
	}
}
